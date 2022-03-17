<?php

namespace App\Models\Traits;

use App\Models\Auth\User;
use App\Models\Messenger\ChatMessage;
use App\Services\MessengerService;
use Illuminate\Database\Eloquent\Collection;

trait UseMessenger
{
    public function allChatMessages()
    {
        return ChatMessage::query()->where(function ($q) {
            return $q->where('from_id', $this->id)->orWhere('to_id', $this->id);
        });
    }

    /**
     * @param int $page
     * @param string $search
     *
     * @return User[]|Collection
     */
    public function getMessengerContacts($page = 1, $search = '')
    {
        $onPage = 50;
        $skip = ($page - 1) * $onPage;
        $userQ = self::query()->where('id', '<>', $this->id)->withCount(['incomingMessages', 'outgoingMessages']);
        $userQ->where('type', '<>', 'support');

        if (!empty($search)) {
            $userQ = $userQ->whereRaw("CONCAT_WS(' ', first_name, last_name, email, phone) LIKE '%$search%'");
        }

        if (!$this->isAdmin() && !$this->isSupport()) {
            // $userQ
            $out_ids = $this->outgoingMessages()->pluck('to_id')->toArray();
            $in_ids = $this->incomingMessages()->pluck('from_id')->toArray();
            $userQ->whereIn('id', array_merge($out_ids, $in_ids));
        } else {
            $userQ->whereNotIn('id', [1, 2]);
        }

        if ($this->isCandidate()) {
            $userQ->with(['companies']);
        }

        if ($this->isRecruiter()) {
            $userQ->with(['openDatas', 'candidate_profile']);
        }
        if ($this->isAdmin() || $this->isSupport()) {
            $userQ->orderBy('incoming_messages_count', 'desc')->orderBy('outgoing_messages_count', 'desc');
        }

        $users = $userQ->skip($skip)->take($onPage)->get();

        if ($this->isAdmin() || $this->isSupport()) {
            return $users->map->asMessengerContact(User::SUPPORT_USER_ID);
        }

        return $users->map->asMessengerContact($this->id, $this->isRecruiter());
    }

    public function outgoingMessages()
    {
        return $this->hasMany(ChatMessage::class, 'from_id');
    }

    public function incomingMessages()
    {
        return $this->hasMany(ChatMessage::class, 'to_id');
    }

    public function asMessengerContact($current_id, $toRecruiter = false)
    {
        $position = $this->position;
        if ($this->isCandidate() && $this->candidate_profile) {
            $position .= ', <span class="text-success">' . $this->candidate_profile->price_title . '</span>';
        }
        if ($this->isRecruiter() && $this->company) {
            $position .= ', ' . $this->company->title;
        }
        $hideContacts = $toRecruiter && $this->type == self::TYPE_CANDIDATE && $this->openDatas()->where('recruiter_id', $current_id)->count() === 0;
        return [
            'id' => $this->id,
            'name' => $hideContacts ? __('Profile Hidden') : $this->name,
            'first_name' => $hideContacts ? __('Profile') : $this->first_name,
            'last_name' => $hideContacts ? __('Hidden') : $this->last_name,
            'avatar_url' => $hideContacts ? '/images/no-avatar.svg' : $this->avatar_url,
            'has_avatar' => $hideContacts ? false : $this->has_avatar,
            'initials' => $hideContacts ? 'PH' : $this->initials,
            'type' => $this->type,
            'email' => $hideContacts ? '' : $this->email,
            'position' => $position,
            'is_online' => $this->is_online,
            'last_message' => MessengerService::lastMessage($current_id, $this->id),
            'company' => $this->type == self::TYPE_RECRUITER && $this->company ? $this->company->title : '',
            'profile_opened' => $this->type == self::TYPE_CANDIDATE && $this->openDatas()->where('recruiter_id', $current_id)->count() > 0,

        ];
    }
}
