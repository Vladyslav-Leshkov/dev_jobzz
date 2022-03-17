<?php

namespace App\Models\Job;

use App\Models\Job\Traits\Attribute\CandidateProfileAttribute;
use App\Models\Job\Traits\HasEnglishTitle;
use App\Models\Job\Traits\HasLocationTitle;
use App\Models\Job\Traits\HasResume;
use App\Models\Job\Traits\Method\CandidateMethod;
use App\Models\Job\Traits\Relationship\CandidateRelationship;
use App\Models\Job\Traits\Scope\CandidateProfileScope;
use App\Models\Traits\HasRelatedUser;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

/**
 * Class CandidateProfile
 *
 * @package App\Models\Job
 */
class CandidateProfile extends Model
{
    use HasFactory;
    use CandidateRelationship;
    use CandidateMethod;
    use CandidateProfileAttribute;
    use CandidateProfileScope;
    use HasResume;
    use HasRelatedUser;
    use HasEnglishTitle;
    use HasLocationTitle;
    use SoftDeletes;
    use Sluggable;

    public const STATUS_INACTIVE = 0;
    public const STATUS_ACTIVE = 1;
    public const STATUS_HIDDEN = 2;
    public const STATUS_BLOCKED = 3;
    public const STATUS_MODERATE = 4;
    public const STATUS_DELETED = 5;

    protected $fillable = [
        'position',
        'resume',
        'description',
        'experience',
        'price_full_time',
        'price_freelance',
        'english_level',
    ];

    protected $casts = [
        'moderated' => 'boolean',
        'status' => 'integer',
        'price_full_time' => 'integer',
        'price_freelance' => 'integer',
        'english_level' => 'integer',
    ];

    protected $hidden = [
        'updated_at',
        'deleted_at',
        'pivot',
        'resume',
    ];

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $appends = [
        'url',
        'avatar_url',
        'first_name',
        'last_name',
        'name',
        'english_title',
        'experience_title',
        'is_freelance',
        'is_remotely',
        'location_title',
        'price_title',
        'price_freelance_title',
        'status',
    ];

    public static function boot()
    {
        parent::boot();

        self::created(function ($model) {
            $model->slug = $model->id . '-' . Str::slug($model->position);
            $model->save();
        });
        self::updating(function ($model) {
            $model->slug = $model->id . '-' . Str::slug($model->position);
        });
    }

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => ['id', 'position'],
            ],
        ];
    }

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function resumeDownloadUrl()
    {
        return route('frontend.candidate.resume', $this->slug);
    }
}
