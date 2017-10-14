@extends('mage2-install::layouts.install')

@section('content')


    <div class="col-md-6">
        <div class="card card-default">
            <div class="card-header"><h1>Welcome to Mage2 Ecommerce Installation</h1></div>
            <div class="card-body">


                <h4 class="text-center">Create Admin Account</h4>

                <form action="{{ route('mage2.install.admin.post') }}" method="post" id="create-admin-user-form">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <label for="first_name">First Name</label>
                        <input type="text" name="first_name" class="form-control" id="first_name"  />
                    </div>

                    <div class="form-group">
                        <label for="last_name">Last Name</label>
                        <input type="text" name="last_name" class="form-control" id="last_name"  />
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text" name="email" class="form-control" id="email"  />
                    </div>


                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" name="password" class="form-control" id="password"  />
                    </div>

                    <div class="form-group">
                        <label for="password_confirmation">Confirm Password</label>
                        <input type="password" name="password_confirmation" class="form-control" id="password_confirmation"  />
                    </div>

                    <input type="hidden" name="language" value="en">
                    <div class="form-group">
                        <button class="btn btn-primary create-user-button" type="button">Continue</button>
                    </div>

                </form>

            </div>
        </div>
    </div>

    @push('styles')
    <script>
        jQuery(document).ready(function () {
            jQuery('.create-user-button').click(function (e) {
                e.preventDefault();
                jQuery(e.target).button('loading');
                jQuery('#create-admin-user-form').submit();
            });

        });
    </script>
    @endpush
@endsection