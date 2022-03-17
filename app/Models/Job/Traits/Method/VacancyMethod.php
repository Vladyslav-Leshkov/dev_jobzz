<?php


namespace App\Models\Job\Traits\Method;


use App\Models\Job\Vacancy;

trait VacancyMethod
{

    public function isArchived(): bool
    {
        return $this->status === Vacancy::STATUS_ARCHIVED;
    }

    public function getFilterParams($params = [])
    {
        if (!array_key_exists('spec', $params)) {
            $params['spec'] = implode(',', array_values($this->specializations()->select('id')->get()->pluck('id')->toArray()));
        }
        if (!array_key_exists('cid', $params)) {
            $params['cid'] = implode(',', array_values($this->cities()->select('id')->get()->pluck('id')->toArray()));
        }
        if (!array_key_exists('remotely', $params)) {
            if ($this->employment_types()->where('remotely', 1)->count() > 0) {
                $params['remotely'] = 1;
            }
        }
        if (!array_key_exists('min_eng', $params)) {
            $params['min_eng'] = $this->english_level;
        }
        if (!array_key_exists('sal_from', $params) && $this->price_from > 1) {
            $params['sal_from'] = $this->price_from;
        }
        if (!array_key_exists('sal_to', $params) && $this->price_to > 1) {
            $params['sal_to'] = $this->price_to;
        }
        if (!array_key_exists('exp', $params)) {
            $exp = [];
            switch ($this->experience) {
                case 0:
                    $exp[] = '0';
                case 1:
                    $exp[] = '<1';
                case 2:
                    $exp[] = '1';
                case 3:
                    $exp[] = '2';
                case 4:
                    $exp[] = '3';
                case 5:
                    $exp[] = '4';
                case 6:
                    $exp[] = '5';
                default:
                    $exp[] = '5+';
            }
            $params['exp'] = implode(',', $exp);

        }
        return $params;
    }
}
