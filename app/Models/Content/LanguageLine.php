<?php

namespace App\Models\Content;

use App\Models\Traits\JsonLikeScope;
use Spatie\TranslationLoader\LanguageLine as SpatieLanguageLine;

/**
 * @mixin IdeHelperLanguageLine
 */
class LanguageLine extends SpatieLanguageLine
{
    use JsonLikeScope;

    public function asJson($value)
    {
        return json_encode($value, JSON_UNESCAPED_UNICODE);
    }

    /**
     * @param string $locale
     * @return bool
     */
    public function hasTranslation(string $locale)
    {
        return isset($this->text[$locale]) && !empty($this->text[$locale]);
    }

    public function getFullKeyAttribute()
    {
        return $this->group . '.' . $this->key;
    }
}
