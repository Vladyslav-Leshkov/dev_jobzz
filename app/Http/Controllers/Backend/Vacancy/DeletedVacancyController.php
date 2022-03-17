<?php

namespace App\Http\Controllers\Backend\Vacancy;

use App\Exceptions\GeneralException;
use App\Http\Controllers\Controller;
use App\Models\Job\Vacancy;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\View\View;

class DeletedVacancyController extends Controller
{
    //


    /**
     * @param  Vacancy $deletedVacancy
     *
     * @throws GeneralException
     *
     * @return mixed
     */
    public function update(Vacancy $deletedVacancy)
    {
        $deletedVacancy->restore();

        return redirect()->route('admin.vacancy.index')->withFlashSuccess(__('The record restored.'));
    }

    /**
     * @param  Vacancy $deletedVacancy
     *
     * @throws GeneralException
     *
     * @return mixed
     */
    public function destroy(Vacancy $deletedVacancy)
    {
        $deletedVacancy->forceDelete();

        return redirect()->route('admin.vacancy.deleted')->withFlashSuccess(__('The record permanently deleted.'));
    }
}
