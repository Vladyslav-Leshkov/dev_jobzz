<?php

namespace App\Models\Traits;

use DB;
use Illuminate\Database\Eloquent\Builder as EloquentBuilder;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Database\Eloquent\Relations\Relation;

trait JsonLikeScope
{
    /**
     * @param QueryBuilder|EloquentBuilder|Relation $query
     * @param $field
     * @param $value
     * return QueryBuilder|EloquentBuilder
     */
    private function buildJsonLikeQuery($query, $field, $value)
    {
        foreach (array_keys(config('site-settings.locale.languages')) as $locale) {
            $value = mb_strtolower($value);
            $query->orWhereRaw("LOWER(JSON_UNQUOTE(JSON_EXTRACT(`$field`, '$.\"$locale\"'))) LIKE '$value'");
        }
        return $query;
    }

    /**
     * @param QueryBuilder|EloquentBuilder|Relation $builder
     * @param $field
     * @param $value
     * return QueryBuilder|EloquentBuilder
     */
    public function scopeJsonLike($builder, $field, $value)
    {
        return $builder->where(fn($sq) => $this->buildJsonLikeQuery($sq, $field, $value));
    }

    /**
     * @param QueryBuilder|EloquentBuilder|Relation $builder
     * @param $field
     * @param $value
     * return QueryBuilder|EloquentBuilder
     */
    public function scopeOrJsonLike($builder, $field, $value)
    {
        return $builder->orWhere(fn($sq) => $this->buildJsonLikeQuery($sq, $field, $value));
    }
}
