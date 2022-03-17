<div class="push-question">
    <span>Вы открывали свои контакты</span>
    <a href="{{$recruiter->recruiter_url}}" class="user" target="_blank">
        <img src="{{$recruiter->avatar_url}}" alt="{{$recruiter->name}}" class="user-avatar">
        <span>
            <b class="user-name">{{$recruiter->name}}</b>
            <span class="user-company">{{$recruiter->position}} {{$recruiter->company ? ' at '.$recruiter->company->title : ''}}</span>
            @if($recruiter->company && $recruiter->company->logo)
                <img src="{{$recruiter->company->logo_url}}" alt="{{$recruiter->company->title}}"
                     class="company-avatar">
            @endif
        </span>
    </a>
    <span>на позицию <a href="{{$vacancy->url}}" target="_blank">"{{$vacancy->title}}"</a> были ли вы наняты в данную компанию?</span>
</div>
