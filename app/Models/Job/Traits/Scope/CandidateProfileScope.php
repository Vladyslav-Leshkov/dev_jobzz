<?php

namespace App\Models\Job\Traits\Scope;

use App\Models\Auth\User;
use Illuminate\Database\Eloquent\Builder;

trait CandidateProfileScope
{
    public function scopeActive(Builder $query): Builder
    {
        return $query->whereHas('user', function ($q) {
            return $q->where('status', User::STATUS_ACTIVE);
        });
    }

    public function scopeFilter(Builder $query, $params = []): Builder
    {
        return $query
            ->when($params['spec'] ?? false, function ($q) use ($params) {
                $ids = prepare_filter_param($params['spec']);
                if (count($ids) > 0) {
                    return $q->whereHas('specializations', function ($sq) use ($ids) {
                        $sq->whereIn('id', $ids);
                    });
                }

                return $q;
            })
            ->when(isset($params['empl']) ?? false, function ($q) use ($params) {
                $ids = prepare_filter_param($params['empl']);
                if (count($ids) > 0) {
                    return $q->whereHas('employment_types', function ($sq) use ($ids) {
                        $sq->whereIn('id', $ids);
                    });
                }

                return $q;
            })
            ->when(isset($params['cid']) ?? isset($params['remotely']) ?? false, function ($q) use ($params) {
                $ids = prepare_filter_param($params['cid'] ?? []);
                if (count($ids) > 0) {
                    $q->where(function ($sq) use ($ids) {
                        $sq->whereHas('cities', function ($ssq) use ($ids) {
                            $ssq->whereIn('id', $ids);
                        });
                        if (request('remotely')) {
                            $sq->orWhereHas('employment_types', function ($ssq) {
                                $ssq->where('remotely', 1);
                            });
                        }
                    });
                } elseif ($params['remotely'] ?? false) {
                    $q->whereHas('employment_types', function ($sq) {
                        $sq->where('remotely', 1);
                    });
                }

                return $q;
            })
            ->when(isset($params['exp']), function ($q) use ($params) {
                $experiences = prepare_filter_param($params['exp']);
                $query = [];
                if (count($experiences) > 0) {
                    foreach ($experiences as $exp) {
                        if ($exp === '5+') {
                            $query[] = "experience >= 6";
                        } elseif ($exp === '<1') {
                            $query[] = "experience = 1";
                        } elseif ((int)$exp === 0) {
                            $query[] = "experience = 0";
                        } elseif (is_numeric($exp)) {
                            $query[] = "experience = " . ($exp + 1);
                        }
                    }

                    return $q->whereRaw("( " . implode(' OR ', $query) . ")");
                }

                return $q;
            })
            ->when($params['eng'] ?? false, function ($q) use ($params) {
                $levels = prepare_filter_param($params['eng']);
                $query = [];
                if (count($levels) > 0) {
                    foreach ($levels as $level) {
                        $query[] = "english_level = " . $level;
                    }

                    return $q->whereRaw("( " . implode(' OR ', $query) . ")");
                }

                return $q;
            })
            ->when($params['min_eng'] ?? false, function ($q) use ($params) {
                return $q->where('english_level', '>=', $params['min_eng']);
            })
            ->when($params['sal_from'] ?? false, function ($q) use ($params) {
                return $q->where('price_full_time', '>=', $params['sal_from']);
            })
            ->when($params['sal_to'] ?? false, function ($q) use ($params) {
                return $q->where('price_full_time', '<=', $params['sal_to']);
            })
            ->when(($params['q'] ?? false) && !empty($params['q']), function (Builder $q) use ($params) {
                $search = $params['q'];

                return $q->where(function ($sq) use ($search) {
                    return $sq->where('position', 'LIKE', "%$search%")
                        ->orWhereHas('specializations', function ($sq) use ($search) {
                            return $sq->where('title_ru', 'LIKE', "%$search%")->orWhere('title_en', 'LIKE', "%$search%");
                        })
                        ->orWhereHas('all_skills', function ($sq) use ($search) {
                            return $sq->where('title_ru', 'LIKE', "%$search%")->orWhere('title_en', 'LIKE', "%$search%");
                        });
                });
            });
    }
}
