<form v-is="'candidate-offer'"
      action="{{route('frontend.candidate.offer', $profile)}}"
      :vacancies='@json($vacancies)'
      :already-sent="@json($already_sent)"
      comment="{{$comment}}"
>
    @csrf
</form>

