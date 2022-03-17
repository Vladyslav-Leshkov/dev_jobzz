@if ($user->isAdmin())
    @lang('Administrator')
@elseif ($user->type == 'support')
    @lang('Support')
@elseif ($user->type == 'candidate')
    @lang('candidate.title')
@elseif ($user->type == 'recruiter')
    @lang('Recruiter')
@else
    @lang('N/A')
@endif
