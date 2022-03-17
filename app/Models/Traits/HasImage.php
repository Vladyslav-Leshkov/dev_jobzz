<?php


namespace App\Models\Traits;


use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Spatie\Image\Exceptions\InvalidManipulation;
use Spatie\Image\Image;

trait HasImage
{

    /**
     * @return string
     */
    public function getImageUrlAttribute(): string
    {
        $logo = $this->getAttributeValue('image');
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
    public function uploadImage(UploadedFile $fileImage)
    {
        $date = date('Ymd');
        $path = 'public/'.$fileImage->store("/upload/{$date}", 'public');
        $image_path = Storage::path($path);
        Image::load($image_path)->width(300)->height(300)->save();
        $this->image = $path;
        $this->save();
    }

    /**
     *
     */
    public function deleteImage()
    {
        if (!empty($this->image)) {
            Storage::delete($this->image);
        }
    }
}
