<?php

namespace App\Http\Requests\Backend\User;

use App\Models\Auth\User;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;
use App\Rules\PasswordRules;

/**
 * Class StoreUserRequest.
 */
class StoreUserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'type' => ['required', Rule::in([User::TYPE_ADMIN, User::TYPE_SUPPORT, User::TYPE_CANDIDATE, User::TYPE_RECRUITER])],
            'login' => ['string', 'max:100', 'nullable'],
            'first_name' => ['string', 'max:100', 'nullable'],
            'last_name' => ['string', 'max:100', 'nullable'],
            'website' => ['url', 'nullable'],
            'phone' => ['max:100', 'phone:AUTO', 'nullable'],
            'date_of_birth' => ['date', 'nullable'],
            'gender' => [Rule::in(['', User::GENDER_MALE, User::GENDER_MALE])],
            'avatar' => ['string', 'max:255', 'nullable'],
            'avatar_upload' => ['mimes:jpg,png'],
            'email' => ['required', 'max:255', 'email', Rule::unique('users')],
            'password' => ['max:100', PasswordRules::register($this->email)],
            'status' => ['required', Rule::in([User::STATUS_ACTIVE, User::STATUS_ACTIVE])],
            'email_verified' => ['sometimes', 'in:1'],
            'send_confirmation_email' => ['sometimes', 'in:1'],
        ];
    }

    /**
     * @return array
     */
    public function messages()
    {
        return [
            'roles.*.exists' => __('One or more roles were not found or are not allowed to be associated with this user type.'),
            'permissions.*.exists' => __('One or more permissions were not found or are not allowed to be associated with this user type.'),
        ];
    }
}
