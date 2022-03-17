<?php

namespace App\Models\Content;

use App\Models\Traits\HasImage;
use App\Models\Traits\HasLocalizedDescription;
use App\Models\Traits\HasLocalizedTitle;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Str;

/**
 * @mixin IdeHelperHtmlBlock
 */
class HtmlBlock extends Model
{
    use HasFactory;
    use HasImage;
    use HasLocalizedTitle;
    use HasLocalizedDescription;



    protected static function boot()
    {
        parent::boot();
        self::updated(function($model){
            Cache::forget('html_block_'.$model->slug);
        });
    }

    protected $fillable = [
        'admin_title',
        'title_ru',
        'title_en',
        'image',
        'description_ru',
        'description_en',
        'slug',
        'section',
    ];

    protected $appends = [
        'title',
        'description',
        'image_url',
    ];

    /**
     * @param $slug
     * @return HtmlBlock
     */
    public static function getCachedBlock($slug)
    {
        return Cache::rememberForever('html_block_'.$slug, function () use ($slug) {
            return self::query()->where('slug', $slug)->first();
        });
    }

}
