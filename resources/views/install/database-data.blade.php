@extends('avored-install::layouts.install')

@section('content')
    <div class="container">
        <div class="col-md-8 col-sm-12">
            <div class="card card-default">
                <div class="card card-default">
                    <div class="card-header">Welcome to AvoRed Installation</div>
                    <div class="card-body">


                        <h4>Database Data Setup</h4>

                        <form method="post" action="{{ route('avored.install.database.data.post') }}">
                            {{ csrf_field() }}

                            <input type="hidden" name="identifier" value="avored-install"/>

                            <div class="form-group">
                                <label for="install_data">Install Dummy Data</label>

                                <select name="install_data" id="install_data" class="form-control">
                                    <option value="no">No</option>
                                    <option value="yes">Yes</option>

                                </select>
                            </div>


                            <p>Click Continue to install Database</p>

                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">Continue</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>

@endsection