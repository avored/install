@extends('mage2-install::layouts.install')
@section('content')

    <div class="col-md-6">
        <div class="card card-default">
            <div class="card-header">Welcome to Mage2 Installation</div>
            <div class="card-body">

                <h2 class="text-center">Database Table Setup</h2>

                <form id="install-module-form" method="post" action="{{ route('mage2.install.database.table.post') }}">

                    {{ csrf_field() }}

                <p>Click Continue to install Database</p>

                    <div class="form-group">
                        <label for="selected_db_option">
                            Please Select one Option
                        </label>
                        <select id="selected_db_option" required name="selected_db_option" class="form-control">
                            <option >Please Select</option>
                            <option value="1">Install Database</option>
                            <option value="2">Skip and Download Tables Only</option>
                            <option value="3">Skip and Download Tables & Seed Sample Data too</option>
                        </select>

                    </div>
                <div class="form-group">
                    <button type="button" class="btn btn-primary install-new-button">Save</button>

                    <a href="{{ route('mage2.install.database.data.get') }}" class="skip-sample-data-button btn btn-warning ml-2 d-none">Skip</a>
                    <a href="{{ route('mage2.install.admin') }}" class="skip-sample-admin-user btn btn-warning ml-2 d-none">Skip</a>
                </div>

                </form>

            </div>
        </div>
    </div>
    @push('scripts')
    <script>

        jQuery(document).ready(function () {

            jQuery('.install-new-button').click(function (e) {

                //#install-module-form

                val = jQuery('#selected_db_option').val();
                if(val == 2)  {
                    jQuery('.skip-sample-data-button').removeClass('d-none');
                }

                if(val ==3) {
                    jQuery('.skip-sample-admin-user').removeClass('d-none');
                }

                jQuery(this).button('loading');
                jQuery('#install-module-form').submit();
            });

        });
    </script>
    @endpush


    @endsection