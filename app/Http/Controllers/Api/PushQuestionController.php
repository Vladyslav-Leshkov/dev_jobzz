<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\PushAnswerRequest;
use App\Models\Job\PushQuestion;
use App\Services\Frontend\Job\PushQuestionService;

class PushQuestionController extends Controller
{
    //

    public function index()
    {
        $user = current_user();
        if ($user) {
            return $user->pushQuestions()->onlyNew()->get();
        }
        return [];
    }


    public function answer(PushAnswerRequest $request, PushQuestion $question)
    {
        return PushQuestionService::answerResponse($question, $request->answer);
    }
}
