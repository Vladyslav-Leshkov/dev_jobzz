<?php

namespace App\Http\Requests\Auth;

use App\Rules\CorporateEmailRule;
use App\Rules\PasswordRules;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

/**
 * Class RegisterRequest
 *
 * @property string $email
 * @property string $role
 * @property string $password
 * @property string $password_confirmation
 * @property boolean $agree
 *
 * @package App\Http\Requests\Auth
 */
class RegisterRequest extends FormRequest
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

    protected function prepareForValidation()
    {
        return $this->merge([
            'email' => strtolower(trim($this->email)),
            'password' => trim($this->password),
        ]);
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'email' => ['required', 'max:255', 'email', Rule::unique('users'), new CorporateEmailRule($this->email, $this->role)],
            'password' => ['max:100', PasswordRules::register($this->email)],
            //'agree' => ['required', Rule::in(['1', 1, true, 'true'])],
        ];
    }

    public function messages()
    {
        return [
            'agree' => __('You must accept the privacy policy.'),
        ];
    }

    // recursively trim the fields in the request here
    protected function trimData($data, $keyPrefix = '')
    {
        $trimmedFields = array_map(function ($value, $field) use ($keyPrefix) {
            // if the value is an array handle it as
            // a request array and send along the prefix
            if (is_array($value)) {
                return $this->trimData($value, $this->dotIndex($keyPrefix, $field));
            }

            // if the field is not in the specified fields to be
            // left untrimmed
            if (
                !in_array($this->dotIndex($keyPrefix, $field), $this->dontTrim) &&
                !in_array($this->dotIndex($keyPrefix, $field), $this->untrimmable)
            ) {
                return trim((string)$value);
            }

            return $value;

        }, $data, array_keys($data));

        return array_combine(array_keys($data), $trimmedFields);
    }
}
