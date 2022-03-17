{{--@formatter:off--}}
@component('mail::message')
# Вступление

Это тестовое сообщение
Не нужно на него отвечать
Благодарим за сотрудничество

@component('mail::button', ['url' => 'https://jobzz.ru'])
Кнопка
@endcomponent

Спасибо, {{ config('app.name') }}
@endcomponent
