<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'AvoRed Ecommerce') }}</title>

    <link href="{{ asset('vendor/avored-admin/css/app.css') }}" rel="stylesheet">

    <!-- Scripts -->
    <script>
        window.Laravel = <?php echo json_encode([
            'csrfToken' => csrf_token(),
        ]); ?>

    </script>


    <script src="{{ asset('/vendor/avored-admin/js/app.js') }}"></script>


    <style>

        .container {

            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;

            -ms-flex-align: center;
            -webkit-align-items: center;
            -webkit-box-align: center;
            justify-content: center;;
            align-items: center;
        }

        body {
            background-color: #F44336;
        }


    </style>
    <script>
        jQuery(document).ready(function () {
            jQuery('.container').height(jQuery(document).height())
        })
    </script>
</head>
<body>

    @yield('content')


@stack('scripts')
@stack('styles')
</body>
</html>
