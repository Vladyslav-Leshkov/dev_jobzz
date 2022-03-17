<?php

namespace App\Http\Requests;

use App\Rules\RecruiterHasVacancyRule;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Foundation\Http\FormRequest;

/**
 * Class CandidateOfferRequest
 *
 * @property int $vacancy_id
 * @property string $comment
 *
 * @package App\Http\Requests
 */
class CandidateOfferRequest extends FormRequest
{

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return current_user()->isRecruiter();
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
            'vacancy_id'=>['required', 'integer', new RecruiterHasVacancyRule(current_user())],
            'comment'=>['required', 'string'],
        ];
    }

    /**
     * Handle a failed authorization attempt.
     *
     * @throws AuthorizationException
     *
     * @return void
     */
    protected function failedAuthorization()
    {
        throw new AuthorizationException(__('Only a recruiter can submit job offers.'));
    }
}
