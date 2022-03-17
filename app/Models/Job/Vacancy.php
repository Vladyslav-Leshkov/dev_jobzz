<?php

namespace App\Models\Job;

use App\Models\Job\Traits\Attribute\VacancyAttribute;
use App\Models\Job\Traits\HasEnglishTitle;
use App\Models\Job\Traits\HasLocationTitle;
use App\Models\Job\Traits\Method\VacancyMethod;
use App\Models\Job\Traits\Relationship\VacancyRelationship;
use App\Models\Job\Traits\Scope\VacancyScope;
use App\Models\Traits\HasRelatedUser;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

/**
 * Class Vacancy
 *
 * @package App\Models\Job
 */
class Vacancy extends Model
{
    use HasFactory;
    use VacancyRelationship;
    use VacancyMethod;
    use Sluggable;
    use VacancyAttribute;
    use HasRelatedUser;
    use HasEnglishTitle;
    use HasLocationTitle;
    use VacancyScope;
    use SoftDeletes;

    public const STATUS_INACTIVE = 0;
    public const STATUS_ACTIVE = 1;
    public const STATUS_ANONYMOUS = 2;
    public const STATUS_ARCHIVED = 3;
    public const STATUS_BLOCKED = 4;
    public static array $statuses = [
        'active' => self::STATUS_ACTIVE,
        'hold' => self::STATUS_INACTIVE,
        'anonymous' => self::STATUS_ANONYMOUS,
        'archived' => self::STATUS_ARCHIVED,
        'blocked' => self::STATUS_BLOCKED,
    ];
    protected $fillable = [
        'title',
        'slug',
        'description',
        'short_description',
        'experience',
        'price_from',
        'price_to',
        'english_level',
        'is_product',
        'relocate',
        'help_relocate',
    ];
    protected $appends = [
        'url',
        'avatar_url',
        'recruiter_url',
        'first_name',
        'last_name',
        'position',
        'english_title',
        'experience_title',
        'is_freelance',
        'is_remotely',
        'location_title',
        'total_hires',
        'initials',
        'has_avatar',
    ];

    public static function boot()
    {
        parent::boot();

        self::created(function ($model) {
            $model->slug = $model->id . '-' . Str::slug($model->title);
            $model->save();
        });
    }

    protected $dates = [
        'created_at',
        'updated_at',
    ];

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => ['id', 'title'],
            ],
        ];
    }
}
