<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class OrderInvoiceRequest extends FormRequest
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
            'payment_method' => ['required', 'string', Rule::in(['card', 'swift', 'invoice'])],
            'name' => ['required', 'string'],
            'phone' => ['nullable', 'string'],
            'email' => ['nullable', 'string'],
            'currency' => ['nullable', 'string'],
            'items' => ['array'],
            'eu_vat_id' => ['nullable', 'string'],
            'postcode' => ['nullable', 'string'],
            'street_address1' => [Rule::requiredIf($this->payment_method === 'swift'), 'string', 'nullable'],
            'country_id' => [Rule::requiredIf($this->payment_method === 'swift'), 'integer'],
            'vat_id' => [Rule::requiredIf($this->payment_method === 'invoice'), 'string'],
        ];
    }
}
