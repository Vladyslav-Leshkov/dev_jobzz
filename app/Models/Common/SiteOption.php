<?php

namespace App\Models\Common;

use Illuminate\Support\Facades\Cache;
use Illuminate\Database\Eloquent\Model;

/**
 * Класс различных настроек приложения
 * Class SiteOption
 *
 * @property int $id
 * @property string $key
 * @property string $title
 * @property string $type
 * @property string $value
 * @property mixed $normalized_value
 * @property boolean $primary
 * @package App\Models\Common
 * @mixin IdeHelperSiteOption
 */
class SiteOption extends Model
{
    public const TYPE_STRING = 'string';
    public const TYPE_INTEGER = 'integer';
    public const TYPE_DOUBLE = 'double';
    public const TYPE_BOOLEAN = 'boolean';
    public const TYPE_ARRAY = 'array';
    public const TYPE_OBJECT = 'object';
    public const TYPE_NULL = 'NULL';

    public static array $types = [
        self::TYPE_STRING,
        self::TYPE_INTEGER,
        self::TYPE_DOUBLE,
        self::TYPE_BOOLEAN,
        self::TYPE_ARRAY,
        self::TYPE_OBJECT,
        self::TYPE_NULL,
    ];

    protected static array $options = [];

    private static string $cache_key = 'site_options';

    protected $fillable = [
        'key',
        'title',
        'type',
        'value',
        'primary',
    ];

    //

    public static function clearCache()
    {
        Cache::forget(self::$cache_key);
    }

    /**
     * Создает опцию
     *
     * @param string $key ключ
     * @param mixed $value значение
     * @param string $title описание
     * @param bool $primary если true, то админ не может удалить эту опцию
     * @param null|string $type тип значения, если не указан то определиться автоматически
     */
    public static function createOption(string $key, $value, string $title = '', bool $primary = false, string $type = null)
    {
        $option = new SiteOption();
        $option->key = $key;
        if (is_null($type)) {
            $type = gettype($value);
        }

        if (is_array($value) || is_object($value)) {
            $value = json_encode($value);
        }

        $option->title = $title;
        $option->value = $value;
        $option->type = $type;
        $option->primary = $primary;
        $option->save();
    }

    public static function getValue($key, $default = null)
    {
        $options = self::getOptions();

        if (array_key_exists($key, $options)) {
            return $options[$key];
        }

        return $default;
    }

    public static function getOptions()
    {
        if (is_null(self::$options) || empty(self::$options)) {
            self::$options = Cache::rememberForever(self::$cache_key, function () {
                /**
                 * @var SiteOption[] $options
                 */
                $options = self::query()->get();
                $result = [];
                foreach ($options as $option) {
                    $result[$option->key] = $option->normalized_value;
                }

                return $result;
            });
        }

        return self::$options;
    }

    /**
     * Возвращает преобразованное значение
     *
     * @return mixed
     */
    public function getNormalizedValueAttribute()
    {
        switch ($this->type) {
            case self::TYPE_OBJECT:
                $value = json_decode($this->value);

                break;
            case self::TYPE_ARRAY:
                $value = json_decode($this->value, true);

                break;
            case self::TYPE_DOUBLE:
                $value = (float)$this->value;

                break;
            case self::TYPE_INTEGER:
                $value = (int)$this->value;

                break;
            case self::TYPE_BOOLEAN:
                $value = (bool)$this->value;

                break;
            case self::TYPE_NULL:
                $value = null;

                break;
            default:
                $value = $this->value;

                break;
        }

        return $value;
    }
}
