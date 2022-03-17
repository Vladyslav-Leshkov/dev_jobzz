<?php

namespace App\Services;

use App\Events\DataOpened;
use App\Events\MessageReceived;
use App\Events\MessageSeen;
use App\Models\Auth\User;
use App\Models\Job\CandidateProfile;
use App\Models\Job\Offer;
use App\Models\Messenger\ChatMessage;
use App\Services\Frontend\Job\CandidateService;
use App\Services\Frontend\Job\VacancyService;
use Illuminate\Broadcasting\BroadcastException;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\DB;
use Exception;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class MessengerService extends BaseService
{

    /**
     * @param Offer $offer
     *
     * @return ChatMessage|boolean
     */
    public static function sendOfferMessage(Offer $offer)
    {
        DB::beginTransaction();

        try {
            $attachment = null;
            if (!empty($offer->resume)) {
                $attachment = self::makeAttachment($offer->resume, $offer->resume_name);
            }


            $view_data = [
                'body' => nl2br(clickableLinks(htmlentities(trim($offer->comment)), ENT_QUOTES, 'UTF-8')),
                'attachment' => $attachment,
            ];
            if ($offer->initiator === Offer::INITIATOR_RECRUITER) {
                $view_data['vacancyUrl'] = "<a href=" . $offer->vacancy->url . "  target='_blank'>" . $offer->vacancy->title . "</a>";
            }

            $body = view('frontend.messenger.includes.message', $view_data)->render();

            $message = ChatMessage::create([
                'from_id' => $offer->initiator === Offer::INITIATOR_RECRUITER ? $offer->recruiter_id : $offer->profile->user_id,
                'to_id' => $offer->initiator === Offer::INITIATOR_RECRUITER ? $offer->profile->user_id : $offer->recruiter_id,
                'body' => $body,
                'type' => 'offer',
                'seen' => 0,
                'attachment' => $attachment,
            ]);

            MessageReceived::dispatch($message);
            //pusherEvent(new MessageReceived($message));
        } catch (BroadcastException $e) {
            Log::error($e->getMessage(), $e->getTrace());
        } catch (Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage(), $e->getTrace());

            return false;
        }

        DB::commit();

        return $message;
    }

    public static function makeAttachment($filename, $attachment_title)
    {
        if (Storage::exists($filename)) {
            $ext = pathinfo($filename, PATHINFO_EXTENSION);
            $attachment = Str::uuid() . "." . $ext;
            Storage::copy($filename, "public/" . config('messenger.attachments.folder') . '/' . $attachment);

            return [
                'file_name' => $attachment,
                'title' => $attachment_title,
            ];
        }

        return null;
    }

    public static function sendProfileMessage($form_id, $to_id, $params = [])
    {
        DB::beginTransaction();
        $profile = CandidateProfile::where('user_id', $form_id)->firstOrFail();

        try {
            $params_data = json_decode($params['data'] ?? '{}', true);
            $data = [
                'from_id' => $form_id,
                'to_id' => $to_id,
                'type' => 'profile',
                'seen' => 0,
                'attachment' => null,
            ];

            $attachment = null;

            if (isset($params['file'])) {
                $attachment = self::uploadAttachment($params['file']);
            } elseif (array_key_exists('resume', $params_data) && $params_data['resume']) {
                $attachment = self::makeAttachment($profile->resume, $params_data['resume']);
            }

            if ($attachment !== null) {
                $data['attachment'] = $attachment;
                $params_data['attachment'] = $attachment;
            }

            unset($params_data['resume']);

            $html = view('frontend.messenger.includes.profile', [
                'profile' => $profile,
                'body' => $params['body'],
                'data' => $params_data,
            ])->render();

            $data['body'] = $html;

            $message = ChatMessage::create($data);

            $open_data = CandidateService::openData($form_id, $to_id, $params_data);

            MessageReceived::dispatch($message);
            DataOpened::dispatch($open_data);
            //pusherEvent(new MessageReceived($message));
            //pusherEvent(new DataOpened($open_data));
        } catch (BroadcastException $e) {
            Log::error($e->getMessage(), $e->getTrace());
        } catch (Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage(), $e->getTrace());

            return false;
        }

        DB::commit();

        return $message;
    }

    private static function uploadAttachment(UploadedFile $file)
    {
        $attachment_title = $file->getClientOriginalName();
        $attachment = Str::uuid() . "." . $file->getClientOriginalExtension();
        $result = $file->storeAs("public/" . config('messenger.attachments.folder'), $attachment);
        if ($result !== false) {
            return [
                'file_name' => $attachment,
                'title' => $attachment_title,
            ];
        }

        return null;
    }

    public static function sendHiringMessage(User $fromUser, User $toUser, $params = [])
    {
        DB::beginTransaction();

        try {
            $params_data = json_decode($params['data'] ?? '{}', true);

            $data = [
                'from_id' => $fromUser->id,
                'to_id' => $toUser->id,
                'type' => 'hiring',
                'body' => $params['body'] ?? '',
                'seen' => 0,
                'attachment' => null,
            ];

            $candidate = $fromUser->type === User::TYPE_CANDIDATE ? $fromUser : $toUser;
            $recruiter = $fromUser->type === User::TYPE_RECRUITER ? $fromUser : $toUser;
            $params_data['initiator_id'] = $fromUser->id;
            VacancyService::confirmFromMessenger($candidate, $recruiter, $params_data);

            $message = ChatMessage::create($data);

            MessageReceived::dispatch($message);
            //pusherEvent(new MessageReceived($message));
        } catch (BroadcastException $e) {
            Log::error($e->getMessage(), $e->getTrace());
        } catch (Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage(), $e->getTrace());

            return ['result' => 'error'];
        }

        DB::commit();

        return $message;
    }

    public static function sendMessage($form_id, $to_id, $params = [], $as_html = false)
    {
        DB::beginTransaction();

        try {
            $attachment = null;
            if (isset($params['file'])) {
                $attachment = self::uploadAttachment($params['file']);
            }

            $body = view('frontend.messenger.includes.message', [
                'body' => $as_html ? $params['body'] ?? '' : nl2br(htmlentities(trim($params['body'] ?? ''), ENT_QUOTES, 'UTF-8')),
                'attachment' => $attachment,
            ])->render();

            $data = [
                'from_id' => $form_id,
                'to_id' => $to_id,
                'body' => $body,
                'type' => 'message',
                'seen' => 0,
                'attachment' => $attachment,
            ];

            $message = ChatMessage::create($data);
            MessageReceived::dispatch($message);


            //pusherEvent(new MessageReceived($message));
        } catch (BroadcastException $e) {
            Log::error($e->getMessage(), $e->getTrace());
        } catch (Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage(), $e->getTrace());

            return false;
        }

        DB::commit();

        return $message;
    }

    public static function getSupportUser($current_id)
    {
        /**
         * @var User $support_user
         */
        $support_user = User::whereType('support')->first();

        return $support_user->asMessengerContact($current_id);
    }

    public static function fetchMessages($first_id, $second_id)
    {
        return self::fetchQuery($first_id, $second_id)
            ->with(['fromUser', 'toUser'])->paginate(20);
    }

    /**
     * @param $first_id
     * @param $second_id
     *
     * @return \Illuminate\Database\Query\Builder|Builder|ChatMessage
     */
    public static function fetchQuery($first_id, $second_id)
    {
        return ChatMessage::whereRaw('(from_id = ? AND to_id = ? ) OR (from_id = ? AND to_id = ?)', [$second_id, $first_id, $first_id, $second_id])
            ->orderByDesc('created_at');
    }

    public static function seenMessages(User $current_user, $from_id, $last_id = 0)
    {
        if ($current_user->isAdmin() || $current_user->isSupport()) {
            $messagesQuery = ChatMessage::query()->where('to_id', User::SUPPORT_USER_ID);
        } else {
            $messagesQuery = $current_user->incomingMessages();
        }

        $ids = $messagesQuery
            ->where('from_id', $from_id)
            ->where('seen', 0)
            ->where('id', '<=', $last_id)
            ->get(['id'])->pluck('id')->toArray();

        if (count($ids) > 0) {
            ChatMessage::whereIn('id', $ids)->update(['seen' => 1]);

            try {
                MessageSeen::dispatch($from_id, $current_user->id, $ids);
            } catch (BroadcastException $e) {
                Log::error($e->getMessage(), $e->getTrace());
            }
        }

        return $ids;
    }

    public static function unreadCount($user_id)
    {
        return ChatMessage::query()->where('to_id', $user_id)->where('seen', 0)->count();
    }

    public static function unreadMessages($user_id, $limit = 5)
    {
        return ChatMessage::query()->where('to_id', $user_id)->with(['fromUser'])->where('seen', 0)
            ->orderBy('created_at', 'desc')->groupBy(['from_id'])->take($limit)->get();
    }

    public static function lastMessage($first_id, $second_id)
    {
        return self::fetchQuery($first_id, $second_id)->first();
    }


    public static function updateMessageBody($id, $body)
    {
        $message = ChatMessage::findOrFail($id);
        $body = view('frontend.messenger.includes.message', [
            'body' => nl2br(htmlentities(trim($body ?? ''), ENT_QUOTES, 'UTF-8')),
            'attachment' => null,
        ])->render();
        $message->body = $body;
        $message->edited = true;
        $message->seen = false;
        $message->save();
        MessageReceived::dispatch($message);
        return $message;
    }
}
