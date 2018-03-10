@extends('avored-install::layouts.install')

@section('content')

    <div class="container">
        <div class="col-md-8 col-sm-12">
            <div class="card card-default">
                <div class="card card-default card-installation center-block">
                    <div class="card-header"><h1>Welcome to AvoRed Ecommerce App Installation</h1></div>
                    <div class="card-body">
                        <h2>
                            You have successfully install!
                        </h2>
                        <p>
                            <a href="{{ route('admin.login') }}" class="btn btn-primary">Admin Login</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection