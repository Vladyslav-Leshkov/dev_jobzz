<?php

namespace Database\Seeders;

use App\Models\Content\Page;
use Database\Seeders\Traits\TruncateTable;
use Illuminate\Database\Seeder;

class PagesSeeder extends Seeder
{

    use TruncateTable;

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        //$this->truncate('pages');

        $pages = [
            [
                'title' => ['en' => 'Terms of use JOBZZ.RU', 'ru' => 'Условия пользования JOBZZ.RU'],
                'seo_h1' => ['en' => 'Terms of use JOBZZ.RU', 'ru' => 'Условия пользования JOBZZ.RU'],
                'slug' => 'terms',
                'published' => 1,
            ],
            [
                'title' => ['en' => 'Rules of use', 'ru' => 'Правила пользования'],
                'seo_h1' => ['en' => 'Rules of use JOBZZ.RU', 'ru' => 'Правила пользования JOBZZ.RU'],
                'slug' => 'rules',
                'published' => 1,
            ],

            [
                'title' => ['en' => 'Privacy Policy', 'ru' => 'Политика конфиденциальности'],
                'seo_h1' => ['en' => 'Privacy Policy', 'ru' => 'Политика конфиденциальности'],
                'slug' => 'policy',
                'published' => 1,
            ],
            [
                'title' => ['en' => 'About the platform', 'ru' => 'О платформе'],
                'seo_h1' => ['en' => 'About the platform', 'ru' => 'О платформе'],
                'slug' => 'about',
                'published'=>1,
            ],
            [
                'title'=>['en'=>'Information', 'ru'=>'Информация'],
                'seo_h1'=>['en'=>'Information', 'ru'=>'Информация'],
                'slug'=>'info',
                'published'=>1,
            ],
            [
                'title'=>['en'=>'Contacts', 'ru'=>'Контакты'],
                'seo_h1'=>['en'=>'Contacts', 'ru'=>'Контакты'],
                'slug'=>'contacts',
                'published'=>1,
            ],
            [
                'title' => ['en' => 'Partnership', 'ru' => 'Партнёрство'],
                'seo_h1' => ['en' => 'Partnership', 'ru' => 'Партнёрство'],
                'slug' => 'partnership',
                'published' => 1,
            ],
            [
                'title' => ['en' => 'For employers', 'ru' => 'Работодателям'],
                'seo_h1' => ['en' => 'For employers', 'ru' => 'Работодателям'],
                'slug' => 'for-employers',
                'published' => 1,
            ],
            [
                'title' => ['en' => 'Home Page', 'ru' => 'Домашняя страница'],
                'seo_h1' => ['en' => "ANONYMOUS JOB SEARCH\nON THE JOBZZ.RU", 'ru' => "АНОНИМНЫЙ ПОИСК\nРАБОТЫ В АЙТИ СФЕРЕ"],
                'seo_title' => ['en' => 'Jobzz work in IT for developers in Moscow or remotely', 'ru' => 'Jobzz работа в айти для разработчиков в Москве или удалённо'],
                'seo_description' => ['en' => 'Jobzz work in IT for developers in Moscow or remotely', 'ru' => 'Jobzz работа в айти для разработчиков в Москве или удалённо'],
                'seo_keywords' => ['en' => 'Jobzz work in IT for developers in Moscow or remotely', 'ru' => 'Jobzz работа в айти для разработчиков в Москве или удалённо'],
                'slug' => 'home',
                'published' => 1,
            ],
        ];
        //for-employers
        foreach ($pages as $page) {

            if (Page::where('slug', $page['slug'])->count() === 0) {
                Page::create($page);
            }

        }
    }
}
