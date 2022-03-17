<?php

namespace App\Http\Controllers\Backend\Specialization;

use App\Http\Controllers\Controller;
use App\Models\Job\Skill;
use App\Models\Job\Specialization;
use App\Models\Job\SpecializationType;
use Illuminate\Contracts\View\View;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class SpecializationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return View
     */
    public function index()
    {
        //
        return view('backend.specialization.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return View
     */
    public function create()
    {
        //
        $specialization = new Specialization();

        $types = SpecializationType::select(['id as value', 'title_ru as  text'])->get()->toArray();
        $skills = Skill::where('is_custom', 0)->select(['id as value', 'title_ru as  text'])->get()->toArray();

        return view('backend.specialization.create', ['types' => $types, 'specialization' => $specialization, 'skills' => $skills]);
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
        $specialization = new Specialization();
        $specialization->fill($request->all());
        $specialization->save();

        if ($request->hasFile('logo_upload')) {
            $specialization->uploadLogo($request->file('logo_upload'));
        }
        $specialization->skills()->sync($request->input('skills', []));
        
        return redirect()->route('admin.specialization.index')->withFlashSuccess(__('Record created'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Specialization $specialization
     *
     * @return View
     */
    public function edit(Specialization $specialization)
    {
        //
        $types = SpecializationType::select(['id as value', 'title_ru as  text'])->get()->toArray();
        $skills = Skill::where('is_custom', 0)->select(['id as value', 'title_ru as  text'])->get()->toArray();
        return view('backend.specialization.edit', ['types' => $types, 'specialization' => $specialization, 'skills' => $skills]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param Specialization $specialization
     *
     * @return Response|JsonResponse
     */
    public function update(Request $request, Specialization $specialization)
    {
        //
        $specialization->fill($request->all());
        $specialization->save();
        if ($request->hasFile('logo_upload')) {
            $specialization->uploadLogo($request->file('logo_upload'));
        }
        $specialization->skills()->sync($request->input('skills', []));
        if ($request->ajax()) {
            return response()->json(['result' => 'success']);
        }
        return redirect()->route('admin.specialization.index')->withFlashSuccess(__('Record updated'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Specialization $specialization
     *
     * @return Response
     */
    public function destroy(Specialization $specialization)
    {
        //
        $specialization->delete();

        return redirect()->route('admin.specialization.index')->withFlashSuccess(__('Record deleted'));
    }
}
