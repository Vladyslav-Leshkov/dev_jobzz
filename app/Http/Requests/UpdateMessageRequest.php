<?php

namespace App\Http\Requests;

use App\Models\Messenger\ChatMessage;
use Illuminate\Foundation\Http\FormRequest;

class UpdateMessageRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            //
            'id' => ['required'],
            'body' => ['required', 'string'],
        ];
    }

    public function authorize(): bool
    {
        $message_id = $this->json->get('id');
        $user = $this->user();

        return $user && ($user->isAdmin() || $user->isSupport() || ChatMessage::where('id', $message_id)->where('from_id', $user->id)->where('type', 'message')->count() > 0);
    }

}