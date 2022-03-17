<?php

namespace App\Policies;

use App\Models\Auth\User;
use App\Models\Job\Invoice;
use App\Models\Job\Payout;
use Illuminate\Auth\Access\HandlesAuthorization;

class InvoicePolicy
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
     * @param Invoice $invoice
     *
     * @return mixed
     */
    public function view(User $user, Invoice $invoice)
    {
        //
        return $user->isAdmin() || $invoice->user_id === $user->id;
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
     * @param Invoice $invoice
     *
     * @return mixed
     */
    public function update(User $user, Invoice $invoice)
    {
        //
        return $this->owner($user, $invoice);
    }

    /**
     * @param User $user
     * @param Invoice $invoice
     *
     * @return mixed
     */
    public function owner(User $user, Invoice $invoice)
    {
        return $user->isAdmin() || $invoice->user_id === $user->id;
    }

    /**
     * @param User $user
     * @param Payout $payout
     *
     * @return mixed
     */
    public function ownerPayout(User $user, Payout $payout)
    {
        return $user->isAdmin() || $payout->recruiter_id === $user->id;
    }

    /**
     * Determine whether the user can delete the model.
     *
     * @param User $user
     * @param Invoice $invoice
     *
     * @return mixed
     */
    public function delete(User $user, Invoice $invoice)
    {
        return $this->owner($user, $invoice);
    }

    /**
     * Determine whether the user can restore the model.
     *
     * @param User $user
     * @param Invoice $invoice
     *
     * @return mixed
     */
    public function restore(User $user, Invoice $invoice)
    {
        return $this->owner($user, $invoice);
    }

    /**
     * Determine whether the user can permanently delete the model.
     *
     * @param User $user
     * @param Invoice $invoice
     *
     * @return mixed
     */
    public function forceDelete(User $user, Invoice $invoice)
    {
        return $user->isAdmin();
    }
}
