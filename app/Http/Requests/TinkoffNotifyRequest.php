<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

/**
 * @property-read string $OrderId
 * @property-read string $Status
 * @property-read bool $Success
 */
class TinkoffNotifyRequest extends FormRequest
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
            //
            'TerminalKey'=>['required', 'string'],
            'OrderId'=>['required', 'string'],
            'Success'=>['required', 'boolean'],
            'Status'=>['required', 'string'],
            'PaymentId'=>['nullable', 'numeric'],
            'ErrorCode'=>['nullable', 'string'],
            'Amount'=>['nullable', 'numeric'],
            'CardId'=>['nullable', 'numeric'],
            'Pan'=>['nullable', 'string'],
            'ExpDate'=>['nullable', 'string'],
            'RebillId'=>['nullable', 'numeric'],
            'Token'=>['nullable', 'string'],
            'DATA'=>['nullable', 'string'],
        ];
    }
}
