@extends('mage2-install::layouts.install')

@section('content')
    <div class="col-md-6">
        <div class="card card-default">
            <div class="card-header">Welcome to Mage2 Installation</div>
            <div class="card-body">


                <h2 class="text-center">Database Data Setup</h2>

                {!! Form::open(['method' => 'post','action' => route('mage2.install.database.data.post')]) !!}

                {!! Form::hidden('identifier','mage2-install') !!}
                {!! Form::select('install_data','Install Dummy Data',['no' => "No",'yes' => 'Yes']) !!}
                <p>Click Continue to install Database</p>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Continue</button>
                </div>
                {!! Form::close() !!}
            </div>
        </div>
    </div>
@endsection