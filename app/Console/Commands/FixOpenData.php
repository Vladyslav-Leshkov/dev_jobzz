<?php

namespace App\Console\Commands;

use App\Models\Job\CandidateOpenData;
use App\Models\Job\Offer;
use App\Services\MessengerService;
use Illuminate\Console\Command;

class FixOpenData extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'open-data:fix';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $offers = Offer::query()->where('initiator', Offer::INITIATOR_CANDIDATE)->with(['profile', 'recruiter'])->get();
        /**
         * @var Offer $offer
         */
        foreach ($offers as $offer) {
            $open_data = CandidateOpenData::where('candidate_id', $offer->candidate_id)
                ->where('recruiter_id', $offer->recruiter_id)->first();
            if (empty($open_data)) {
                $open_data = new CandidateOpenData();
                $open_data->candidate_id = $offer->candidate_id;
                $open_data->recruiter_id = $offer->recruiter_id;
            }
            if (empty($open_data->data)) {
                $data = array_filter($offer->candidate->candidateContacts());
                unset($data['portfolio']);
                unset($data['resume']);
                unset($data['id']);
                $data['email'] = $offer->candidate->email;
                if (!empty($offer->resume)) {
                    $data['attachment'] = MessengerService::makeAttachment($offer->resume, $offer->resume_name);
                }
                $open_data->data = $data;
                if (empty($data)) {
                    $d = $offer;
                }
                $open_data->save();
            }

        }
        return 0;
    }
}
