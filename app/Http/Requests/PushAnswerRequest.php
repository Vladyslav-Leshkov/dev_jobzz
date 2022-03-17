<?php

namespace App\Http\Requests;

use App\Models\Job\PushQuestion;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

/**
 * Class PushAnswerRequest
 * @property string $answer
 * @package App\Http\Requests
 */
class PushAnswerRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return Auth::check();
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
            'answer'=>['required', Rule::in([PushQuestion::ANSWER_YES, PushQuestion::ANSWER_NO, PushQuestion::ANSWER_STILL])],
        ];
    }

    public function messages()
    {
        return [
            'required'=> 'Не верный ответ',
            'in'=> 'Не верный ответ',
        ];
    }
}
