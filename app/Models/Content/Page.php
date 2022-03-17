<?php

namespace App\Models\Content;

use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Kyslik\ColumnSortable\Sortable;
use Spatie\Translatable\HasTranslations;

/**
 * Class Page
 *
 * @property int $id
 * @package App\Models\Content
 * @mixin IdeHelperPage
 */
class Page extends Model
{
    use HasFactory;
    use Sluggable;
    use Sortable;
    use HasTranslations;

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title',
            ],
        ];
    }

    public $translatable = [
        'title',
        'text',
        'seo_h1',
        'seo_title',
        'seo_description',
        'seo_keywords',
    ];

    protected $fillable = [
        'title',
        'seo_h1',
        'seo_title',
        'seo_description',
        'seo_keywords',
        'text',
        'slug',
        'published',
    ];

    protected $casts = [
        'published' => 'boolean',
    ];

    public function scopePublished($query)
    {
        return $query->where('published', 1);
    }

    public function getSeoH1()
    {
        return !empty($this->seo_h1) ? $this->seo_h1 : $this->title;
    }

    public function getSeoTitle()
    {
        return !empty($this->seo_title) ? $this->seo_title : $this->title;
    }

    public function getSeoDescription()
    {
        return !empty($this->seo_description) ? $this->seo_description : $this->title;
    }

    public function getSeoKeywords()
    {
        return !empty($this->seo_keywords) ? $this->seo_keywords : $this->title;
    }
}
