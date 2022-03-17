<div class="home-banner">
    <div class="container">
        <h1>{!! nl2br($pageContent->getSeoH1())  !!}</h1>

        <div class="home-banner-btns mw-620">
            <a href="{{route('frontend.auth.register', 'candidate')}}" class="btn btn-white me-20">
                <span>@lang('candidate.candidate-registration')</span>
                <i class="bg-primary">{{svg('arrow-right')}}</i>
            </a>
            <div class="w-100"></div>
            <a href="{{route('frontend.auth.register', 'recruiter')}}" class="btn btn-white ms-lg-75">
                <span>@lang('candidate.employer-registration')</span>
                <i class="bg-primary">{{svg('arrow-right')}}</i>
            </a>
            <div class="w-100"></div>
            <a href="{{route('frontend.vacancy.index')}}" class="btn btn-white ms-lg-190">
                <span>@lang('candidate.look-around')</span>
                <i class="bg-primary">{{svg('arrow-right')}}</i>
            </a>
        </div>
    </div>
</div>
