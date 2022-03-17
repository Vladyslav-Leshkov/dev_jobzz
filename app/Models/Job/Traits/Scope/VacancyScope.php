<?php

namespace App\Models\Job\Traits\Scope;

use Illuminate\Database\Eloquent\Builder;

trait VacancyScope
{
    public function scopeActive(Builder $query): Builder
    {
        return $query->where('status', self::STATUS_ACTIVE);
    }

    public function scopeOnlyActive(Builder $query): Builder
    {
        return $query->where('status', self::STATUS_ACTIVE);
    }

    public function scopeOnlyInactive(Builder $query): Builder
    {
        return $query->where('status', self::STATUS_INACTIVE);
    }

    public function scopeOnlyAnonymous(Builder $query): Builder
    {
        return $query->where('status', self::STATUS_ANONYMOUS);
    }

    public function scopeOnlyArchived(Builder $query): Builder
    {
        return $query->where('status', self::STATUS_ARCHIVED);
    }

    public function scopeOnlyBlocked(Builder $query): Builder
    {
        return $query->where('status', self::STATUS_BLOCKED);
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
            ->when($params['empl'] ?? false, function ($q) use ($params) {
                $ids = prepare_filter_param($params['empl']);
                if (count($ids) > 0) {
                    return $q->whereHas('employment_types', function ($sq) use ($ids) {
                        $sq->whereIn('id', $ids);
                    });
                }

                return $q;
            })
            ->when($params['cid'] ?? $params['remotely'] ?? false, function ($q) use ($params) {
                $ids = prepare_filter_param($params['cid'] ?? '');
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
                $experiences = prepare_filter_param($params['exp'], '|');
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
                        } else {
                            $exps = explode(',', $exp);
                            foreach ($exps as $exp_it) {
                                if (is_numeric($exp_it)) {
                                    $query[] = "experience = " . ($exp_it + 1);
                                }
                            }
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
                    $query[] = "english_level = 0";
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
            ->when($params['sal'] ?? false, function ($q) use ($params) {
                return $q->where('price_to', '>=', $params['sal'] * 100000)->where('price_from', '<=', $params['sal'] * 100000);
            })
            ->when($params['is_product'] ?? false, function ($q) {
                return $q->where('is_product', '=', 1);
            })
            ->when($params['relocate'] ?? false, function ($q) {
                return $q->where('relocate', '=', 1);
            })
            ->when($params['help_relocate'] ?? false, function ($q) {
                return $q->where('help_relocate', '=', 1);
            })
            ->when(($params['q'] ?? false) && !empty($params['q']), function (Builder $q) use ($params) {
                $search = $params['q'];

                return $q->where(function ($sc) use ($search) {
                    $sc->where('title', 'LIKE', "%$search%")
                        ->orWhereHas('user.companies', function ($sq) use ($search) {
                            return $sq->where('companies.title', 'LIKE', "%$search%");
                        })
                        ->orWhereHas('specializations', function ($sq) use ($search) {
                            return $sq->where('title_ru', 'LIKE', "%$search%")->orWhere('title_en', 'LIKE', "%$search%");
                        })
                        ->orWhereHas('skills', function ($sq) use ($search) {
                            return $sq->where('title_ru', 'LIKE', "%$search%")->orWhere('title_en', 'LIKE', "%$search%");
                        });
                });
            });
    }
}
