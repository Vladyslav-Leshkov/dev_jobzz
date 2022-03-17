<?php

/*
echo plural_form(42, array('арбуз', 'арбуза', 'арбузов'));
*/

use App\Models\Job\Currency;


if (!function_exists('plural_form')) {
    /**
     * @param int $n Количество
     * @param array $forms [один, два, пять]
     */
    function plural_form(int $n, array $forms)
    {
        return $n % 10 == 1 && $n % 100 != 11 ? $forms[0] : ($n % 10 >= 2 && $n % 10 <= 4 && ($n % 100 < 10 || $n % 100 >= 20) ? $forms[1] : $forms[2]);
    }
}

if (!function_exists('clear_phone')) {
    function clear_phone($phone)
    {
        $phone = preg_replace('/[^0-9]/', '', $phone);

        return '+' . $phone;
    }
}

if (!function_exists('str_slug')) {
    /**
     * @param $title
     * @param string $separator
     * @param string $language
     *
     * @return string
     */
    function str_slug($title, $separator = '-', $language = 'en')
    {
        return \Illuminate\Support\Str::slug($title, $separator, $language);
    }
}

if (!function_exists('str_limit')) {
    /**
     * @param string $value
     * @param int $limit
     * @param string $ends
     *
     * @return string
     */
    function str_limit($value, $limit = 100, $ends = '...')
    {
        return \Illuminate\Support\Str::limit($value, $limit, $ends);
    }
}

if (!function_exists('to_currency')) {
    /**
     * @param $title
     * @param string $separator
     * @param string $language
     *
     * @return string
     */
    function to_currency($value, $currency = 'RUB', $decimals = 0)
    {
        return number_format($value, $decimals, '.', ' ') . ' ' . $currency;
    }
}

if (!function_exists('class_short_name')) {
    function class_short_name($class_name)
    {
        return substr(strrchr($class_name, "\\"), 1);
    }
}

if (!function_exists('numfmt_currency')) {
    function numfmt_currency($amount, $currency = 'USD', $locale = 'en_US')
    {
        $symbol = [
            'RUB' => '&#8381;',
            'USD' => '&#36;',
            'EUR' => '&#8364;',
        ];
        $fmt = numfmt_create($locale, NumberFormatter::DECIMAL);
        $fmt->setAttribute(NumberFormatter::MIN_FRACTION_DIGITS, 2);
        return ($symbol[$currency] ?? $currency) . $fmt->format($amount);
    }
}

if (!function_exists('convert_currency')) {
    function convert_currency($amount, $to_currency, $from_currency = 'RUB')
    {
        return Currency::convertAmount($amount, $to_currency, $from_currency);
    }
}

if (!function_exists('resume_title')) {
    function resume_title($key): string
    {
        switch ($key) {
            case 'email':
                return 'Email';
            case 'phone':
                return 'Моб. телефон';
            case 'telegram':
                return 'Telegram';
            case 'linked_in':
                return 'LinkedIn';
            case 'github':
                return 'GitHub';
            case 'skype':
                return 'Skype';
            case 'portfolio':
                return 'Портфолио';
            case 'attachment':
                return 'Резюме';
            default:
                return \Illuminate\Support\Str::ucfirst($key);
        }
    }
}
if (!function_exists('resume_value')) {
    function resume_value($key, $value = '')
    {
        switch ($key) {
            case 'email':
                return "<a href='mailto:{$value}' target='_blank'>{$value}</a>";
            case 'skype':
                //skype:example123?chat
                $clean_value = str_replace('@', '', $value);
                return "<a href='skype:{$clean_value}?chat' target='_blank'>{$value}</a>";
            case 'phone':
                $clean_value = clear_phone($value);
                return "<a href='tel:{$clean_value}' target='_blank'>{$value}</a>";
            case 'telegram':
                $clean_value = str_replace('@', '', $value);
                return "<a href='https://t.me/{$clean_value}' target='_blank'>{$value}</a>";
            case 'linked_in':
            case 'github':
                return "<a href='{$value}' target='_blank'>{$value}</a>";
            case 'portfolio':
                return !empty($value) ? "<a href='{$value}' target='_blank'>{$value}</a>" : '';
            case 'attachment':
                return "<a class='attachment' href='" . route('frontend.messenger.messages.download', ['fileName' => $value['file_name'], 'name' => $value['title']]) . "' target='_blank'> " . $value['title'] . "</a>";
            default:
                return $value;
        }
    }
}

if (!function_exists('removePhone')) {
    function removePhone($string)
    {
        //$pattern = "/(\+?\d{1,3}[/ \-(.]{0,2}\d{3}[/ \-.)]{0,2}[/ \-\d]{3,9}\d)/i";
        $pattern = "/(\+?[\d(]{1,3}[\/ \-(.]{0,2}[\d]{3,4}[\/ \-.)]{0,2}[\/ \-\d]{4,9})/i";
        $string = preg_replace($pattern, '[phone hidden]', $string);
        return $string;
    }
}

if (!function_exists('removeLinks')) {
    function removeLinks($string)
    {
        $pattern = "/[a-zA-Z]*[:\/\/]*[A-Za-z0-9\-_]+\.+(?!js)[A-Za-z\.\/%&=\?\-_]+/i";
        $string = preg_replace($pattern, '[url hidden]', $string);
        return $string;
    }
}


if (!function_exists('clickableLinks')) {
    function clickableLinks($string)
    {
        $pattern = "/(http|https|ftp|ftps)\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]+(\/\S*)?/i";
        $string = preg_replace($pattern, '<a href="${0}" target="_blank">${0}</a>', $string);
        $email_pattern = "/[^@\s]*@[^@\s]*\.[^@\s]*/";
        $string = preg_replace($email_pattern, '<a href="mailto:${0}" target="_blank">${0}</a>', $string);
        return $string;
    }
}

