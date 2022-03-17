<div class="home-section bg-light partners-section">
    <div class="container">
        <h2 class="home-section-title text-start mb-40">
            <small>{{__('Search on our portal')}}</small>
            <span>{{__('Our partners')}}</span>
        </h2>
        <div class="carousel slide" data-bs-ride="carousel" id="home-partners-slider">
            <div class="carousel-indicators">
                @for($idx = 0; $idx < count($partners); $idx++)
                    <button type="button" data-bs-target="#home-partners-slider" data-bs-slide-to="{{$idx}}"
                            class="{{$idx === 0 ? 'active' : ''}}"></button>
                @endfor
            </div>
            <div class="carousel-inner">
                @foreach($partners as $idx=>$chunk)
                    <div class="carousel-item {{$idx === 0 ? 'active': ''}}">
                        <div class="partners-container">
                            @foreach($chunk as  $item)
                                <div class="partner-item" title="{{$item->title}}">
                                    <img src="{{$item->logo_url}}" alt="{{$item->title}}">
                                </div>
                        @endforeach
                    </div>
                </div>
                @endforeach
            </div>
        </div>

    </div>
</div>
