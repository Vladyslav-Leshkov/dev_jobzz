@if(!$submitted && !$proposed)
    <form v-is="'vacancy-offer'"
          action="{{route('frontend.vacancy.offer', $vacancy)}}"
          comment="{{$comment}}"
          regards="{{$regards}}"
          resume-name='{{current_user()->candidate_profile->resume_name}}'
    >
        @csrf
    </form>
@endif

@if($submitted)
    <div class="alert alert-secondary font-16">
        {{__('You have already submitted a response for this vacancy')}}
    </div>
@endif

@if($proposed)
    <div class="alert alert-secondary font-16">
        {{__('You have been sent an offer for this vacancy')}}
    </div>
@endif