if (!function_exists('number2string')) {
    function number2string($number)
    {

        // обозначаем словарь в виде статической переменной функции, чтобы
        // при повторном использовании функции его не определять заново
        static $dic = [

            // словарь необходимых чисел
            [
                -20 => 'двадцать',
                -10 => 'десять',
                -2 => 'две',
                -1 => 'одна',
                1 => 'один',
                2 => 'два',
                3 => 'три',
                4 => 'четыре',
                5 => 'пять',
                6 => 'шесть',
                7 => 'семь',
                8 => 'восемь',
                9 => 'девять',
                10 => 'десять',
                11 => 'одиннадцать',
                12 => 'двенадцать',
                13 => 'тринадцать',
                14 => 'четырнадцать',
                15 => 'пятнадцать',
                16 => 'шестнадцать',
                17 => 'семнадцать',
                18 => 'восемнадцать',
                19 => 'девятнадцать',
                20 => 'двадцать',
                30 => 'тридцать',
                40 => 'сорок',
                50 => 'пятьдесят',
                60 => 'шестьдесят',
                70 => 'семьдесят',
                80 => 'восемьдесят',
                90 => 'девяносто',
                100 => 'сто',
                200 => 'двести',
                300 => 'триста',
                400 => 'четыреста',
                500 => 'пятьсот',
                600 => 'шестьсот',
                700 => 'семьсот',
                800 => 'восемьсот',
                900 => 'девятьсот'
            ],

            // словарь порядков со склонениями для плюрализации
            [
                ['рубль', 'рубля', 'рублей'],
                ['тысяча', 'тысячи', 'тысяч'],
                ['миллион', 'миллиона', 'миллионов'],
                ['миллиард', 'миллиарда', 'миллиардов'],
                ['триллион', 'триллиона', 'триллионов'],
                ['квадриллион', 'квадриллиона', 'квадриллионов'],
                // квинтиллион, секстиллион и т.д.
            ],

            // карта плюрализации
            [
                2, 0, 1, 1, 1, 2
            ]
        ];

        // обозначаем переменную в которую будем писать сгенерированный текст
        $string = [];

        // дополняем число нулями слева до количества цифр кратного трем,
        // например 1234, преобразуется в 001234
        $number = str_pad($number, ceil(strlen($number) / 3) * 3, 0, STR_PAD_LEFT);

        // разбиваем число на части из 3 цифр (порядки) и инвертируем порядок частей,
        // т.к. мы не знаем максимальный порядок числа и будем бежать снизу
        // единицы, тысячи, миллионы и т.д.
        $parts = array_reverse(str_split($number, 3));

        // бежим по каждой части
        foreach ($parts as $i => $part) {

            // если часть не равна нулю, нам надо преобразовать ее в текст
            if ($part > 0) {

                // обозначаем переменную в которую будем писать составные числа для текущей части
                $digits = [];

                // если число треххзначное, запоминаем количество сотен
                if ($part > 99) {
                    $digits[] = floor($part / 100) * 100;
                }

                // если последние 2 цифры не равны нулю, продолжаем искать составные числа
                // (данный блок прокомментирую при необходимости)
                if ($mod1 = $part % 100) {
                    $mod2 = $part % 10;
                    $flag = $i == 1 && $mod1 != 11 && $mod1 != 12 && $mod2 < 3 ? -1 : 1;
                    if ($mod1 < 20 || !$mod2) {
                        $digits[] = $flag * $mod1;
                    } else {
                        $digits[] = floor($mod1 / 10) * 10;
                        $digits[] = $flag * $mod2;
                    }
                }

                // берем последнее составное число, для плюрализации
                $last = abs(end($digits));

                // преобразуем все составные числа в слова
                foreach ($digits as $j => $digit) {
                    $digits[$j] = $dic[0][abs($digit)];
                }

                // добавляем обозначение порядка или валюту
                $digits[] = $dic[1][$i][(($last %= 100) > 4 && $last < 20) ? 2 : $dic[2][min($last % 10, 5)]];

                // объединяем составные числа в единый текст и добавляем в переменную, которую вернет функция
                array_unshift($string, join(' ', $digits));
            }
        }

        // преобразуем переменную в текст и возвращаем из функции, ура!
        return join(' ', $string);
    }
}

if (!function_exists('cleantxt')) {
    /**
     * Очистка текста от ненужных тегов
     * баг не сохраняет текст с двоеточием "текст: текст"
     * @param $string
     * @return array|string|string[]
     */
    function cleantxt($string)
    {
        // remove unwanted style propeties
        $except = ['color', 'text-align', 'font-size', 'height', 'width']; // declare your exceptions
        $allow = implode('|', $except);
        $regexp = '@([^;"]+)?(?<!' . $allow . '):(?!\/\/(.+?)\/)((.*?)[^;"]+)(;)?@is';
        //$string = preg_replace($regexp, '', $string);
        //$string = preg_replace('@[a-z]*=""@is', '', $string); // remove any unwanted style attributes
        $regexp = '@([^;"]+)?(?<!' . $allow . '):(?!\/\/(.+?)\/)((.*?)[^;"]+)(;)?@is';//this line should be replaced with other gibberish that excludes certain strings of 4 characters...
        $string = preg_replace($regexp, '', $string);
        // remove unwanted style propeties end
        $string = str_replace(' style=""', '', $string);
        $string = str_replace('h1>', 'div>', $string);
        $string = str_replace('h2>', 'div>', $string);
        $string = str_replace('h3>', 'div>', $string);
        $string = str_replace('h4>', 'div>', $string);
        $string = str_replace('h5>', 'div>', $string);
        return $string;
    }
}
