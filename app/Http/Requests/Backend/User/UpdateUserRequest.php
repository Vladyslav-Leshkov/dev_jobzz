<?php

namespace App\Http\Requests\Backend\User;

use App\Models\Auth\User;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

/**
 * Class UpdateUserRequest.
 *
 * @property User $user
 */
class UpdateUserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return ! ($this->user->isMasterAdmin() && ! $this->user()->isMasterAdmin());
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'type' => [Rule::requiredIf(function () {
                return ! $this->user->isMasterAdmin();
            }), Rule::in([User::TYPE_ADMIN, User::TYPE_CANDIDATE, User::TYPE_RECRUITER, User::TYPE_SUPPORT])],
            'login' => ['string', 'max:100', 'nullable'],
            'first_name' => ['string', 'max:100', 'nullable'],
            'last_name' => ['string', 'max:100', 'nullable'],
            'website' => ['url', 'nullable'],
            'company' => ['string', 'max:100', 'nullable', Rule::requiredIf(function () {
                return $this->type === User::TYPE_RECRUITER;
            })],
            'phone' => ['max:100', 'phone:AUTO', 'nullable'],
            'gender' => [Rule::in(['', User::GENDER_MALE, User::GENDER_MALE])],
            'date_of_birth' => ['date', 'nullable'],
            'avatar' => ['string', 'max:255', 'nullable'],
            'avatar_upload' => [ 'mimes:jpg,png'],
            'email' => ['required', 'max:255', 'email', Rule::unique('users')->ignore($this->user->id)],
            'roles' => ['sometimes', 'array'],
            'roles.*' => [Rule::exists('roles', 'id')->where('type', $this->type)],
            'permissions' => ['sometimes', 'array'],
            'permissions.*' => [Rule::exists('permissions', 'id')->where('type', $this->type)],
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

    /**
     * Handle a failed authorization attempt.
     *
     * @throws AuthorizationException
     *
     * @return void
     */
    protected function failedAuthorization()
    {
        throw new AuthorizationException(__('Only the administrator can update this user.'));
    }
}
