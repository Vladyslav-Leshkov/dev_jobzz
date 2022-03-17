<div {{$attributes->merge(['class'=>'container container-fluid-xl'])}}>
    <div class="row align-items-stretch">
        <div class="col-12 col-xl-auto sidebar-container">
            <a href="#" class="sidebar-close">{{svg('times')}}</a>
            <div class="sidebar-body">
                {{$sidebar}}
            </div>
        </div>
        <div class="col-12 col-xl-auto page-container">
            <div class="page-body">
                {{$body}}
            </div>
        </div>
    </div>
</div>

