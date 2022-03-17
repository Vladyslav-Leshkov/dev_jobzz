<?php

namespace App\Models\Job;

use App\Models\Job\Traits\Attribute\OfferAttribute;
use App\Models\Job\Traits\HasResume;
use App\Models\Job\Traits\Relationship\OfferRelationship;
use App\Models\Job\Traits\Scope\OfferScope;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 */
class Offer extends Model
{
    // use HasFactory;
    use HasResume;
    use OfferRelationship;
    use OfferScope;
    use OfferAttribute;
    use SoftDeletes;

    public const STATUS_NEW = 0;
    public const STATUS_PROCESSED = 1;
    public const STATUS_CONFIRMED = 2;
    public const STATUS_REJECTED = 3;

    public const INITIATOR_CANDIDATE = 0;
    public const INITIATOR_RECRUITER = 1;


    protected $casts = [
        'vacancy_id' => 'integer',
        'candidate_id' => 'integer',
        'recruiter_id' => 'integer',
        'initiator' => 'integer',
    ];

    protected $dates = [
        'created_at',
        'updated_at',
        'candidate_expired',
        'recruiter_expired',
        'released_to_work',
    ];

    protected $appends = [
        'confirmed',
    ];

}
