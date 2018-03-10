@extends('avored-install::layouts.install')

@section('content')
    <div class="container">
        <div class="col-md-8 col-sm-12">
            <div class="card card-default">
                <div class="card-header">Welcome to AvoRed Installation</div>
                <div class="card-body">
                    <h4 class="">Database Data Setup</h4>

                    <form method="post" action="{{ route('avored.db.post') }}">
                        @csrf


                        <div class="form-group">
                            <label for="db_name">Database Name</label>
                            <input type="text" name="db_database" class="form-control" value="{{ old('db_name') }}"/>
                        </div>

                        <div class="form-group">
                            <label for="db_name">Database UserName</label>
                            <input type="text" name="db_username" class="form-control" value="{{ old('db_user') }}"/>
                        </div>

                        <div class="form-group">
                            <label for="db_name">Database Password</label>
                            <input type="password" name="db_password" class="form-control"
                                   value="{{ old('db_password') }}"/>
                        </div>


                        <p>Click Continue to install Database or <strong class=""><i>If you have setup your .env file
                                    then skip this step.</i></strong</p>

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Continue</button>

                            <a href="{{ route('avored.install.database.table.get') }}" class="btn btn-warning">Skip</a>

                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
@endsection