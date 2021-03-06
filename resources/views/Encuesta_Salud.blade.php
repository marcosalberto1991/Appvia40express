<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Encuesta de salud</title>

        <link href="{{ asset('Architectui/assets/css/main.css') }}" rel="stylesheet">


        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;600&display=swap" rel="stylesheet">


        <!-- Styles -->
        <style>
            html, body {
                background-color: #fff;
                color: #636b6f;
                font-family: 'Nunito', sans-serif;
                font-weight: 200;
                height: 100vh;
                margin: 0;
            }

            .full-height {
                _height: 150px;
            }

            .flex-center {
                _align-items: center;
                _display: flex;
                _justify-content: center;
            }

            .position-ref {
                _position: relative;
            }

            .top-right {
                position: absolute;
                right: 10px;
                top: 18px;
            }

            .content {
                text-align: center;
            }

            .title {
                font-size: 84px;
            }

            .links > a {
                color: #636b6f;
                padding: 0 25px;
                font-size: 13px;
                font-weight: 600;
                letter-spacing: .1rem;
                text-decoration: none;
                text-transform: uppercase;
            }

            .m-b-md {
                margin-bottom: 30px;
            }
        </style>
    </head>
    <body>
        <div class="flex-center position-ref full-height">
            @if (Route::has('login'))
                <div class="top-right links">
                    @auth
                        <a href="{{ url('/home') }}">Home</a>
                    @else
                    <!--
                    <a href="{{ url('Encuesta_Salud') }}">Encuesta de salud </a>

                        <a href="{{ route('login') }}">Login</a>

                        @if (Route::has('register'))
                            <a href="{{ route('register') }}">Register</a>
                        @endif
                        -->
                    @endauth
                </div>
            @endif


        </div>
       <div class="container">

        <div class="col-md-12 text-center">
        <img src="img/logo_encuesta.png" class="img-fluid" >
        </div>
        <div id="app" class="container-fluid">
            <encuesta_salud-vue>
            </encuesta_salud-vue>


        </div>
    </div>
        <script type="text/javascript" src="{{ asset('Architectui/assets/scripts/main.js') }}"></script>
        <script type="text/javascript" src="{{asset('public/js/app.js')}}"></script>
    </body>
</html>
