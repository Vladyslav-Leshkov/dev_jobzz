<?php

namespace App\Models\Traits;

use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Spatie\Image\Exceptions\InvalidManipulation;
use Spatie\Image\Image;

trait HasAvatar
{

    public function getHasAvatarAttribute(): string
    {
        return !empty($this->getAttributeValue('avatar'));
    }

    /**
     * @return string
     */
    public function getAvatarUrlAttribute(): string
    {
        $avatar = $this->getAttributeValue('avatar');
        if (!empty($avatar) && Str::startsWith($avatar, 'http')) {
            return $avatar;
        }
        return !empty($avatar) ? Storage::url($avatar) : '/images/no-avatar.svg';
    }

    /**
     * @param UploadedFile|string $fileImage
     *
     * @throws InvalidManipulation
     */
    public function uploadAvatar($fileImage, $cropData = null)
    {
        if ($fileImage instanceof UploadedFile) {
            $path = $fileImage->store("/userfiles/{$this->id}/avatar", 'public');
        } else {
            $info = pathinfo($fileImage);
            $contents = file_get_contents($fileImage);
            $name = uniqid() . '.' . $info['extension'];
            $path = "/userfiles/oauth/avatar" . $name;
            Storage::put($path, $contents);
        }
        $image_path = Storage::path('public/' . $path);
        $image = Image::load($image_path);
        if (!empty($cropData)) {
            $image->manualCrop((int)$cropData['width'], (int)$cropData['height'], (int)$cropData['x'], (int)$cropData['y']);
        }
        $image->width(300)->height(300)->save();
        $this->avatar = $path;
        $this->save();
    }

    /**
     *
     */
    public function deleteAvatar($save = false)
    {
        if (!empty($this->avatar)) {
            if (Storage::exists('public/' . $this->avatar)) {
                Storage::delete('public/' . $this->avatar);
            }

            $this->avatar = '';
            if ($save) {
                $this->save();
            }
        }
    }
}
