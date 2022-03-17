<?php

namespace App\Models\Job;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Salary
 *
 * @package App\Models\Job
 * @mixin IdeHelperSalary
 */
class Salary extends Model
{
    protected $fillable = [
        'sum_rub',
        'sum_usd',
        'sum_eur',
    ];
}
