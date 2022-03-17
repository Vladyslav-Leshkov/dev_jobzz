<?php

namespace App\Models\Content;

use App\Models\Content\MenuItem;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @mixin IdeHelperMenu
 */
class Menu extends Model
{
    protected $fillable = [
        'title',
        'slug',
    ];

    public function items()
    {
        return $this->hasMany(MenuItem::class, 'menu_id');
    }
}
