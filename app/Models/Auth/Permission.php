<?php

namespace App\Models\Auth;

use App\Models\Auth\Traits\Relationship\PermissionRelationship;
use App\Models\Auth\Traits\Scope\PermissionScope;
use Spatie\Permission\Models\Permission as SpatiePermission;

/**
 * Class Permission.
 *
 * @mixin IdeHelperPermission
 */
class Permission extends SpatiePermission
{
    use PermissionRelationship,
        PermissionScope;
}
