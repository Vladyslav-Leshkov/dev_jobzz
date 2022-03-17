<?php

namespace App\Http\Controllers\Backend\Skill;

use App\Http\Controllers\Controller;
use App\Models\Job\Skill;
use Illuminate\Contracts\View\View;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class SkillController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return View
     */
    public function index()
    {
        //
        return view('backend.skill.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return View
     */
    public function create()
    {
        //
        $skill = new Skill();

        return view('backend.skill.create', ['skill'=>$skill]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function store(Request $request)
    {
        //
        $skill = new Skill();
        $skill->fill($request->all());
        $skill->save();
        return redirect()->route('admin.skill.index')->withFlashSuccess(__('Record created'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Skill $skill
     *
     * @return View
     */
    public function edit(Skill $skill)
    {
        //
        return view('backend.skill.edit', ['skill'=>$skill]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param Skill $skill
     *
     * @return Response|JsonResponse
     */
    public function update(Request $request, Skill $skill)
    {
        //
        $skill->fill($request->all());
        $skill->save();
        if ($request->ajax()) {
            return response()->json(['result' => 'success']);
        }
        return redirect()->route('admin.skill.index')->withFlashSuccess(__('Record updated'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Skill $skill
     *
     * @return Response
     */
    public function destroy(Skill $skill)
    {
        //
        $skill->delete();

        return redirect()->route('admin.skill.index')->withFlashSuccess(__('Record deleted'));
    }
}
