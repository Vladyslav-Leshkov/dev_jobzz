<?php

namespace App\Models\Traits;

use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Spatie\Image\Exceptions\InvalidManipulation;
use Spatie\Image\Image;

trait HasLogo
{
    /**
     * @return string
     */
    public function getLogoUrlAttribute(): string
    {
        $logo = $this->getAttributeValue('logo');
        $logo_url = asset('/images/no-logo.svg');
        if(!empty($logo)){
            if(str_starts_with($logo, 'public/')){
                $logo_url = Storage::url($logo);
            }else{
                $logo_url = $logo;
            }

        }
        return $logo_url;
    }

    /**
     * @param UploadedFile $fileImage
     *
     * @throws InvalidManipulation
     */
    public function uploadLogo(UploadedFile $fileImage, $cropData = null)
    {
        $path = 'public/' . $fileImage->store("/userfiles/logo", 'public');
        $image_path = Storage::path($path);
        $image = Image::load($image_path);
        if (!empty($cropData)) {
            $image->manualCrop((int)$cropData['width'], (int)$cropData['height'], (int)$cropData['x'], (int)$cropData['y']);
        }
        $image->width(300)->height(300)->save();
        $this->logo = $path;
        $this->save();
    }

    /**
     *
     */
    public function deleteLogo()
    {
        if (!empty($this->avatar)) {
            Storage::delete('public/'.$this->logo);
        }
    }
}
