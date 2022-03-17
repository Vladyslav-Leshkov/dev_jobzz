<div class="home-section bg-light process-section py-50 py-lg-100">
    <div class="container">
        <div class="process-section-title">
            <h2 class="home-section-title text-lg-start">
                {{--                <small>{{__('Process description')}}</small>--}}
                <span>{{__('How it works')}}</span>
            </h2>
            <ul class="nav nav-tabs process-section-tabs" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" data-bs-toggle="tab" href="#applicant-tab">
                        {{__('For the applicant')}}
                    </a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" data-bs-toggle="tab" href="#employer-tab">
                        {{__('For the employer')}}
                    </a>
                </li>
            </ul>
        </div>
        <div class="tab-content">
            <div class="tab-pane fade show active" id="applicant-tab">
                <div class="process-page__items2">
                    @foreach(['candidate_registration', 'candidate_publishing', 'candidate_offers', 'candidate_job'] as $block_slug)
                        <div class="process-page__column2">
                            <div class="process-page__item2 item2-process">
                                <div class="item2-process__image">
                                    <img src="{{html_block($block_slug)->image}}" alt="">
                                </div>
                            </div>
                            <div class="process-page__dashed2"></div>
                            <div class="process-page__icon2"></div>
                            <div class="process-page__text2">
                                <div class="process-page__headline2">
                                    {!! html_block($block_slug)->{'title_'.app()->getLocale()}  !!}
                                </div>
                                <div class="process-page__subtitle2">
                                    {!! html_block($block_slug)->{'description_'.app()->getLocale()}  !!}
                                </div>
                            </div>
                        </div>
                    @endforeach

                </div>
            </div>
            <div class="tab-pane fade" id="employer-tab">
                <div class="process-page__items2">
                    @foreach(['recruiter_registration', 'recruiter_vacancy', 'recruiter_search', 'recruiter_offer'] as $block_slug)
                        <div class="process-page__column2">
                            <div class="process-page__item2 item2-process">
                                <div class="item2-process__image">
                                    <img src="{{html_block($block_slug)->image}}" alt="">
                                </div>
                            </div>
                            <div class="process-page__dashed2"></div>
                            <div class="process-page__icon2"></div>
                            <div class="process-page__text2">
                                <div class="process-page__headline2">
                                    {!! html_block($block_slug)->{'title_'.app()->getLocale()}  !!}
                                </div>
                                <div class="process-page__subtitle2">
                                    {!! html_block($block_slug)->{'description_'.app()->getLocale()}  !!}
                                </div>
                            </div>
                        </div>
                    @endforeach

                </div>
            </div>
        </div>

    </div>
</div>
