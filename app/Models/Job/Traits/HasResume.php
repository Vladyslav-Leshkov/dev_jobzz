<?php

namespace App\Models\Job\Traits;

use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;

trait HasResume
{
    /**
     * @param UploadedFile $fileImage
     */
    public function uploadResume(UploadedFile $fileImage, $path = '')
    {
        if (empty($path)) {
            $timestamp = date('Ymd');
            $path = $fileImage->store("/resume/{$timestamp}", 'public');
        }
        $this->resume_name = $fileImage->getClientOriginalName();
        $this->resume = 'public/' . $path;
        $this->save();
    }

    public function getResumeUrlAttribute(): string
    {
        return !empty($this->resume) ? $this->resumeDownloadUrl() : '';
    }


    public function resumeDownloadUrl()
    {
        return route('frontend.download', ['file' => $this->resume, 'name' => $this->resume_name]);
    }

    /**
     *
     */
    public function deleteResume($save = false)
    {
        if (!empty($this->avatar)) {
            if (Storage::exists('public/' . $this->resume)) {
                Storage::delete('public/' . $this->resume);
            }

            $this->resume = '';
            if ($save) {
                $this->save();
            }
        }
    }
}
