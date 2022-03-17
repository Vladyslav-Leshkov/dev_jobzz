<div class="home-section mb-30 mb-lg-70">
    <div class="container">
        <h2 class="home-section-title mb-30 mb-lg-80">
            <small>{{__('Popular')}}</small>
            <span>{{__('Job Categories')}}</span>
        </h2>

        @foreach($spec_types as $category)
            <x-spec.category :category="$category" :items="$category->items->take(6)" class="mb-35"></x-spec.category>
        @endforeach


        <div class="spec-more">
            <a href="{{route('frontend.category.index')}}" class="spec-more spec-category-url">
                <span>{{__('More categories')}}</span>
                <span class="btn btn-round btn-outline-secondary ms-15">{{svg('arrow-right')}}</span>
            </a>
        </div>
    </div>
</div>
