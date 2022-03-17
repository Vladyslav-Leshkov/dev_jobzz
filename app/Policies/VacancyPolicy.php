<?php

namespace App\Policies;

use App\Models\Auth\User;
use App\Models\Job\Vacancy;
use Illuminate\Auth\Access\HandlesAuthorization;

class VacancyPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view any models.
     *
     * @param User $user
     *
     * @return mixed
     */
    public function viewAny(User $user)
    {
        //
        return true;
    }

    /**
     * Determine whether the user can view the model.
     *
     * @param User $user
     * @param Vacancy $vacancy
     *
     * @return mixed
     */
    public function view(User $user, Vacancy $vacancy)
    {
        //
        return true;
    }

    /**
     * @param User $user
     * @param Vacancy $vacancy
     *
     * @return mixed
     */
    public function owner(User $user, Vacancy $vacancy)
    {
        return $user->isAdmin() || ($user->isRecruiter() && $user->company !== null && $user->company->id === $vacancy->company_id);
    }

    /**
     * Determine whether the user can create models.
     *
     * @param User $user
     *
     * @return mixed
     */
    public function create(User $user)
    {
        return $user->isAdmin() || $user->isRecruiter();
    }

    /**
     * Determine whether the user can update the model.
     *
     * @param User $user
     * @param Vacancy $vacancy
     *
     * @return mixed
     */
    public function update(User $user, Vacancy $vacancy)
    {
        //
        return $this->owner($user, $vacancy);
    }

    /**
     * Determine whether the user can delete the model.
     *
     * @param User $user
     * @param Vacancy $vacancy
     *
     * @return mixed
     */
    public function delete(User $user, Vacancy $vacancy)
    {
        return $this->owner($user, $vacancy);
    }

    /**
     * Determine whether the user can restore the model.
     *
     * @param User $user
     * @param Vacancy $vacancy
     *
     * @return mixed
     */
    public function restore(User $user, Vacancy $vacancy)
    {
        return $this->owner($user, $vacancy);
    }

    /**
     * Determine whether the user can permanently delete the model.
     *
     * @param User $user
     * @param Vacancy $vacancy
     *
     * @return mixed
     */
    public function forceDelete(User $user, Vacancy $vacancy)
    {
        return $user->isAdmin();
    }
}
