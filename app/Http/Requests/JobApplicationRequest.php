<?php

namespace App\Http\Requests;

use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class JobApplicationRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return current_user()->isCandidate();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'comment' => ['required', 'string'],
            'resume_existing' => ['nullable'],
            'resume_upload' => [Rule::requiredIf((int)$this->input('resume_existing', 0) !== 1), 'mimes:doc,docx,pdf', 'max:4096'],
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
        throw new AuthorizationException(__('Only a candidate can submit job applications.'));
    }
}
