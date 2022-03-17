<?php

namespace App\Models\Job;

use App\Models\Auth\User;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\Pivot;

/**
 * Class CompanyUser
 *
 * @package App\Models\Job
 * @mixin IdeHelperCompanyUser
 */
class CompanyUser extends Pivot
{
    protected $table = 'company_users';

    public const STATUS_NEW = 0;
    public const STATUS_ACTIVE = 1;
    public const STATUS_INACTIVE = 2;
    public const STATUS_BLOCKED = 3;

    protected $fillable = [
        'is_admin',
        'status',
    ];

    protected $hidden = [
        'company_id',
        'user_id',
    ];

    public function company(): BelongsTo
    {
        return $this->belongsTo(Company::class, 'company_id');
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
