@extends('avored-install::layouts.install')

@section('content')

    <div class="container">
        <div class="col-md-8 col-sm-12">
            <div class="card card-default">
                <div class="card card-default">
                    <div class="card-header"><h6>Welcome to AvoRed Ecommerce Installation</h6></div>
                    <div class="card-body">

                        <h4 class="">Create Admin Account</h4>

                        <form action="{{ route('avored.install.admin.post') }}" method="post"
                              id="create-admin-user-form">
                            {{ csrf_field() }}
                            <div class="form-group">
                                <label for="first_name">First Name</label>
                                <input type="text" name="first_name"
                                       @if($errors->has('first_name'))
                                       class="is-invalid form-control"
                                       @else
                                       class="form-control"
                                       @endif
                                       id="first_name"/>

                                @if($errors->has('first_name'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('first_name') }}
                                    </div>
                                @endif

                            </div>

                            <div class="form-group">
                                <label for="last_name">Last Name</label>
                                <input type="text" name="last_name"

                                       @if($errors->has('last_name'))
                                       class="is-invalid form-control"
                                       @else
                                       class="form-control"
                                       @endif
                                       id="last_name"/>

                                @if($errors->has('last_name'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('last_name') }}
                                    </div>
                                @endif


                            </div>

                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="text" name="email"
                                       @if($errors->has('email'))
                                       class="is-invalid form-control"
                                       @else
                                       class="form-control"
                                       @endif
                                       id="email"/>

                                @if($errors->has('email'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('email') }}
                                    </div>
                                @endif


                            </div>


                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" name="password"
                                       @if($errors->has('password'))
                                       class="is-invalid form-control"
                                       @else
                                       class="form-control"
                                       @endif
                                       id="password"/>

                                @if($errors->has('password'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('password') }}
                                    </div>
                                @endif

                            </div>

                            <div class="form-group">
                                <label for="password_confirmation">Confirm Password</label>
                                <input type="password" name="password_confirmation"
                                       @if($errors->has('password_confirmation'))
                                       class="is-invalid form-control"
                                       @else
                                       class="form-control"
                                       @endif
                                       id="password_confirmation"/>

                                @if($errors->has('password_confirmation'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('password_confirmation') }}
                                    </div>
                                @endif


                            </div>

                            <input type="hidden" name="language" value="en">
                            <div class="form-group">
                                <button class="btn btn-primary create-user-button" type="button">Continue</button>
                            </div>

                        </form>

                    </div>

                </div>
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
