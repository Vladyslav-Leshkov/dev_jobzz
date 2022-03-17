<?php

namespace App\Models\Auth\Traits\Method;

use App\Models\Job\CandidateProfile;
use App\Models\Job\Company;
use App\Models\Job\Payout;
use App\Models\Job\Vacancy;
use App\Models\Job\Visitable;
use App\Models\Location\Address;
use Carbon\Carbon;
use Illuminate\Support\Collection;

/**
 * Trait UserMethod.
 */
trait UserMethods
{
    public static function supportUser()
    {
        return self::whereType('support')->first();
    }

    /**
     * @return bool
     */
    public function isMasterAdmin(): bool
    {
        return $this->id === 1;
    }

    /**
     * @return bool
     */
    public function isMasterSupport(): bool
    {
        return $this->id === 2;
    }

    /**
     * @return mixed
     */
    public function isSupport(): bool
    {
        return $this->type === self::TYPE_SUPPORT;
    }

    /**
     * @return mixed
     */
    public function hasAllAccess(): bool
    {
        return $this->isAdmin() && $this->hasRole(self::TYPE_ADMIN);
    }

    /**
     * @return mixed
     */
    public function isAdmin(): bool
    {
        return $this->type === self::TYPE_ADMIN;
    }

    /**
     * @param $type
     *
     * @return bool
     */
    public function isType($type): bool
    {
        return $this->type === $type;
    }

    /**
     * @return mixed
     */
    public function canChangeEmail(): bool
    {
        return config('site-settings.user.change_email');
    }

    /**
     * @return bool
     */
    public function isActive(): bool
    {
        return $this->status === self::STATUS_ACTIVE || $this->status === self::STATUS_HIDDEN;
    }

    /**
     * @return bool
     */
    public function isBlocked(): bool
    {
        return $this->status === self::STATUS_BLOCKED;
    }

    /**
     * @return bool
     */
    public function isModerate(): bool
    {
        return $this->status === self::STATUS_MODERATE;
    }

    /**
     * @return bool
     */
    public function isProfileActive(): bool
    {
//        if ($this->isCandidate()) {
//            return $this->candidate_profile !== null && $this->candidate_profile->status === CandidateProfile::STATUS_ACTIVE;
//        }
//        if ($this->isRecruiter()) {
//            return $this->company !== null && $this->company->status === Company::STATUS_ACTIVE;
//        }

        return $this->status === self::STATUS_ACTIVE;
    }

    /**
     * @return mixed
     */
    public function isCandidate(): bool
    {
        return $this->type === self::TYPE_CANDIDATE;
    }

    /**
     * @return mixed
     */
    public function isRecruiter(): bool
    {
        return $this->type === self::TYPE_RECRUITER;
    }

    /**
     * @return bool
     */
    public function isVerified(): bool
    {
        return $this->email_verified_at !== null;
    }

    /**
     * @return bool
     */
    public function isSocial(): bool
    {
        return false;
    }

    /**
     * @return Collection
     */
    public function getPermissionDescriptions(): Collection
    {
        return $this->permissions->pluck('description');
    }

    public function candidateContacts(): array
    {
        $this->loadMissing(['candidate_profile']);
        return [
            'id' => $this->id,
            'email' => $this->email,
            'skype' => $this->skype,
            'phone' => $this->phone,
            'telegram' => $this->telegram,
            'linked_in' => $this->linked_in,
            'github' => $this->github,
            'portfolio' => $this->portfolio,
            'resume' => $this->type === self::TYPE_CANDIDATE && $this->candidate_profile ? $this->candidate_profile->resume_name : '',
        ];
    }

    public function getContacts(): array
    {
        $contacts = [];
        if (!empty($this->phone)) {
            $contacts[] = "Телефон: {$this->phone}";
        }
        if (!empty($this->skype)) {
            $contacts[] = "Skype: {$this->skype}";
        }
        if (!empty($this->telegram)) {
            $contacts[] = "Telegram: {$this->telegram}";
        }
        if (!empty($this->github)) {
            $contacts[] = "Github: {$this->github}";
        }
        if (!empty($this->linked_in)) {
            $contacts[] = "Linked In: {$this->linked_in}";
        }
        if (!empty($this->portfolio)) {
            $contacts[] = "Портфолио: {$this->portfolio}";
        }
        return $contacts;
    }

