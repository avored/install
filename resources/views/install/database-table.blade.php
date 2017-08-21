@extends('mage2-install::layouts.install')
@section('content')

    <div class="col-md-6">
        <div class="card card-default">
            <div class="card-header">Welcome to Mage2 Installation</div>
            <div class="card-body">

                <h2 class="text-center">Database Table Setup</h2>

                {!! Form::open(['id' => 'install-module-form','method' => 'post','action' => route('mage2.install.database.table.post')]) !!}

                <p>Click Continue to install Database</p>

                <div class="col s12">
                    <button type="button" class="btn btn-primary install-new-button">Install Database</button>
                </div>
                {!! Form::close() !!}

            </div>
        </div>
    </div>
    @push('scripts')
    <script>

        jQuery(document).ready(function () {

            jQuery('.install-new-button').click(function (e) {

                //#install-module-form
                jQuery(this).button('loading');
                jQuery('#install-module-form').submit();
            });

        });
    </script>
    @endpush


    @endsection