<?php

namespace App\Models\Job\Traits\Method;

trait CandidateMethod
{
    public function getFilterParams($params = []): array
    {
        if (!array_key_exists('spec', $params)) {
            $params['spec'] = implode(',', array_values($this->specializations()->select('id')->get()->pluck('id')->toArray()));
        }
//        if(!array_key_exists('empl', $params)){
//            $params['empl'] = implode(',', array_values( $this->employment_types()->select('id')->get()->pluck('id')->toArray()));
//        }
        if (!array_key_exists('cid', $params)) {
            $params['cid'] = implode(',', array_values($this->cities()->select('id')->get()->pluck('id')->toArray()));
        }
        if (!array_key_exists('remotely', $params)) {
            if ($this->employment_types()->where('remotely', 1)->count() > 0) {
                $params['remotely'] = 1;
            }
        }
        if (!array_key_exists('eng', $params)) {
            $eng = [];
            for ($l = 1; $l <= $this->english_level; $l++) {
                $eng[] = $l;
            }
            $params['eng'] = implode(',', $eng);
        }
        if (!array_key_exists('sal', $params) && $this->price_full_time > 1) {
            $params['sal'] = (int)floor($this->price_full_time / 100000);
        }
        if (!array_key_exists('exp', $params)) {
            switch ($this->experience) {
                case 0:
                    $params['exp'] = '0';
                    break;
                case 1:
                    $params['exp'] = '<1';
                    break;
                case 2:
                    $params['exp'] = '1';
                    break;
                case 3:
                case 4:
                    $params['exp'] = '2,3';
                    break;
                case 5:
                case 6:
                    $params['exp'] = '4,5';
                    break;
                default:
                    $params['exp'] = '5+';
                    break;
            }

        }
        return $params;
    }

    public function shortInfo($additional = [])
    {
        $info = [
            'id' => $this->id,
            'position' => $this->position,
            'name' => $this->name,
            'email' => $this->email,
            'url' => $this->url,
            'avatar_url' => $this->avatar_url,
        ];
        foreach ($additional as $field) {
            $info[$field] = $this->{$field};
        }
        return $info;
    }
}
