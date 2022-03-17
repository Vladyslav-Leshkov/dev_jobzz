<?php

namespace App\Models\Auth\Traits\Scope;

/**
 * Class UserScope.
 */
trait UserScope
{
    /**
     * @param $query
     *
     * @return mixed
     */
    public function scopeOnlyDeactivated($query)
    {
        return $query->whereStatus(self::STATUS_BLOCKED);
    }

    /**
     * @param $query
     *
     * @return mixed
     */
    public function scopeOnlyInactive($query)
    {
        return $query->whereStatus(self::STATUS_INACTIVE);
    }

    /**
     * @param $query
     *
     * @return mixed
     */
    public function scopeOnlyActive($query)
    {
        return $query->where(function ($q) {
            return $q->where('status', self::STATUS_ACTIVE)->orWhere('status',self::STATUS_HIDDEN);
        });
    }


    /**
     * @param $query
     *
     * @return mixed
     */
    public function scopeOnlyModerate($query)
    {
        return $query->whereStatus(self::STATUS_MODERATE);
    }

    /**
     * @param $query
     * @param $type
     *
     * @return mixed
     */
    public function scopeByType($query, $type)
    {
        return $query->where('type', $type);
    }

    /**
     * @param $query
     *
     * @return mixed
     */
    public function scopeAllAccess($query)
    {
        return $query->whereHas('roles', function ($query) {
            $query->where('name', self::TYPE_ADMIN);
        });
    }

    /**
     * @param $query
     *
     * @return mixed
     */
    public function scopeAdmins($query)
    {
        return $query->where('type', $this::TYPE_ADMIN);
    }

    /**
     * @param $query
     *
     * @return mixed
     */
    public function scopeCandidates($query)
    {
        return $query->where('type', $this::TYPE_CANDIDATE);
    }

    /**
     * @param $query
     *
     * @return mixed
     */
    public function scopeRecruiters($query)
    {
        return $query->where('type', $this::TYPE_RECRUITER);
    }
}
