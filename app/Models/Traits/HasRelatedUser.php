<?php

namespace App\Models\Traits;

trait HasRelatedUser
{
    public function getHasAvatarAttribute()
    {
        return $this->user ? $this->user->has_avatar : false;
    }

    public function getAvatarUrlAttribute()
    {
        return $this->user ? $this->user->avatar_url : '/images/avatar-big.svg';
    }

    public function getFirstNameAttribute()
    {
        return $this->user ? $this->user->first_name : '';
    }

    public function getLastNameAttribute()
    {
        return $this->user ? $this->user->last_name : '';
    }

    public function getNameAttribute()
    {
        return $this->user ? $this->user->name : '';
    }

    public function getInitialsAttribute()
    {
        return $this->user ? $this->user->initials : '';
    }

    public function getEmailAttribute()
    {
        return $this->user ? $this->user->email : '';
    }
}
