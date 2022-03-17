<?php

namespace App\Http\Requests;

use App\Models\Auth\User;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;
use Propaganistas\LaravelPhone\Rules\Phone;

/**
 * @property User $user
 */
class UpdateContactsRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return \Auth::check();
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
            'first_name'=>['required'],
            'last_name'=>['required'],
            'email' => ['required', 'max:255', 'email', Rule::unique('users')->ignore(current_user()->id)],
            'skype'=>['nullable'],
            'phone'=>['nullable'],
            'telegram'=>['nullable'],
            'linked_in'=>['nullable'],
            'github'=>['nullable'],
            'resume'=>['nullable'],
            'resume_upload' => ['nullable', 'mimes:doc,docx,pdf', 'max:4096'],
            'avatar_upload' => ['nullable', 'mimes:jpg,jpeg,png', 'max:4096'],
            'avatar_upload_crop' => ['nullable'],
            'status'=>['numeric', Rule::in('1', '2')],
        ];
    }
}
