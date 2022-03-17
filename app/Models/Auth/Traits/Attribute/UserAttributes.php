<?php

namespace App\Models\Auth\Traits\Attribute;

use App\Models\Location\Address;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

trait UserAttributes
{

    /**
     * @param $password
     */
    public function setPasswordAttribute($password): void
    {
        // If password was accidentally passed in already hashed, try not to double hash it
        $this->attributes['password'] =
            (strlen($password) === 60 && preg_match('/^\$2y\$/', $password)) ||
            (strlen($password) === 95 && preg_match('/^\$argon2i\$/', $password)) ?
                $password :
                Hash::make($password);
    }

    public function getNameAttribute()
    {
        if (!empty($this->first_name)) {
            return trim($this->last_name . ' ' . $this->first_name);
        }
        if (!empty($this->login)) {
            return ucfirst($this->login);
        }

        return 'Anonymous';
    }

    public function getInitialsAttribute()
    {
        $initials = '';
        if (!empty($this->first_name)) {
            $initials .= Str::ucfirst(Str::substr($this->first_name, 0, 1));
        }
        if (!empty($this->last_name)) {
            $initials .= Str::ucfirst(Str::substr($this->last_name, 0, 1));
        }
        return empty($initials) ? 'AU' : $initials;
    }

    public function getRoleNameAttribute()
    {
        $roles = $this->getRoleNames();

        return count($roles) ? $roles[0] : '';
    }

    /**
     * @return string
     */
    public function getPermissionsLabelAttribute()
    {
        if ($this->hasAllAccess()) {
            return 'All';
        }

        if (!$this->permissions->count()) {
            return 'None';
        }

        return collect($this->getPermissionDescriptions())
            ->implode('<br/>');
    }

    /**
     * @return string
     */
    public function getRolesLabelAttribute()
    {
        if ($this->hasAllAccess()) {
            return 'All';
        }

        if (!$this->roles->count()) {
            return 'None';
        }

        return collect($this->getRoleNames())
            ->each(function ($role) {
                return ucwords($role);
            })
            ->implode('<br/>');
    }

    public function getLastActivityTitleAttribute()
    {
        return $this->last_activity ? $this->last_activity->diffForHumans() : '';
    }

    public function getIsOnlineAttribute(): bool
    {
        return Carbon::now()->subMinutes(5)->lessThanOrEqualTo($this->last_activity);
    }

    public function getRecruiterUrl(): string
    {
        return $this->isRecruiter() ? route('frontend.recruiter.show', $this->id) : '';
    }

    public function getCandidateUrl(): string
    {
        return $this->isCandidate() ? $this->candidate_profile->url : '';
    }

    public function getResumeUrlAttribute()
    {
        return $this->candidate_profile ? $this->candidate_profile->resume_url : '';
    }
}
