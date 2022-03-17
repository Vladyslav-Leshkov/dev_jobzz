<?php

namespace App\Models\Auth;

use App\Models\Auth\Traits\Attribute\UserAttributes;
use App\Models\Auth\Traits\Method\UserMethods;
use App\Models\Auth\Traits\Notifications\UseUserNotifications;
use App\Models\Auth\Traits\Relationship\UserRelationship;
use App\Models\Auth\Traits\Scope\UserScope;
use App\Models\Auth\Traits\UserVerifyEmailTrait;
use App\Models\Job\Company;
use App\Models\Traits\HasAvatar;
use App\Models\Traits\UseMessenger;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Carbon;
use Illuminate\Support\Collection;
use Laravel\Sanctum\HasApiTokens;
use NotificationChannels\WebPush\HasPushSubscriptions;
use Spatie\Permission\Traits\HasPermissions;
use Spatie\Permission\Traits\HasRoles;

/**
 * Class User
 * @package App\Models
 */
class User extends Authenticatable implements MustVerifyEmail
{
    use HasFactory,
        Notifiable,
        HasRoles,
        HasPermissions,
        HasAvatar,
        HasApiTokens,
        SoftDeletes,
        UserMethods,
        UserAttributes,
        UserRelationship,
        UserVerifyEmailTrait,
        UserScope,
        UseMessenger,
        HasPushSubscriptions,
        UseUserNotifications;

    public const SUPPORT_USER_ID = 2;

    public const TYPE_ADMIN = 'admin';

    public const TYPE_SUPPORT = 'support';

    public const TYPE_CANDIDATE = 'candidate';

    public const TYPE_RECRUITER = 'recruiter';


    public const STATUS_INACTIVE = 0;
    public const STATUS_ACTIVE = 1;
    public const STATUS_HIDDEN = 2;
    public const STATUS_BLOCKED = 3;
    public const STATUS_MODERATE = 4;
    public const STATUS_DELETED = 5;


    public const GENDER_MALE = 'male';

    public const GENDER_FEMALE = 'female';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'login',
        'first_name',
        'last_name',
        'position',
        'type',
        'email',
        'phone',
        'skype',
        'telegram',
        'linked_in',
        'github',
        'portfolio',
        'gender',
        'date_of_birth',
        'password',
        'status',
        'avatar',
        'last_login_at',
        'last_login_ip',
        'timezone',
        'agree',
        'provider',
        'provider_id',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
        'avatar',
    ];

    protected $appends = [
        'avatar_url',
        'last_activity_title',
        'name',
        'initials',
        'is_online',
        'has_avatar',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'status' => 'integer',
    ];

    protected $dates = [
        'date_of_birth',
        'created_at',
        'updated_at',
        'last_login_at',
        'last_activity',
    ];

//    protected $with = [
//        'roles',
//        'permissions',
//    ];
}
