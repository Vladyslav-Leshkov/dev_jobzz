<div>
    @forelse($notifications as $message)
        <div class="alert justify-content-between p-10 alert-{{$message->type}} {{$message->viewed ? 'viewed' : ''}}">
           <div>
               <strong class="alert-heading font-18">{{$message->title}}</strong>
               <div>
                   {!! $message->message !!}
               </div>
               <div class="text-muted small mt-1">{{$message->time}}</div>
           </div>
           <div class="d-flex font-18">
               @if(!$message->viewed)
               <a href="#" class="text-info me-3" wire:click.prevent="markAsView({{$message->id}})" aria-label="View">
                   <i class="fa fa-eye"></i>
               </a>
               @endif
               <a href="#" class="text-danger" wire:click.prevent="delete({{$message->id}})" aria-label="Close">
                   <i class="fa fa-times"></i>
               </a>
           </div>
        </div>
    @empty
        <div>Нет уведомлений</div>
    @endforelse


    {{$notifications->links()}}
</div>
