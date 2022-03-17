{!! $body !!}

<div class="message-resume">
    <div class="message-resume-title">{{__('Opened resume')}}</div>
    <div class="message-resume-row">
        @foreach($data as $key=>$val)
            <div class="message-resume-col">
                <div class="mri-title">{{resume_title($key)}}</div>
                <div class="mri-value">{!! resume_value($key, $val) !!}</div>
            </div>
        @endforeach
    </div>
</div>
