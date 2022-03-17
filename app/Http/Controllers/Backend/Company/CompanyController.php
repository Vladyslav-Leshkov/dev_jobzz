<?php

namespace App\Http\Controllers\Backend\Company;

use App\Http\Controllers\Controller;
use App\Models\Job\Company;
use Illuminate\Contracts\View\View;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class CompanyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return View
     */
    public function index()
    {
        //
        return view('backend.company.index');
    }

    /**
     * Display the specified resource.
     *
     * @param Company $company
     * @return View
     */
    public function show(Company $company)
    {
        //
        return view('backend.company.show', ['company'=>$company]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Company $company
     * @return View
     */
    public function edit(Company $company)
    {
        //
        return view('backend.company.edit', ['company'=>$company]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param Company $company
     * @return RedirectResponse|JsonResponse
     */
    public function update(Request $request, Company $company)
    {
        //
        $company->fill($request->all());
        $company->save();
        if ($request->ajax()) {
            return response()->json(['result' => 'success']);
        }
        return redirect()->route('admin.company.index')->withFlashSuccess(__('Record updated'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Company $company
     * @return \Illuminate\Http\Response
     */
    public function destroy(Company $company)
    {
        //
        $company->delete();
        return redirect()->route('admin.company.index')->withFlashSuccess(__('Record deleted'));
    }
}
