<?php

namespace App\Models\Auth\Traits\Method;

use App\Models\Auth\User;
use Illuminate\Support\Collection;

/**
 * Trait RoleMethod.
 */
trait RoleMethod
{
    /**
     * @return mixed
     */
    public function isAdmin(): bool
    {
        return $this->name === User::TYPE_ADMIN;
    }

    /**
     * @return Collection
     */
    public function getPermissionDescriptions(): Collection
    {
        return $this->permissions->pluck('description');
    }

    public static function findByType($type)
    {
        return self::query()->where('type', $type)->first();
    }
}
