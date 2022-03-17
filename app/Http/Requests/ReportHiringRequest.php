<?php

namespace App\Http\Requests;

use App\Rules\CandidateExistsRule;
use Illuminate\Foundation\Http\FormRequest;

/**
 * Class ReportHiringRequest
 * @property string $email
 * @package App\Http\Requests
 */
class ReportHiringRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return $this->user()->isRecruiter();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            //
            'email'=>['required', 'email', new CandidateExistsRule($this->email)],
            'released_to_work'=>['required', 'date_format:d-m-Y'],
        ];
    }
}
