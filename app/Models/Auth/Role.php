<?php

namespace App\Models\Auth;

use App\Models\Auth\Traits\Attribute\RoleAttribute;
use App\Models\Auth\Traits\Method\RoleMethod;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Collection;
use Spatie\Permission\Models\Role as SpatieRole;

/**
 * Class Role.
 *
 * @property int $id
 * @property string $name
 * @property string $type
 * @property Collection $permissions
 * @mixin IdeHelperRole
 */
class Role extends SpatieRole
{
    use HasFactory,
        RoleAttribute,
        RoleMethod;

    /**
     * @var string[]
     */
    protected $with = [
        'permissions',
    ];
}
