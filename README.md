# JOBZZ PROJECT
## Системные Требования

- PHP версии 7.3 и выше
- MYSQL версии 5.7 и выше
- NodeJS версии 12 и выше

## Установка

Переименуйте файл `.env.examle`  в корне проекта в файл `.env`

Установите пакеты с помощью [composer](https://getcomposer.org/) 
вызвав команду `composer install` в консоли.

Установите пакеты с помощью [npm](https://www.npmjs.com/) 
вызвав команду `npm install` в консоли.

Создайте свою базу данных на своем сервере и обновить в файле .env следующие строки:
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=
```

Сгенерируйте ключ безопастности с помощью команды  
`php artisan key:generate`

Запустите миграции базы данных с помощью команды  
`php artisan migrate`

Заполните базу данных:  
`php artisan db:seed`

После того, как ваш проект установлен, вы должны запустить команду, чтобы связать вашу общую папку хранилища для 
загрузки файлов:  
`php artisan storage:link`


## Разработка
Файлы стилей и скриптов создаются с использованием Laravel Mix, который является оболочкой для многих инструментов и 
работает с файлом webpack.mix.js в корне проекта.

Вы можете построить их с помощью команды:  
`npm run <command>`

Доступные команды перечислены в верхней части файла package.json под ключом «scripts».

## Панель администратора
Находится по адресу *http://stitename.com/admin*

Учетные данные администратора по умолчанию:  
**Username:** admin@admin.com  
**Password:** secret

## Запуск WebSocket server
`php artisan websockets:serve`

## Библиотеки и пакеты

- PHP Фреймворк [Laravel 8](https://laravel.com/) 
- CSS Фреймворк [Bootstrap 5](https://getbootstrap.com/) 
- JS фреймворк [Vue.js](https://vuejs.org/)
- Управление ролями и доступом [Laravel Permission](https://spatie.be/docs/laravel-permission/v4/introduction)
- Связывание всевозможных файлов с моделями [Laravel Medialibrary](https://spatie.be/docs/laravel-medialibrary/v7/introduction)


#### В админке также подключены
- Фреймворк [Laravel Livewire](https://laravel-livewire.com/)
- Иконки [Feather](https://feathericons.com/)
- JS фреймворк [Alpine.js](https://github.com/alpinejs/alpine) (альтернатива vue.js)

#### Рекомендуемые пакеты
- В качестве альтернативы [Pusher](https://pusher.com/) можно использовать 
[Laravel WebSockets](https://beyondco.de/docs/laravel-websockets/getting-started/introduction)
- Для каталога неограниченной вложенности можно использовать [Laravel Nestedset](https://github.com/lazychaser/laravel-nestedset)
- Пакет для чата [Chatify](https://github.com/munafio/chatify)
