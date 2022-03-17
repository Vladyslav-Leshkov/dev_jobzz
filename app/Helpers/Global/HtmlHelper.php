<?php

if (!function_exists('activeClass')) {
    /**
     * Get the active class if the condition is not falsy.
     *
     * @param        $condition
     * @param string $activeClass
     * @param string $inactiveClass
     *
     * @return string
     */
    function activeClass($condition, string $activeClass = 'active', string $inactiveClass = ''): string
    {
        return $condition ? $activeClass : $inactiveClass;
    }
}

if (!function_exists('routeActive')) {
    /**
     * Get the active class if the condition is not falsy.
     *
     * @param        $condition
     * @param string $activeClass
     * @param string $inactiveClass
     *
     * @return string
     */
    function routeActive($routeName)
    {
        if (request()->route()) {
            $currentName = request()->route()->getName();
            if (str_ends_with($routeName, '*')) {
                return str_starts_with($currentName, rtrim($routeName, "*"));
            }

            return $currentName === $routeName;
        }
        return false;
    }
}


if (!function_exists('routeActiveClass')) {
    /**
     * Get the active class if the condition is not falsy.
     *
     * @param        $condition
     * @param string $activeClass
     * @param string $inactiveClass
     *
     * @return string
     */
    function routeActiveClass($routeName, $activeClass = 'active', $inactiveClass = '')
    {
        if (request()->route()) {
            $currentName = request()->route()->getName();
            if (str_ends_with($routeName, '*')) {
                return str_starts_with($currentName, rtrim($routeName, "*"))
                    ? $activeClass : $inactiveClass;
            }

            return ($currentName === $routeName) ? $activeClass : $inactiveClass;
        }
        return false;
    }
}

if (!function_exists('htmlLang')) {
    /**
     * Access the htmlLang helper.
     */
    function htmlLang()
    {
        return str_replace('_', '-', app()->getLocale());
    }
}

if (!function_exists('svg')) {
    /**
     * Embed svg icon.
     *
     * @param $icon
     * @param string $class
     *
     * @return false|string
     */
    function svg($icon, $class = '')
    {
        try {
            $svg = new \DOMDocument();
            $svg->load(resource_path("svg/$icon.svg"));
            $svg->documentElement->setAttribute("class", $class);
            echo $svg->saveXML($svg->documentElement);
            return '';
        } catch (Exception $e) {
            \Illuminate\Support\Facades\Log::error($e->getMessage(), $e->getTrace());
        }
    }
}

if (!function_exists('breadcrumbs')) {
    /**
     * @param array $items
     *
     * @return string
     */
    function breadcrumbs($items = [])
    {
        $result = '<nav aria-label="breadcrumb"><ol class="breadcrumb">';
        $lastItemKey = count($items) - 1;
        foreach ($items as $key => $item) {
            $activeClass = $key === $lastItemKey ? ' active' : '';
            $result .= '<li class="breadcrumb-item' . $activeClass . '" itemscope itemtype = "http://data-vocabulary.org/Breadcrumb">';
            if ($key < count($items) - 1) {
                $result .= '<a href="' . $item['url'] . '" itemprop="url"><span itemprop="title">' . $item['title'] . '</span></a>';
            } else {
                $result .= '<link href="' . $item['url'] . '" itemprop="url" /><span itemprop="title">' . $item['title'] . '</span>';
            }
            $result .= '</li>';
        }
        $result .= '</ol></nav>';

        return $result;
    }
}

if (!function_exists('html_block')) {

    function html_block($slug)
    {
        return \App\Models\Content\HtmlBlock::getCachedBlock($slug);
    }
}

if (!function_exists('html_block_title')) {

    function html_block_title($slug, $default = '')
    {
        $block = html_block($slug);
        return !empty($block) ? $block->title : $default;
    }
}

if (!function_exists('br2nl')) {
    function br2nl($str)
    {
        $str = preg_replace("/(rn|n|r)/", "", $str);
        return preg_replace("=<br */?>=i", "n", $str);
    }
}

if (!function_exists('short_description')) {
    function short_description($html, $limit = 500)
    {
        return nl2br(str_limit(strip_tags(br2nl($html))), $limit);
    }
}