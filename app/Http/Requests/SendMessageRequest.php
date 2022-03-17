<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

/**
 * Class SendMessageRequest
 * @property string $type
 * @package App\Http\Requests
 */
class SendMessageRequest extends FormRequest
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
        $allowed_mimes = implode(',', array_merge(config('messenger.attachments.allowed_images'), config('messenger.attachments.allowed_files')));
        return [
            //
            'type'=>['required', 'string'],
            'to_id'=>['required', 'integer'],
            'body'=>['string', 'required_if:file,null'],
            'file'=>['max:100000', 'mimes:'.$allowed_mimes],
            'data'=>['json', 'nullable'],
        ];
    }
}
