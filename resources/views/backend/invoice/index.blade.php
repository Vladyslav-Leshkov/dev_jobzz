@extends('backend.layout.app')

@section('title', __('Invoices'))

@section('content')
    <div class="mb-2">
        {!! breadcrumbs([
            ['url'=>route('admin.dashboard'), 'title'=>__('Home')],
            ['url'=>route('admin.invoice.index'), 'title'=>__('Invoices')],
        ]) !!}
    </div>
    <div class="d-flex justify-content-between">
        <h1>@lang('Invoices')</h1>

        <div></div>
    </div>

    <div class="card">
        <div class="card-body">
            <h5>Назначение кнопок</h5>
            <div class="mb-30">
                <div><span class="badge bg-success">Оплачен</span> - Счет помечается как оплаченный, пользователю
                    начисляются наймы, кандидаты помечаются как оплаченные, заблокированный пользователь разблокируется
                </div>
                <div><span class="badge bg-danger">Отменить</span> - Счет помечается как отмененный, пользователю
                    наймы НЕ начисляются, кандидаты помечаются как оплаченные, заблокированный пользователь
                    разблокируется
                </div>
                {{--                <div><span class="badge bg-warning">Просрочен</span> - Счет помечается как просроченный, пользователю--}}
                {{--                    наймы НЕ начисляются, кандидаты помечаются как НЕ оплаченные, заблокированный пользователь НЕ--}}
                {{--                    разблокируется--}}
                {{--                </div>--}}
            </div>

            <livewire:backend.payouts-table/>
            {{--            <livewire:backend.invoices-table/>--}}
        </div>
    </div>
@endsection
