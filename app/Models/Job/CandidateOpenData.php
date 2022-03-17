<?php

namespace App\Models\Job;

use App\Models\Auth\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @mixin IdeHelperCandidateOpenData
 */
class CandidateOpenData extends Model
{

    protected $fillable = [
        'candidate_id',
        'recruiter_id',
        'data',
    ];

    protected $casts = [
        'data'=>'array',
    ];

    public function candidate()
    {
        return $this->belongsTo(User::class, 'candidate_id');
    }


    public function recruiter()
    {
        return $this->belongsTo(User::class, 'recruiter_id');
    }
}
