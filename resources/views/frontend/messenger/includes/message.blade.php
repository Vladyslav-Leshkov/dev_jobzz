<p>{!! $body !!}</p>
@if(isset($vacancyUrl) && !empty($vacancyUrl))
    <div class="mb-5">
        {!! $vacancyUrl !!}
    </div>
@endif
@if(!empty($attachment))
    <div>
        <a class='attachment'
           href='{{route('frontend.messenger.messages.download', ['fileName'=>$attachment['file_name'], 'name'=>$attachment['title']])}}'
           target='_blank'>{{$attachment['title']}}</a>
    </div>
@endif
