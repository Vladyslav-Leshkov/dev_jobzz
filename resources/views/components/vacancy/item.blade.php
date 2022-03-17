@props(['vacancy'=> new \App\Models\Job\Vacancy()])
<div {{$attributes->merge(['class'=>'vacancy-item'])}}>
    <a href="{{$vacancy->url}}" class="vacancy-title d-block mw-760 mb-20">{{$vacancy->title}}</a>
    <div class="vacancy-meta mb-30">
        <div class="meta-item">
            <div class="meta-title">@lang('Publish Date')</div>
            <div class="meta-value">{{$vacancy->created_at->format('d.m.Y')}}</div>
        </div>

        <div class="meta-item">
            <div class="meta-title">@lang('Interest')</div>
            <div class="meta-value">
                <a href="{{route('frontend.profile.vacancy.candidates', $vacancy)}}">
                    @lang('Job Applications')
                    ({{$vacancy->candidates_count}})
                </a>
            </div>
        </div>

    </div>
    <div class="vacancy-description mb-30">
        {!! nl2br($vacancy->short_description) !!}
    </div>
    <div class="vacancy-actions">
        @if(!$vacancy->isArchived())
            <div><a href="{{$vacancy->url}}" data-clip-copy="{{$vacancy->url}}"
                    class="btn btn-link">{{svg('copy', 'svg-icon me-10')}} @lang('Copy vacancy link')</a></div>
        @endif
        @if($vacancy->isArchived())
            <div>

                <x-utils.form-button button-class="btn btn-outline-danger"
                                     onsubmit="{{__('Are you sure?')}}"
                                     method="DELETE"
                                     title="{{__('Delete vacancy')}}"
                                     :tooltip="true"
                                     action="{{route('frontend.profile.vacancy.destroy', $vacancy)}}"
                >{{__('Delete vacancy')}}</x-utils.form-button>
            </div>
        @endif
        <div class="mt-10 mt-lg-0">
            @if($vacancy->status === \App\Models\Job\Vacancy::STATUS_ACTIVE)
                <x-utils.form-button button-class="btn btn-outline-primary"
                                     method="PATCH"
                                     action="{{route('frontend.profile.vacancy.hold', $vacancy)}}"
                >@lang('Hold vacancy (7 days)')
                </x-utils.form-button>

            @endif
            @if($vacancy->isArchived())
                <a href="{{route('frontend.profile.vacancy.activate', ['vacancy'=>$vacancy, 'publish'=>1])}}"
                   class="btn btn-primary ms-15">@lang('Publish')</a>
            @endif
            <a href="{{route('frontend.profile.vacancy.edit', $vacancy)}}"
               class="btn btn-primary ms-15">@lang('Edit') {{svg('edit', 'svg-icon ms-50')}}</a>
            @if($vacancy->status === \App\Models\Job\Vacancy::STATUS_INACTIVE)
                <a href="{{route('frontend.profile.vacancy.activate', $vacancy)}}"
                   class="btn btn-info ms-15">@lang('Activate') {{svg('arrow-right', 'svg-icon ms-50 fill-dark')}}</a>
            @endif


            @if(!$vacancy->isArchived())
                <div v-is="'vacancy-close-btn'" :vacancy='@json($vacancy)'></div>
            @endif
        </div>
    </div>
</div>
