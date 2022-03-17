<div class="page__offer offer-page">
    <div class="offer-page__image"></div>
    <div class="container">
        <div class="offer-page__items">
            <div class="offer-page__item">
                <div class="offer-page__title">{{__('Are you ready to collaborate?')}}</div>
                <div class="offer-page__text">
                    {!! html_block('cooperation_text')->{'description_'.app()->getLocale()}  !!}
                </div>
                <div class="offer-page__icons icons-offer">
                    <div class="icons-offer__text">{{__('Contact us here')}}</div>
                    <a href="{{site_option('linked_in', '#')}}" class="icons-offer__in"></a>
                    <div class="icons-offer__or">{{__('or')}}</div>
                    <a href="mailto:{{site_option('contact_email', 'mail@mail.com')}}"
                       class="icons-offer__email"><i class="icons-offer__em"></i></a>
                    <div class="icons-offer__text">{{site_option('contact_email', 'mail@mail.com')}}</div>

                </div>
            </div>

        </div>
    </div>
</div>
