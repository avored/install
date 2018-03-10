@extends('avored-install::layouts.install')

@section('content')
    <div class="container">
        <div class="col-md-8 col-sm-12">
            <div class="card card-default">
                <div class="card-header">
                    Welcome to AvoRed Ecommerce Installation
                </div>
                <div class="card-body">

                    <h2>Extension Requirement</h2>

                    <div class="extension-list">
                        <div class="php-extension">
                            <span>OpenSSL PHP Extension</span>
                            <span class="float-right text-success mr-1">
                                        @if($result['openssl'] == true)
                                    <i class="fas fa-check"></i>
                                @else
                                    <i class="fas fa-ban"></i>
                                @endif
                                    </span>
                        </div>
                        <div class="php-extension">
                            <span>PDO PHP Extension</span>
                            <span class="float-right text-success mr-1">
                                    @if($result['pdo'] == true)
                                    <i class="fas fa-check"></i>
                                @else
                                    <i class="fas fa-ban"></i>
                                @endif
                                </span>
                        </div>

                        <div class="php-extension">
                            <span>GD PHP Extension</span>
                            <span class="float-right text-success mr-1">
                                        @if($result['gd'] == true)
                                    <i class="fas fa-check"></i>
                                @else
                                    <i class="fas fa-ban"></i>
                                @endif
                                    </span>
                        </div>

                        <div class="php-extension">
                            <span>Mbstring PHP Extension</span>
                            <span class="float-right">
                                    @if($result['mbstring'] == true)
                                    <i class="fas fa-check text-success mr-1"></i>
                                @else
                                    <i class="fas fa-ban"></i>
                                @endif
                                </span>
                        </div>

                        <div class="php-extension">
                            <span>Tokenizer PHP Extension</span>
                            <span class="float-right text-success mr-1">
                                    @if($result['tokenizer'] == true)
                                    <i class="fas fa-check"></i>
                                @else
                                    <i class="fas fa-ban"></i>
                                @endif
                                </span>
                        </div>

                        <div class="php-extension">
                            <span>XML PHP Extension</span>
                            <span class="float-right  text-success mr-1">
                                    @if($result['xml'] == true)
                                    <i class="fas fa-check"></i>
                                @else
                                    <i class="fas fa-ban"></i>
                                @endif
                                </span>
                        </div>

                        <div class="php-extension">
                            <span>JSON PHP Extension</span>
                            <span class="float-right text-success mr-1">
                                    @if($result['json'] == true)
                                    <i class="fas fa-check"></i>
                                @else
                                    <i class="fas fa-ban"></i>
                                @endif
                                </span>
                        </div>

                        <div class="php-extension">
                            <span>Curl PHP Extension</span>
                            <span class="float-right text-success mr-1">
                                    @if($result['curl'] == true)
                                    <i class="fas fa-check"></i>
                                @else
                                    <i class="fas fa-ban"></i>
                                @endif
                                </span>
                        </div>


                        <div class="php-extension">
                            <span>Ctype PHP Extension</span>
                            <span class="float-right text-success mr-1 ">
                                        @if($result['ctype'] == true)
                                    <i class="fas fa-check"></i>
                                @else
                                    <i class="fas fa-ban"></i>
                                @endif
                                    </span>
                        </div>

                    </div>

                    <div class="form-group">
                        <button data-url="{{ route('avored.db') }}"
                                class="btn btn-primary continue-button">Continue
                        </button>
                    </div>
                </div>

            </div>
        </div>
    </div>




    @push('styles')
        <script>
            jQuery(document).ready(function () {
                jQuery('.continue-button').click(function (e) {
                    e.preventDefault();
                    jQuery(e.target).button('loading');
                    location = jQuery(this).attr('data-url');
                });

            });
        </script>
    @endpush
    @push('styles')
        <style>
            .extension-list div {
                border: 1px solid #ccc;
                padding: 5px;
                margin-bottom: 10px;
            }
        </style>
    @endpush
@endsection