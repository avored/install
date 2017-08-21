@extends('mage2-install::layouts.install')

@section('content')

    <div class="col-md-6">
        <div class="card card-default card-installation center-block">
            <div class="card-header"><h1>Welcome to Mage2 Ecommerce App Installation</h1></div>
            <div class="card-body">
                <h4>
                    You have successfully install!
                </h4>
                <p>
                    <a href="{{ route('admin.login') }}" class="btn btn-primary">Admin Login</a>
                </p>
            </div>
        </div>
    </div>
@endsection