<?php

namespace App\Http\Controllers\Frontend\Messenger;

use App\Http\Controllers\Controller;
use App\Http\Requests\SendMessageRequest;
use App\Http\Requests\UpdateMessageRequest;
use App\Models\Auth\User;
use App\Models\Job\CandidateOpenData;
use App\Models\Messenger\ChatMessage;
use App\Notifications\CandidateOpenContact;
use App\Notifications\NewChatMessages;
use App\Notifications\PushChatMessage;
use App\Services\MessengerService;
use App\Services\NotificationService;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Log;

class MessengerController extends Controller
{
    public function index()
    {
        $current_user = current_user()->shortInfo();
        $support_user = MessengerService::getSupportUser($current_user['id']);
        $contacts = current_user()->candidateContacts();

        return view('frontend.messenger.index', compact('current_user', 'support_user', 'contacts'));
    }

    public function unread()
    {
        $current_user = current_user();
        $user_id = $current_user->isAdmin() || $current_user->isSupport() ? User::SUPPORT_USER_ID : $current_user->id;

        return MessengerService::unreadCount($user_id);
    }

    public function unreadMessages(Request $request)
    {
        $current_user = current_user();
        $user_id = $current_user->isAdmin() || $current_user->isSupport() ? User::SUPPORT_USER_ID : $current_user->id;
        $limit = $request->input('limit', 5);

        return [
            'messages' => MessengerService::unreadMessages($user_id, $limit),
            'total' => MessengerService::unreadCount($user_id),
        ];
    }

    //

    /**
     * This method to make a links for the attachments
     * to be downloadable.
     *
     * @param string $fileName
     */
    public function download(Request $request, $fileName)
    {
        $path = storage_path() . '/app/public/' . config('messenger.attachments.folder') . '/' . $fileName;
        if (file_exists($path)) {
            return response()->download($path, $request->input('name', $fileName));
        }
        abort(404, __("Sorry, File does not exist in our server or may have been deleted!"));
    }

    public function fetchContacts(Request $request)
    {
        $current_user = current_user();
        if ($current_user->isBlocked()) {
            return [];
        }
        $page = $request->input('page', 1);
        $q = $request->input('q', '');
        return $current_user->getMessengerContacts($page, $q);
    }

    public function fetchMessages(User $user)
    {
        $current_user = current_user();
        $user_id = $current_user->isAdmin() || $current_user->isSupport() ? User::SUPPORT_USER_ID : $current_user->id;
        $paginator = MessengerService::fetchMessages($user_id, $user->id);
        $opened_contacts = $user->isCandidate() && $user->isContactOpenTo($current_user->id);
        $candidate_url = $user->getCandidateUrl();

        $paginator->getCollection()->transform(function (ChatMessage $message) use ($user, $current_user, $opened_contacts, $candidate_url) {
            // Your code here
            if ($current_user->isRecruiter() && $user->isCandidate() && !$opened_contacts) {
                if ($message->fromUser->id === $user->id) {
                    $message->fromUser->first_name = __('Profile');
                    $message->fromUser->last_name = __('Hidden');
                    $message->fromUser->avatar = null;
                }
                if ($message->toUser->id === $user->id) {
                    $message->toUser->first_name = __('Profile');
                    $message->toUser->last_name = __('Hidden');
                    $message->toUser->avatar = null;
                }
            }

            if ($message->fromUser->id !== $current_user->id && $message->fromUser->isCandidate()) {
                $message->fromUser->setAttribute('url', $candidate_url);
            }
            return $message;
        });

        return $paginator;
    }

    public function sendMessage(SendMessageRequest $request, User $user)
    {
        $fromUser = current_user();

        if ($fromUser->isBlocked() && !$user->isSupport() && !$user->isAdmin()) {
            abort(403);
        }

        if ($fromUser->isAdmin() || $fromUser->isSupport()) {
            $fromUser = User::supportUser();
        }

        if ($request->type === 'profile') {
            $message = MessengerService::sendProfileMessage($fromUser->id, $user->id, $request->validated());
            // Уведомление рекрутеру об открытии контактов
            NotificationService::openContactNotification($user, $fromUser);

        } elseif ($request->type === 'hiring') {
            $message = MessengerService::sendHiringMessage($fromUser, $user, $request->validated());
        } else {
            $message = MessengerService::sendMessage($fromUser->id, $user->id, $request->validated());
        }


        if ($message !== false) {
            NotificationService::chatMessageNotification($user, $message);

            $message = $message->toArray();
            $message['from_user'] = $fromUser->shortInfo();
            $message['to_user'] = $user->shortInfo([], $fromUser->isRecruiter() && !$user->isContactOpenTo($user->id));
            return $message;
        }
        abort(400, 'Сообщение не отправлено');
    }

    public function updateMessage(UpdateMessageRequest $request)
    {
        $message = MessengerService::updateMessageBody($request->id, $request->body);
        $fromUser = $message->fromUser->shortInfo();
        $toUser = $message->toUser->shortInfo();
        $message = $message->toArray();
        $message['from_user'] = $fromUser;
        $message['to_user'] = $toUser;
        return $message;
    }

    public function seenMessage(Request $request, User $user)
    {
        $current_user = current_user();
        $user_id = $current_user->isAdmin() || $current_user->isSupport() ? User::SUPPORT_USER_ID : $current_user->id;

        return [
            'ids' => MessengerService::seenMessages($current_user, $user->id, $request->last_id),
            'unread' => MessengerService::unreadCount($user_id),
        ];
    }

    public function resume(User $user)
    {
        $current_user = current_user();
        $data = CandidateOpenData::where([['candidate_id', $user->id], ['recruiter_id', $current_user->id]])->firstOrFail();

        return view('frontend.messenger.includes.profile', ['body' => '', 'data' => $data->data]);
    }

    public function vacancies(User $user)
    {
        return $user->vacancies;
    }

    public function lastMessages(User $user)
    {
        $current_user = current_user();

        return MessengerService::fetchQuery($current_user->id, $user->id)->with(['fromUser', 'toUser'])->take(2)->get();
    }
}
