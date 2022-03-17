<?php

namespace App\Mail;

use App\Models\Auth\User;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class AdminHiringReport extends Mailable
{
    use Queueable, SerializesModels;

    protected array $data = [];

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(array $data)
    {
        //
        $this->data = $data;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this
            ->from($this->data['from'])
            ->to(site_option('contact_email'))
            ->subject(_('Candidate hiring report'))
            ->view('emails.hiring-report');
    }
}