    public function shortInfo($additional = [], $hideProfile = false): array
    {
        $info = [
            'id' => $this->id,
            'first_name' => $hideProfile ? __('Profile') : $this->first_name,
            'last_name' => $hideProfile ? __('Hidden') : $this->last_name,
            'name' => $hideProfile ? __('Profile Hidden') : $this->name,
            'type' => $this->type,
            'avatar_url' => $hideProfile ? '/images/no-avatar.svg' : $this->avatar_url,
            'has_avatar' => $hideProfile ? false : $this->has_avatar,
            'initials' => $hideProfile ? __('PH') : $this->initials,
            'position' => $this->position,
            'last_activity' => $this->last_activity,
            'last_activity_title' => $this->last_activity_title,
            'timezone' => $this->timezone,
            'is_online' => $this->is_online,
        ];
        foreach ($additional as $field) {
            if ($field === 'company') {
                $info[$field] = $this->company;
            } else {
                $info[$field] = $this->{$field};
            }
        }
        return $info;
    }

    public function getCardAddress()
    {
        $address = $this->addresses()->where('role', 'card')->first();
        if ($address === null) {
            $address = new Address();
            $address->role = 'card';
            $address->first_name = $this->first_name;
            $address->last_name = $this->last_name;
            $address->postcode = '';
            $address->street_address1 = '';
            $address->email = $this->email;
            $address->phone = $this->phone;
        }

        return $address;
    }

    public function getSwiftAddress()
    {
        $address = $this->addresses()->where('role', 'swift')->first();
        if ($address === null) {
            $address = new Address();
            $address->role = 'swift';
            $address->first_name = $this->first_name;
            $address->last_name = $this->last_name;
            $address->country_id = 172; // Россия
            $address->street_address1 = '';
            $address->eu_vat_id = '';
        }

        return $address;
    }

    public function getInvoiceAddress()
    {
        $address = $this->addresses()->where('role', 'invoice')->first();
        if ($address === null) {
            $address = new Address();
            $address->role = 'invoice';
            $address->first_name = $this->first_name;
            $address->last_name = $this->last_name;
            $address->inn = ''; //inn
        }

        return $address;
    }

    public function updateAddress($data = [], $role = 'main')
    {
        $address = $this->addresses()->where('role', $role)->first();
        if ($address === null) {
            $address = new Address();
            $address->role = $role;
        }
        $address->fill($data);
        $address->model_id = $this->id;
        $address->model_type = self::class;
        $address->save();
    }

    public function addHires($count)
    {
        $this->hires += $count;
        $this->timestamps = false;
        $this->save();
    }

    /**
     * Имеет ли пользователь просроченные платежки
     *
     * @return bool
     */
    public function hasLatePayouts()
    {
        return $this->payouts()->whereIn('status', [Payout::STATUS_NEW, Payout::STATUS_PENDING])
                ->whereDate('pay_before', '<=', Carbon::now()->subDays(1)->endOfDay())
                ->count() > 0;
    }


    public function isPushNotificationsEnabled()
    {
        return $this->notifySettings && $this->notifySettings->push_notify;
    }

    public function markVisitedVacancy($id)
    {
        if ($this->visitedVacancies()->where('model_id', $id)->count() === 0) {
            $this->visitedVacancies()->attach($id);
        }

    }

    public function markVisitedCandidate($id)
    {
        if ($this->visitedCandidates()->where('model_id', $id)->count() === 0) {
            $this->visitedCandidates()->attach($id);
        }

    }


    public function isContactOpenTo($recruiterId)
    {
        if ($this->isCandidate()) {
            return $this->openDatas()->where('recruiter_id', $recruiterId)->count() > 0;
        }
        return true;
    }
}
