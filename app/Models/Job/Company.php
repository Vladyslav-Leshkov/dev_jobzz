<?php

namespace App\Models\Job;

use App\Models\Job\Traits\Attribute\CompanyAttribute;
use App\Models\Job\Traits\Relationship\CompanyRelationship;
use App\Models\Traits\HasLogo;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Company
 *
 * @package App\Models\Job
 * @property CompanyUser|null $pivot
 */
class Company extends Model
{
    use Sluggable;
    use HasLogo;
    use CompanyRelationship;
    use CompanyAttribute;

    use HasFactory;

    public const STATUS_NEW = 0;
    public const STATUS_ACTIVE = 1;
    public const STATUS_INACTIVE = 2;
    public const STATUS_BLOCKED = 3;


    protected $fillable = [
        'title',
        'slug',
        'logo',
        'website',
        'address',
        'description',
        'is_product',
        'status',
    ];

    protected $appends = [
        'url',
        'logo_url',
        'position',
    ];

    protected $casts = [
        'is_product' => 'boolean',
        'moderated' => 'boolean',
    ];

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => ['id', 'title'],
            ],
        ];
    }
}
