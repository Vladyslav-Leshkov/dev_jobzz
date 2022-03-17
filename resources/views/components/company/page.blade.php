@props(['company'=> new \App\Models\Job\Company(), 'vacancies'=>[]])
<div {{ $attributes->merge(['class' => 'company-page']) }}>
    <div class="row align-items-center">
        <div class="col-12 col-lg-auto">
            <img class="company-page-logo" src="{{$company->logo_url}}" alt="{{$company->title}}">
        </div>
        <div class="col-12 col-lg">
            <div class="profile-title">{{$company->title}}</div>
            <div class="mb-10">{{__('Jobs on jobzz.ru')}}: <span class="text-primary">{{$vacancies->count()}}</span>
            </div>
            <div class="company-meta mb-20">
                @if($company->address)
                    <div class="meta-item">
                        <div class="meta-icon">{{svg('building')}}</div>
                        <div>
                            <div class="meta-title">@lang('Headquarters'):</div>
                            <div class="meta-value">{{$company->address}}</div>
                        </div>
                    </div>
                @endif
                @if($company->website)
                    <div class="meta-item">
                        <div class="meta-icon">{{svg('url')}}</div>
                        <div>
                            <div class="meta-title">@lang('Website'):</div>
                            <div class="meta-value">
                                <a href="{{$company->website}}" target="_blank"
                                   rel="nofollow">{{$company->website}}</a>
                            </div>
                        </div>
                    </div>
                @endif
            </div>
        </div>

    </div>

    <hr class="mb-25">
    <div class="profile-title">{{__('About company')}}</div>
    <div class="company-description mb-50 font-15">
        {!! nl2br(strip_tags($company->description)) !!}
    </div>

    {{$slot ?? ''}}

</div>
