<?php

namespace App\Models\Content;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Translatable\HasTranslations;

/**
 * @mixin IdeHelperMenuItem
 */
class MenuItem extends Model
{
    use HasTranslations;

    public const SIDE_LEFT = 0;
    public const SIDE_CENTER = 1;
    public const SIDE_RIGHT = 2;

    public $translatable = [
        'title',
    ];


    protected $fillable = [
        'title',
        'slug',
        'parent_id',
        'position',
        'active',
        'side',
        'button',
    ];

    public function menu()
    {
        return $this->belongsTo(Menu::class);
    }

    public function children()
    {
        return $this->hasMany(MenuItem::class, 'parent_id');
    }

    public function parent()
    {
        return $this->belongsTo(MenuItem::class, 'parent_id');
    }


    public function side($side)
    {
        return $this->side === $side;
    }
}
