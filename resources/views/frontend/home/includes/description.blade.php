<div class="home-section py-50 py-lg-100 ">
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-4">
                <h2 class="home-section-title text-lg-start">
                    {!! html_block('introduction')->{'title_'.app()->getLocale()} !!}
                </h2>
            </div>
            <div class="col-12 col-lg-8">
                <div class="home-section-text mb-40">
                    {!! html_block('introduction')->{'description_'.app()->getLocale()} !!}
                </div>
                {{--                <a href="{{route('frontend.pages', 'about')}}" class="home-section-more">{{__('More details')}} <i class="btn btn-round btn-outline-secondary">{{svg('arrow-right')}}</i></a>--}}
            </div>
        </div>

    </div>
</div>
