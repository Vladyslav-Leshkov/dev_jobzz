<?php

namespace Database\Seeders;

use App\Models\Content\Menu;
use App\Models\Content\MenuItem;
use Database\Seeders\Traits\DisableForeignKeys;
use Database\Seeders\Traits\TruncateTable;
use Illuminate\Database\Seeder;

class MenuSeeder extends Seeder
{
    use TruncateTable, DisableForeignKeys;

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $this->disableForeignKeys();
        $this->truncateMultiple([
            'menu_items',
            'menus',
        ]);

        $menus = [
            [
                'title' => 'Шапка Гость',
                'slug' => 'navbar-guest',
                'items' => [
                    ['title' => ['ru' => 'Вакансии', 'en' => 'Vacancies'], 'slug' => '/vacancies', 'active' => 1, 'position' => 0, 'button' => 1],
                    ['title' => ['ru' => 'Информация', 'en' => 'Information'], 'slug' => '/info', 'active' => 1, 'position' => 1],
                    ['title' => ['ru' => 'Работодателям', 'en' => 'For employers'], 'slug' => '/for-employers', 'active' => 1, 'position' => 1, 'side' => MenuItem::SIDE_RIGHT],
                ],
            ],
            [
                'title' => 'Шапка Кандидат',
                'slug' => 'navbar-candidate',
                'items' => [
                    ['title' => ['ru' => 'Вакансии', 'en' => 'Vacancies'], 'slug' => '/vacancies', 'active' => 1, 'position' => 0],
                    ['title' => ['ru' => 'Работодателям', 'en' => 'For employers'], 'slug' => '/for-employers', 'active' => 0, 'position' => 1],
                    ['title' => ['ru' => 'Информация', 'en' => 'Information'], 'slug' => '/info', 'active' => 1, 'position' => 2],
                    ['title' => ['ru' => 'Я Нашёл работу', 'en' => 'Found a job'], 'slug' => '/recruiter/confirm', 'active' => 1, 'position' => 3],
                    ['title' => ['ru' => 'Контакты', 'en' => 'Contacts'], 'slug' => '/contacts', 'active' => 0, 'position' => 4],
                    ['title' => ['ru' => 'Сообщения', 'en' => 'Messages'], 'slug' => '/messenger', 'active' => 1, 'position' => 5, 'side' => MenuItem::SIDE_RIGHT],
                ],
            ],
            [
                'title' => 'Шапка Рекрутер',
                'slug' => 'navbar-recruiter',
                'items' => [
                    ['title' => ['ru' => 'Кандидаты', 'en' => 'Candidates'], 'slug' => '/candidates', 'active' => 1, 'position' => 0],
                    ['title' => ['ru' => 'Информация', 'en' => 'Information'], 'slug' => '/info', 'active' => 0, 'position' => 1],
                    ['title' => ['ru' => 'Сообщения', 'en' => 'Messages'], 'slug' => '/messenger', 'active' => 1, 'position' => 2],
                ],
            ],
        ];


        foreach ($menus as $menu_data) {
            $menu_items = $menu_data['items'];
            unset($menu_data['items']);
            $menu = Menu::create($menu_data);
            foreach ($menu_items as $position => $menu_item_data) {
                $menu_item_data['menu_id'] = $menu->id;
                $menu_item = MenuItem::create($menu_item_data);
            }
        }

        $this->enableForeignKeys();
    }
}
