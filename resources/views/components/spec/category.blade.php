@props([
    'category'=> new \App\Models\Job\SpecializationType(),
    'items'=>[],
    'showAll'=>true,
    'single'=>false,
])
<div {{$attributes->merge(['class'=>'spec-category'])}} >
    <div class="spec-category-header mb-20 mb-lg-40">
        @if($single)
            <h1 class="spec-category-title">{{$category->title}}</h1>
        @else
            <div class="spec-category-title">{{$category->title}}</div>
        @endif
        @if($showAll)
            <a href="{{$category->url}}" class="spec-category-url">
                <span>Все категории</span> <span class="btn btn-round btn-primary ms-15">{{svg('arrow-right')}}</span>
            </a>
        @endif
    </div>

    <div class="spec-category-items row">
        @foreach($items as $item)
            <div class="col-12 col-lg-6 col-xl-4 mb-25">
                <x-spec.item :item="$item" ></x-spec.item>
            </div>
        @endforeach
    </div>
</div>
