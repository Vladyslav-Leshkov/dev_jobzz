@props(['item'=>new \App\Models\Job\Specialization()])
<a href="{{$item->url}}" {{$attributes->merge(['class'=>'spec-item'])}}>
    <div class="spec-item-image">
        <img src="{{$item->logo_url}}" alt="{{$item->title}}">
    </div>

    <div>
        <div class="spec-item-meta"> <div class="badge bg-light">{{$item->vacancies_count}}</div> {{plural_form( $item->vacancies_count,['вакансия', 'вакансии', 'вакансий'])}}</div>
        <div class="spec-item-title">{{$item->title}}</div>
    </div>

    <div class="arrow">{{svg('arrow-right')}}</div>
</a>
