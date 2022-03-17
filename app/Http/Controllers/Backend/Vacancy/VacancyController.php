<?php

namespace App\Http\Controllers\Backend\Vacancy;

use App\Http\Controllers\Controller;
use App\Models\Job\Vacancy;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;

class VacancyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return View
     */
    public function index(string $status = 'active')
    {
        //
        return view('backend.vacancy.index', ['status' => $status]);
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param Vacancy $vacancy
     * @return View
     */
    public function edit(Vacancy $vacancy)
    {
        //
        return view('backend.vacancy.edit', ['vacancy' => $vacancy]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param Vacancy $vacancy
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Vacancy $vacancy)
    {
        //

        return back()->withFlashSuccess(__('Record updated'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Vacancy $vacancy
     * @return \Illuminate\Http\Response
     */
    public function destroy(Vacancy $vacancy)
    {
        $statuses = array_flip(Vacancy::$statuses);
        //
        $vacancy->delete();

        return redirect()->route('admin.vacancy.index', $statuses[$vacancy->status])->withFlashSuccess(__('Record deleted'));
    }

    /**
     * Change vacancy status
     *
     * @param Vacancy $vacancy
     * @param int $status
     * @return mixed
     */
    public function status(Vacancy $vacancy, $status)
    {
        $statuses = array_flip(Vacancy::$statuses);
        //
        $vacancy->status = (int)$status;
        $vacancy->save();

        return redirect()->back()->withFlashSuccess(__('Record updated'));
    }
}
