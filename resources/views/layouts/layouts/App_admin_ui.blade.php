<!doctype html>
<html lang="es">

    @if(Auth::check())
    <?php  $fondo_vertical=auth()->user()->color_app_vertical; ?>
    <?php  $fondo_horizontal=auth()->user()->color_app_horizontal; ?>
    
    @else
    <?php $fondo_vertical='sidebar-text-dark'; ?>
    <?php $fondo_horizontal='header-text-dark'; ?>
    @endif
   
<head>
    <meta charset="utf-8">
    <meta http-equiv='cache-control' content='no-cache'>
    <meta http-equiv='expires' content='0'>
    <meta http-equiv='pragma' content='no-cache'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>EDYCONST S.A.S</title>
    <link rel="canonical" href="https://www.edyconst.com.co">
    <link rel="shortcut icon" href="{{asset('imagenes/logo.png')}}" />

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
    <meta name="description" content="Tables are the backbone of almost all web applications.">
    <meta name="msapplication-tap-highlight" content="no">
    <!--
    <link href="{{asset('css/app.css')}}" rel="stylesheet">
    -->
    <!--
    =========================================================
    * ArchitectUI HTML Theme Dashboard - v1.0.0
    =========================================================
    * Product Page: https://dashboardpack.com
    * Copyright 2019 DashboardPack (https://dashboardpack.com)
    * Licensed under MIT (https://github.com/DashboardPack/architectui-html-theme-free/blob/master/LICENSE)
    =========================================================
    * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
    -->
    <link href="{{ asset('Architectui/assets/css/main.css') }}" rel="stylesheet">
    <link href="{{ asset('Edyconst/style.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="//unpkg.com/focus-overlay@latest/dist/focusoverlay.css" media="prefers-reduced-motion: no-preference"/>
    <style>
    .margin-right-5{
        margin-right: 10px;
    }
    .searchbar {
    margin-bottom: auto;
    margin-top: auto;
    height: 30px;
    background-color: #353b48;
    border-radius: 30px;
    border-radius: 7px;
    padding: 5px;
}
    .search_input{
    color: white;
    border: 0;
    outline: 0;
    background: none;
    width: 0;
    caret-color:transparent;
    line-height: 20px;
    transition: width 0.4s linear;
    }
    .searchbar:hover > .search_input{
    padding: 0 10px;
    width: 200px;
    caret-color:red;
    transition: width 0.4s linear;
    }
    .searchbar:hover > .search_icon{
    background: white;
    color: #e74c3c;
    }
    .search_icon {
    height: 20px;
    width: 20px;
    float: right;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    color: white;
    text-decoration: none;
    }
    .container { max-width: 1500px }
    .compact > tbody > tr > th:first-child:before {
        top: 5px;
        left: 4px;
        height: 14px;
        width: 14px;
        border-radius: 14px;
        line-height: 12px;
    }
   
    </style>
    <!--
    <link rel="stylesheet" href="select2-bootstrap4-theme/dist/select2.css" />
    
    <link rel="stylesheet" href="select2-bootstrap4-theme/dist/select2-bootstrap4.min.css" />
    -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
</head>

<style type="text/css">
    .btn-group-xs > .btn, .btn-xs {
      padding: .25rem .4rem;
      font-size: .875rem;
      line-height: .5;
      border-radius: .2rem;
    }
    .icono{
        margin-bottom: 15px;
    }
    .margin-bottom-0{
        margin-bottom: 0px;
    }
    .modal-body {
    background-color: #ff9b4b;
    }
    .modal-footer{
        background-color: #ff9b4b!important;
    }
    .modal-header{
        background-color: #ff9b4b!important;
    }
    .alert-danger {
        color: #dc3545 !important;
        padding-bottom: 0px!important;
        padding-top: 0px!important;

    }
    .numero_cedula {
    font-size: 120%!important;
    font-weight: 400;
    color: #000!important;
    color: #000000 !important;
    }
    .badge-gris {
        color: #000;
        _background-color: #d0d0d0;
        padding-left: 0px!important;
        white-space: nowrap;

    }
    .b-table tbody tr td {
        white-space: nowrap__;
    }
    .table_linea {
        white-space: nowrap;
    }
    .one-linea {
        white-space: nowrap;
    }
    .b-table thead  {
        white-space: nowrap;
    }
    .color-black{
        color:#000000;
    }
    .custom-file-label{
        color:#000000!important;
    }
    .card-body> h4{
        color:#000000!important;
    }
    .card-body> h1{
        color:#000000!important;
    }
    .reducir_texto {
        display: block; /* Fallback for non-webkit */
        display: -webkit-box;
        max-width: 500px;
        _height: 1.4*4*16; /* Fallback for non-webkit (line-height*number-lines*size )*/
        _margin: 0 auto;
        font-size: 16px;
        _line-height: 1.4;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
        _text-overflow: ellipsis;
    }
    

  
    
</style>
<script>
  @auth
    window.Permissions = {!! json_encode(Auth::user()->allPermissions, true) !!};
  @else
    window.Permissions = [];
  @endauth
</script>
<body>
    <div  id="app" class="content app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header closed-sidebar  ">
<!--
        <div id="app" class="content app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header ">
        -->

        <div class="app-header header-shadow bg-info <?php echo $fondo_horizontal ?>">
            <div class="app-header__logo">
                <div class="logo-src"></div>
                <div class="header__pane ml-auto">
                    <div>
                        <button type="button" id="hamburger-close" class="hamburger close-sidebar-btn hamburger--elastic" data-class="closed-sidebar">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="app-header__mobile-menu">
                <div>
                    <button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
                        <span class="hamburger-box">
                            <span class="hamburger-inner"></span>
                        </span>
                    </button>
                </div>
            </div>
            <div class="app-header__menu">
                <span>
                    <button type="button" class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
                        <span class="btn-icon-wrapper">
                            <i class="fa fa-ellipsis-v fa-w-6"></i>
                        </span>
                    </button>
                </span>
            </div>    <div class="app-header__content">
                <div class="app-header-left">
                    <div class="search-wrapper">
                        <div class="input-holder">
                            <select class="search-input" name="" id="">
                                <option data-tokens="ketchup mustard"><a href="Tercero">Tercero</a></option>
                                <option data-tokens="ketchup mustard"><a href="Tercero">Propuesta</a></option>
                                <option data-tokens="ketchup mustard"><a href="Tercero">Productos</a></option>
                                <option data-tokens="ketchup mustard"><a href="Tercero">Categoria</a></option>

                            </select>
                            <!--
                            <input type="text" class="search-input" placeholder="Buscador">
                            -->
                            <button class="search-icon"><span></span></button>
                        </div>
                        <button class="close"></button>
                    </div>

                    <ul class="header-menu nav">
                        <vue-menu_panel_vertical></vue-menu_panel_vertical>
                        <li class="nav-item">
                            <a href="{{ action('IndexController@index') }}" class="nav-link">
                                <i class="nav-link-icon fa fa-database"> </i>
                                Inicio
                            </a>
                        </li>
                        
                       
                        <!--
                        @can('ver terceros')
                        <router-link :to="{ name: 'Orden_Servicio_Menu'}">
                        <li class="nav-item">
                            <a href="{{ action('Orden_Servicio_MenuController@index') }}" class="nav-link">
                                <i class="nav-link-icon fa fa-edit"></i>
                                Orden Servicio
                            </a>
                        </li>
                        </router-link>
                        @endcan
                        @can('ver terceros')
                        <router-link :to="{ name: 'Cliente'}">
                            
                        <li class="btn-group nav-item">
                            <a href="{{ action('ClienteController@index') }}" class="nav-link">
                                <i class="nav-link-icon fa fa-edit"></i>
                                Terceros 
                            </a>
                        </li>
                         </router-link>
                        @endcan
                        -->
                        @if (Route::has('login'))
                        @if (Auth::check())
                        <!--
                        <li class="dropdown nav-item">
                            <a href="javascript:void(0);" class="nav-link">
                                <i class="nav-link-icon fa fa-cog"></i>
                                configuración 
                            </a>
                        </li>
                    -->

                            <li class="dropdown nav-item">

                            <a href="{{ route('logout') }}" class="nav-link " 
                            onclick="event.preventDefault();
                            document.getElementById('logout-form').submit();">
                            <i class="nav-link-icon fa fa-cog"></i>
                            <b >{{ trans('welcome.salir') }}</b></a>
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                              {{ csrf_field() }}
                            </form>
                        </li>
                        @endif
                        @endif
                       
                    </ul>        </div>
                <div class="app-header-right">
                    <div class="header-btn-lg pr-0">
                        <div class="widget-content p-0">
                            <div class="widget-content-wrapper">
                                <div class="widget-content-left">
                                @if (Route::has('login'))
                                        @if (Auth::check())
                                    <div class="btn-group">
                                        <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="p-0 btn">
                                       
                                        <?php $foto=auth()->user()->avatar;?>

                                            <img width="42" class="rounded-circle" src='{{ asset("perfil_usuario/$foto")}}' alt="">
                                            <i class="fa fa-angle-down ml-2 opacity-8"></i>
                                       
                                        </a>
                                        <div tabindex="-1" role="menu" aria-hidden="true" class="dropdown-menu dropdown-menu-right">
                                            <button type="button" tabindex="0" class="dropdown-item">User Account</button>
                                            <button type="button" tabindex="0" class="dropdown-item">Settings</button>
                                            <h6 tabindex="-1" class="dropdown-header">Header</h6>
                                            <button type="button" tabindex="0" class="dropdown-item">Actions</button>
                                            <div tabindex="-1" class="dropdown-divider"></div>
                                            <button type="button" tabindex="0" class="dropdown-item">Dividers</button>
                                        </div>
                                    </div>
                                    @endif
                                    @endif
                                </div>
                                <div class="widget-content-left  ml-3 header-user-info">
                                    @if (Route::has('login'))
                                        @if (Auth::check())
                                            <div class="widget-heading">
                                            
                                            {{auth()->user()->primer_nombre}}
                                            </div>
                                            <div class="widget-subheading">
                                            {{ auth()->user()->primer_nombre}}
                                            </div>
                                        @endif
                                    @endif

                                </div>
                                <!--
                                <div class="widget-content-right header-user-info ml-3">
                                    <button type="button" class="btn-shadow p-1 btn btn-primary btn-sm show-toastr-example">
                                        <i class="fa text-white fa-calendar pr-1 pl-1"></i>
                                    </button>
                                </div>
                            -->
                            </div>
                        </div>
                    </div>        </div>
            </div>
        </div>        <div class="ui-theme-settings">
            <button type="button" id="TooltipDemo" class="btn-open-options btn btn-warning">
                <i class="fa fa-cog fa-w-16 fa-spin fa-2x"></i>
            </button>
            <div class="theme-settings__inner">
                <div class="scrollbar-container">
                    <div class="theme-settings__options-wrapper">
                        <h3 class="themeoptions-heading">Layout Options
                        </h3>
                        <div class="p-3">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <div class="widget-content p-0">
                                        <div class="widget-content-wrapper">
                                            <div class="widget-content-left mr-3">
                                                <div class="switch has-switch switch-container-class" data-class="fixed-header">
                                                    <div class="switch-animate switch-on">
                                                        <input type="checkbox" checked data-toggle="toggle" data-onstyle="success">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="widget-content-left">
                                                <div class="widget-heading">Fixed Header
                                                </div>
                                                <div class="widget-subheading">Makes the header top fixed, always visible!
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="widget-content p-0">
                                        <div class="widget-content-wrapper">
                                            <div class="widget-content-left mr-3">
                                                <div class="switch has-switch switch-container-class" data-class="fixed-sidebar">
                                                    <div class="switch-animate switch-on">
                                                        <input type="checkbox" checked data-toggle="toggle" data-onstyle="success">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="widget-content-left">
                                                <div class="widget-heading">Fixed Sidebar
                                                </div>
                                                <div class="widget-subheading">Makes the sidebar left fixed, always visible!
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="widget-content p-0">
                                        <div class="widget-content-wrapper">
                                            <div class="widget-content-left mr-3">
                                                <div class="switch has-switch switch-container-class" data-class="fixed-footer">
                                                    <div class="switch-animate switch-off">
                                                        <input type="checkbox" data-toggle="toggle" data-onstyle="success">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="widget-content-left">
                                                <div class="widget-heading">Fixed Footer
                                                </div>
                                                <div class="widget-subheading">Makes the app footer bottom fixed, always visible!
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <h3 class="themeoptions-heading">
                            <div>
                                Header Options
                            </div>
                            <button type="button" class="btn-pill btn-shadow btn-wide ml-auto btn btn-focus btn-sm switch-header-cs-class" data-class="">
                                Restore Default
                            </button>
                        </h3>
                        <div class="p-3">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <h5 class="pb-2">Choose Color Scheme
                                    </h5>
                                    <div class="theme-settings-swatches">
                                        <div class="swatch-holder bg-primary switch-header-cs-class" data-theme="h" data-class="bg-primary header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-secondary switch-header-cs-class" data-theme="h" data-class="bg-secondary header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-success switch-header-cs-class" data-theme="h" data-class="bg-success header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-info switch-header-cs-class" data-theme="h" data-class="bg-info header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-warning switch-header-cs-class" data-theme="h" data-class="bg-warning header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-danger switch-header-cs-class" data-theme="h" data-class="bg-danger header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-light switch-header-cs-class" data-theme="h" data-class="bg-light header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-dark switch-header-cs-class" data-theme="h" data-class="bg-dark header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-focus switch-header-cs-class" data-theme="h" data-class="bg-focus header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-alternate switch-header-cs-class" data-theme="h" data-class="bg-alternate header-text-light">
                                        </div>
                                        <div class="divider">
                                        </div>
                                        <div class="swatch-holder bg-vicious-stance switch-header-cs-class" data-theme="h" data-class="bg-vicious-stance header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-midnight-bloom switch-header-cs-class" data-theme="h" data-class="bg-midnight-bloom header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-night-sky switch-header-cs-class" data-theme="h" data-class="bg-night-sky header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-slick-carbon switch-header-cs-class" data-theme="h" data-class="bg-slick-carbon header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-asteroid switch-header-cs-class" data-theme="h" data-class="bg-asteroid header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-royal switch-header-cs-class" data-theme="h" data-class="bg-royal header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-warm-flame switch-header-cs-class" data-theme="h" data-class="bg-warm-flame header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-night-fade switch-header-cs-class" data-theme="h" data-class="bg-night-fade header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-sunny-morning switch-header-cs-class" data-theme="h" data-class="bg-sunny-morning header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-tempting-azure switch-header-cs-class" data-theme="h" data-class="bg-tempting-azure header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-amy-crisp switch-header-cs-class" data-theme="h" data-class="bg-amy-crisp header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-heavy-rain switch-header-cs-class" data-theme="h" data-class="bg-heavy-rain header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-mean-fruit switch-header-cs-class" data-theme="h" data-class="bg-mean-fruit header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-malibu-beach switch-header-cs-class" data-theme="h" data-class="bg-malibu-beach header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-deep-blue switch-header-cs-class" data-theme="h" data-class="bg-deep-blue header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-ripe-malin switch-header-cs-class" data-theme="h" data-class="bg-ripe-malin header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-arielle-smile switch-header-cs-class" data-theme="h" data-class="bg-arielle-smile header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-plum-plate switch-header-cs-class" data-theme="h" data-class="bg-plum-plate header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-happy-fisher switch-header-cs-class" data-theme="h" data-class="bg-happy-fisher header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-happy-itmeo switch-header-cs-class" data-theme="h" data-class="bg-happy-itmeo header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-mixed-hopes switch-header-cs-class" data-theme="h" data-class="bg-mixed-hopes header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-strong-bliss switch-header-cs-class" data-theme="h" data-class="bg-strong-bliss header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-grow-early switch-header-cs-class" data-theme="h" data-class="bg-grow-early header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-love-kiss switch-header-cs-class" data-theme="h" data-class="bg-love-kiss header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-premium-dark switch-header-cs-class" data-theme="h" data-class="bg-premium-dark header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-happy-green switch-header-cs-class" data-theme="h" data-class="bg-happy-green header-text-light">
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <h3 class="themeoptions-heading">
                            <div>Sidebar Options</div>
                            <button type="button" class="btn-pill btn-shadow btn-wide ml-auto btn btn-focus btn-sm switch-sidebar-cs-class" data-class="">
                                Restore Default
                            </button>
                        </h3>
                        <div class="p-3">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <h5 class="pb-2">Choose Color Scheme
                                    </h5>
                                    <div class="theme-settings-swatches" id='color_menu_vertical' >
                                        <div class="swatch-holder bg-primary switch-sidebar-cs-class" data-theme="v" data-class="bg-primary sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-secondary switch-sidebar-cs-class" data-theme="v" data-class="bg-secondary sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-success switch-sidebar-cs-class" data-theme="v" data-class="bg-success sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-info switch-sidebar-cs-class" data-theme="v" data-class="bg-info sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-warning switch-sidebar-cs-class" data-theme="v" data-class="bg-warning sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-danger switch-sidebar-cs-class" data-theme="v" data-class="bg-danger sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-light switch-sidebar-cs-class" data-theme="v" data-class="bg-light sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-dark switch-sidebar-cs-class" data-theme="v" data-class="bg-dark sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-focus switch-sidebar-cs-class" data-theme="v" data-class="bg-focus sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-alternate switch-sidebar-cs-class" data-theme="v" data-class="bg-alternate sidebar-text-light">
                                        </div>
                                        <div class="divider">
                                        </div>
                                        <div class="swatch-holder bg-vicious-stance switch-sidebar-cs-class" data-theme="v" data-class="bg-vicious-stance sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-midnight-bloom switch-sidebar-cs-class" data-theme="v" data-class="bg-midnight-bloom sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-night-sky switch-sidebar-cs-class" data-theme="v" data-class="bg-night-sky sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-slick-carbon switch-sidebar-cs-class" data-theme="v" data-class="bg-slick-carbon sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-asteroid switch-sidebar-cs-class" data-theme="v" data-class="bg-asteroid sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-royal switch-sidebar-cs-class" data-theme="v" data-class="bg-royal sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-warm-flame switch-sidebar-cs-class" data-theme="v" data-class="bg-warm-flame sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-night-fade switch-sidebar-cs-class" data-theme="v" data-class="bg-night-fade sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-sunny-morning switch-sidebar-cs-class" data-theme="v" data-class="bg-sunny-morning sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-tempting-azure switch-sidebar-cs-class" data-theme="v" data-class="bg-tempting-azure sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-amy-crisp switch-sidebar-cs-class" data-theme="v" data-class="bg-amy-crisp sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-heavy-rain switch-sidebar-cs-class" data-theme="v" data-class="bg-heavy-rain sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-mean-fruit switch-sidebar-cs-class" data-theme="v" data-class="bg-mean-fruit sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-malibu-beach switch-sidebar-cs-class" data-theme="v" data-class="bg-malibu-beach sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-deep-blue switch-sidebar-cs-class" data-theme="v" data-class="bg-deep-blue sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-ripe-malin switch-sidebar-cs-class" data-theme="v" data-class="bg-ripe-malin sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-arielle-smile switch-sidebar-cs-class" data-theme="v" data-class="bg-arielle-smile sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-plum-plate switch-sidebar-cs-class" data-theme="v" data-class="bg-plum-plate sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-happy-fisher switch-sidebar-cs-class" data-theme="v" data-class="bg-happy-fisher sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-happy-itmeo switch-sidebar-cs-class" data-theme="v" data-class="bg-happy-itmeo sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-mixed-hopes switch-sidebar-cs-class" data-theme="v" data-class="bg-mixed-hopes sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-strong-bliss switch-sidebar-cs-class" data-theme="v" data-class="bg-strong-bliss sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-grow-early switch-sidebar-cs-class" data-theme="v" data-class="bg-grow-early sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-love-kiss switch-sidebar-cs-class" data-theme="v" data-class="bg-love-kiss sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-premium-dark switch-sidebar-cs-class" data-theme="v" data-class="bg-premium-dark sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-happy-green switch-sidebar-cs-class" data-theme="v" data-class="bg-happy-green sidebar-text-light">
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <h3 class="themeoptions-heading">
                            <div>Main Content Options</div>
                            <button type="button" class="btn-pill btn-shadow btn-wide ml-auto active btn btn-focus btn-sm">Restore Default
                            </button>
                        </h3>
                        <div class="p-3">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <h5 class="pb-2">Page Section Tabs
                                    </h5>
                                    <div class="theme-settings-swatches">
                                        <div role="group" class="mt-2 btn-group">
                                            <button type="button" class="btn-wide btn-shadow btn-primary btn btn-secondary switch-theme-class" data-class="body-tabs-line">
                                                Line
                                            </button>
                                            <button type="button" class="btn-wide btn-shadow btn-primary active btn btn-secondary switch-theme-class" data-class="body-tabs-shadow">
                                                Shadow
                                            </button>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
        <div class="app-main">
                <div class="app-sidebar sidebar-shadow sidebar-shadow bg-info <?php echo $fondo_vertical; ?>">
                    <div class="app-header__logo">
                        <div class="logo-src"></div>
                        <div class="header__pane ml-auto">
                            <div>
                                <button type="button" class="hamburger close-sidebar-btn hamburger--elastic" data-class="closed-sidebar">
                                    <span class="hamburger-box">
                                        <span class="hamburger-inner"></span>
                                    </span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="app-header__mobile-menu">
                        <div>
                            <button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
                                <span class="hamburger-box">
                                    <span class="hamburger-inner"></span>
                                </span>
                            </button>
                        </div>
                    </div>
                    <div class="app-header__menu">
                        <span>
                            <button type="button" class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
                                <span class="btn-icon-wrapper">
                                    <i class="fa fa-ellipsis-v fa-w-6"></i>
                                </span>
                            </button>
                        </span>
                    </div>    <div class="scrollbar-sidebar">
                        <div class="app-sidebar__inner">
                            
                            
                            
                            
                            
                            <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Buscar">
                            <!--
                            <ul id="myUL">
                                <li><a href="#">Adele</a></li>
                                <li><a href="#">Agnes</a></li>
                              
                                <li><a href="#">Billy</a></li>
                                <li><a href="#">Bob</a></li>
                              
                                <li><a href="#">Calvin</a></li>
                                <li><a href="#">Christina</a></li>
                                <li><a href="#">Cindy</a></li>
                              </ul>
                            -->
                            <!--
                            <ul  class="vertical-nav-menu">
                                <li class="app-sidebar__heading">Panel</li>
                                
                                <li>  
                                    <a href="{{ action('Panel_PrincipalController@index') }}">
                                        <i class="metismenu-icon pe-7s-rocket"></i>
                                        Panel Principal
                                    </a>
                                </li>
                        
                                @can('ver terceros')
                                <li>
                                    <a href="{{ action('ClienteController@index') }}">
                                        <i class="metismenu-icon pe-7s-add-user"></i>
                                        Terceros
                                    </a>
                                </li>
                                @endcan
                              
                                
                                @can('ver Orden Servicio')
                                <li>
                                    <a href="{{ action('Orden_Servicio_MenuController@index') }}"><i class="metismenu-icon pe-7s-notebook"></i>
                                        Orden Servicio
                                    </a>
                                </li>
                                @endcan
                            </ul>
                        -->



                            <ul id="myUL"  class="vertical-nav-menu">
                                <li class="app-sidebar__heading">Panel Principal</li>
                                
                                <li>  
                                    <a href="{{ action('Panel_PrincipalController@index') }}">
                                        <i class="metismenu-icon pe-7s-rocket"></i>
                                        Panel Principal
                                    </a>
                                </li>
                        
                                @can('ver terceros')
                                
                                <router-link :to="{ name: 'Cliente'}">
                                <li>
                                    <a href="{{ action('ClienteController@index') }}">
                                        <i class="metismenu-icon pe-7s-add-user"></i>
                                        Terceros
                                    </a>
                                </li>
                                </router-link>
                                <!--
                                <router-link to="Foo">
                                    <li>
                                        <a href="{{ action('ClienteController@index') }}">
                                            <i class="metismenu-icon pe-7s-add-user"></i>
                                            Foo
                                        </a>
                                    </li>
                                    </router-link>
                                -->
                                @endcan
                              
                                
                                @can('ver Orden Servicio')
                                <router-link :to="{ name: 'Orden_Servicio_Menu'}">
                                <li>
                                    <a href="{{ action('Orden_Servicio_MenuController@index') }}"><i class="metismenu-icon pe-7s-notebook"></i>
                                        Orden Servicio
                                    </a>
                                </li>
                                </router-link>
                                

                                @endcan
                                @can('Ensayo_por_Ejecutar ver_menu')
                                <router-link :to="{ name: 'Ensayo_por_Ejecutar'}">

                                <li>
                                    <a href="{{ action('Ensayo_por_EjecutarController@index') }}"><i class="metismenu-icon pe-7s-notebook"></i>
                                        Ensayo por Ejecutar
                                    </a>
                                </li>
                                </router-link>
                                @endcan
                                @can('Ver Cartera')
                                <li>
                                    <a href="{{ action('CarteraController@index') }}">
                                        <i class="metismenu-icon pe-7s-mail-open"></i>
                                        Cartera
                                    </a>
                                </li>
                                @endcan
                                @can('ver proyecto')
                                <router-link :to="{ name: 'Proyecto'}">
                                <li>
                                    <a href="{{ action('ProyectoController@index') }}"><i class="metismenu-icon pe-7s-map"></i>
                                        Lista de Proyecto
                                    </a>
                                </li>
                                </router-link>
                                @endcan
                                @can('no ver Informen')
                                
                                @else
                                <router-link :to="{ name: 'Informe_Archivo'}">
                                    <li>
                                        <a href="{{ action('Informe_ArchivoController@index') }}">
                                            <i class="metismenu-icon pe-7s-copy-file"></i>
                                            Informe
                                        </a>
                                    </li>
                                    </router-link>
                                @endcan

                                @if(Auth()->user()->is_asignacion_proyecto==1)
                                <li>
                                        <a href="{{ action('Asignacion_CuentaController@index') }}">
                                            <i class="metismenu-icon pe-7s-user"></i>
                                            Asignacion de Cuenta
                                        </a>
                                </li>
                                @endif

                                @can('ver Asignacion_Cuenta')
                                <router-link :to="{ name: 'Asignacion_Cuenta'}">
                                <li>
                                        <a href="{{ action('Asignacion_CuentaController@index') }}">
                                            <i class="metismenu-icon pe-7s-user"></i>
                                            Asignacion de Cuenta
                                        </a>
                                </li> 
                                </router-link>
                                @endcan
                                @can('ver proyecto')
                                <router-link :to="{ name: 'Asignacion_Proyecto_Usuario'}">
                                <li>
                                    <a href="{{ action('Asignacion_Proyecto_UsuarioController@index') }}">
                                        <i class="metismenu-icon pe-7s-display2"></i>
                                        Lista de Solicitante

                                    </a>
                                </li>
                                </router-link>
                                @endcan
                                @can('ver Cartera_Sam')
                                <router-link :to="{ name: 'Cartera_Sam'}">
                                <li>
                                    <a href="{{ action('Cartera_SamController@index') }}">
                                        <i class="metismenu-icon pe-7s-display2"></i>
                                        Cartera

                                    </a>
                                </li>
                                </router-link>
                                <router-link :to="{ name: 'Recibo_de_Caja'}">
                                <li>
                                    <a href="{{ action('Recibo_de_CajaController@index') }}">
                                        <i class="metismenu-icon pe-7s-display2"></i>
                                        Recibo de Caja

                                    </a>
                                </li>
                                </router-link>
                                
                                @endcan
                                
                               
                                @if(Auth()->user()->is_asignacion_proyecto!=1 && Auth()->user()->is_cuenta!=1 )

                                @can('ver submenu lista precio')
                                <li class="app-sidebar__heading">Lista de Servicio</li>
                                @endif
                                 
                                @can('ver submenu lista precio')
                                <li class="">
                                    <a title="Otros servicios " href="#" aria-expanded="false">
                                        <i  class="metismenu-icon pe-7s-car"></i>
                                        Lista de Precio
                                        <span style="visibility: hidden">Producto Alquiler Transporte Categoria de Producto Lista de Kit</span>
                                        <i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                                    </a>
                                    <style>
                                        .menu-route {
                                            _color: #6c757d;
                                            _height: 2rem;
                                            _line-height: 2rem;
                                            _padding: 0 1.5rem 0
                                        }
                                    </style>
                                    <ul class="mm-collapse" style="height: 7.04px;">
                                       
                                        
                                        
                                        @can('ver productos')
                                        
                                        <li class="menu-route">
                                            <router-link :to="{ name: 'Producto'}">
                                            <a href="{{ action('ProductoController@index') }}">
                                                
                                                <i class="metismenu-icon"><span style="visibility: hidden">Lista de Precio</span>
                                                </i>Producto 
                                                
                                            </a>
                                            </router-link>
                                        </li>
                                        

                                        @endcan
                                        @can('ver alquiler')
                                        <li>
                                            <a href="{{ action('AlquilerController@index') }}">
                                                <i class="metismenu-icon"><span style="visibility: hidden">Lista de Precio</span>
                                                </i>Alquiler
                                            </a>
                                        </li>
                                        @endcan

                                        @can('ver transporte')
                                        <li>
                                            <a href="{{ action('TransporteController@index') }}">
                                                <i class="metismenu-icon"></i>Transporte<span style="visibility: hidden">Lista de Precio</span>
                                            </a>
                                        </li>
                                        @endcan
                                        @can('ver categoria de producto')
                                        <li>
                                            <a href="{{ action('CategoriaController@index') }}">
                                                <i class="metismenu-icon"></i>Categoria de Producto <span style="visibility: hidden">Lista de Precio</span>
                                            </a>
                                        </li>
                                        @endcan
                                        
                                        @can('ver productos')
                                        <li>
                                            <a href="{{ action('Lista_KitController@index') }}">
                                                <i class="metismenu-icon"></i>Lista de Kit<span style="visibility: hidden">Lista de Precio</span>
                                            </a>
                                        </li>
                                        @endcan
                                       
                                        
                                    </ul>
                                </li>
                                <li class="">
                                    <a href="#" aria-expanded="false">
                                        <i class="metismenu-icon pe-7s-car"></i>
                                        Otros servicios
                                        <span style="visibility: hidden">Categoria de Otros servicios Otros servicios Tipo de Archivo</span>
                                        <i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                                    </a>
                                    <ul class="mm-collapse" style="height: 7.04px;">
                                       
                                        
                                        
                                     
                                      

                                       
                                        @can('Ver Otro_Servicion')
                                        <li>
                                            <a href="{{ action('Categoria_Otro_ServicionController@index') }}">
                                                <i class="metismenu-icon"></i>Categoria de Otros servicios<span style="visibility: hidden">Otros servicios</span>
                                            </a>
                                        </li>
                                        @endcan
                                        @can('Ver Otro_Servicion')
                                        <li>
                                            <a href="{{ action('Otro_ServicionController@index') }}">
                                                <i class="metismenu-icon"></i>Otros servicios<span style="visibility: hidden">Otros servicios</span>
                                            </a>
                                        </li>

                                        @endcan
                                        @can('Tipo_de_Informe ver')
                                        <li>
                                            <a href="{{ action('Tipo_de_InformeController@index') }}">
                                                <i class="metismenu-icon"></i>Tipo de Archivo<span style="visibility: hidden">Otros servicios</span>
                                            </a>
                                        </li>
                                        @endcan
                                       
                                        
                                    </ul>
                                </li>
                                
                                @endif
                                @endif
                                
                                @can('ver Entrada_y_Salida_Equipo')
                                <router-link :to="{ name: 'Entrada_y_Salida_Equipo'}">
                                <li>
                                    <a href="{{ action('Entrada_y_Salida_EquipoController@index') }}"><i class="metismenu-icon pe-7s-browser"></i>
                                        Entrada y Salidad
                                    </a>
                                </li>
                                </router-link>
                                @endcan
                                @can('ver Calendario')
                                <li>
                                    <a href="{{ action('CalendarioController@index') }}"><i class="metismenu-icon pe-7s-calculator"></i>
                                        Calendario
                                    </a>
                                </li>
                                @endcan
 
                                
                                @can('ver propuesta')

                                <router-link :to="{ name: 'Propuesta_Seguimiento'}">
                                <li>
                                    <a href="{{ action('Propuesta_SeguimientoController@index') }}"><i class="metismenu-icon pe-7s-portfolio"></i>
                                        Propuesta
                                    </a>
                                </li>
                                </router-link>
                                @endcan
                                @can('ver Propuesta_Formato')
                                <router-link :to="{ name: 'Propuesta_Formato'}">
                                <li>
                                    <a href="{{ action('Propuesta_FormatoController@index') }}"><i class="metismenu-icon pe-7s-portfolio"></i>
                                        Formato Propuesta
                                    </a>
                                </li>
                                </router-link>
                                @endcan
                                
                                @can('ver Quejas_Reclamos')
                                <li>
                                    <a href="{{ action('Quejas_ReclamosController@index') }}"><i class="metismenu-icon pe-7s-headphones"></i>
                                        Quejas y Reclamos
                                    </a>
                                </li>
                                @endcan
                                @can('ver Tipo_de_Informe')
                                <li>
                                    <a href="{{ action('Tipo_de_InformeController@index') }}"><i class="metismenu-icon pe-7s-paperclip"></i>
                                        Tipo de Informe
                                    </a>
                                </li>
                                @endcan

                                
                                
                                

                                @can('ver correo registrado')
                                <li>
                                    <a href="{{ action('Correo_SuscritoController@index') }}">
                                        <i class="metismenu-icon pe-7s-mail-open"></i>
                                        Correo Registrado
                                    </a>
                                </li>

                                @endcan
		  
                                
                                @can('Ver Nombre_Empresar')
                                <li>
                                    <a href="{{ action('Nombre_EmpresarController@index') }}">
                                        <i class="metismenu-icon pe-7s-mail-open"></i>
                                        Empresar Cartera
                                    </a>
                                </li>
                                @endcan


                                <!--
                                <li>
                                    <a href="{{ action('ProductosController@index') }}">
                                        <i class="metismenu-icon pe-7s-rocket"></i>
                                        Productos
                                    </a>
                                </li>
                                <li>
                                        <a href="{{ action('VentaController@index') }}">
                                            <i class="metismenu-icon pe-7s-rocket"></i>
                                            Venta
                                        </a>
                                    </li>
                                
                                
                                <li>
                                    <a href="{{ action('FacturaController@index') }}">
                                        <i class="metismenu-icon pe-7s-rocket"></i>
                                        Factura y entrada
                                    </a>
                                </li>
                                <li>
                                    <a href="{{ action('IndexController@Inventario') }}">
                                        <i class="metismenu-icon pe-7s-rocket"></i>
                                        Inventario
                                    </a>
                                </li>
                                -->
                                <!--
                                <li>
                                    <a href="{{ action('ProveedorController@index') }}">
                                        <i class="metismenu-icon pe-7s-rocket"></i>
                                        Proveedor
                                    </a>
                                </li>
                            -->
                                @hasrole('Super Administrador')
                                <li>
                                    <a href="log-viewer">
                                        <i class="metismenu-icon pe-7s-rocket"></i>
                                        LOG
                                    </a>
                                </li>
                                <li>
                                    <a href="{{ action('Auditoria_SAMController@index') }}">
                                        <i class="metismenu-icon pe-7s-rocket"></i>
                                        Auditoria
                                    </a>
                                </li>
                                <li>
                                    <a href="{{ action('BackupController@index') }}">
                                        <i class="metismenu-icon pe-7s-rocket"></i>
                                        Backup
                                    </a>
                                </li>
                                <li>
                                    <a href="{{ action('PermissionController@index') }}">
                                        <i class="metismenu-icon pe-7s-rocket"></i>
                                        Permisos y roles
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="metismenu-icon pe-7s-rocket"></i>
                                        
                                    </a>
                                </li>

                                
                                
                                @endhasrole
                            </ul>
                        </div>
                    </div>
                </div>    
 


                <div class="app-main__outer">
                    <div class="app-main__inner">
                        <router-view></router-view>
                        @yield('content')

                        <!--
                        <div class="fill card mb-3" id="cambiar_color" >
                        </div>
                        -->
                    </div>
                    
                    <div class="app-wrapper-footer">
                        <div class="app-footer">
                            <div class="app-footer__inner">
                                <div class="app-footer-left">
                                    <ul class="nav">
                                        <!--
                                        <li class="nav-item">
                                            <a href="javascript:void(0);" class="nav-link">
                                                Footer Link 1
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="javascript:void(0);" class="nav-link">
                                                Footer Link 2
                                            </a>
                                        </li>
                                    -->
                                    </ul>
                                </div>
                                <div class="app-footer-right">
                                    <ul class="nav">
                                        <!--
                                        <li class="nav-item">
                                            <a href="javascript:void(0);" class="nav-link">
                                                Footer Link 3
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="javascript:void(0);" class="nav-link">
                                                <div class="badge badge-success mr-1 ml-0">
                                                    <small>NEW</small>
                                                </div>
                                                Footer Link 4
                                            </a>
                                        </li>
                                    -->
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>    </div>
        </div>
    </div>
    <link href="{{ asset('Architectui/assets/css/main.css') }}" rel="stylesheet">
    <script src="{{asset('js/app.js?v=3.0.1')}}"></script>
    <!--
    <script type="text/javascript" src="{{ asset('jsi/jquery-3.3.1.js') }}"></script>
    -->
    <script type="text/javascript" src="{{ asset('Architectui/assets/scripts/main.js') }}"></script>
<!--


-->
<style>

    .fill{
        width:100%;
        height:100%;
        min-height:100%;
        background-color:#990000;
        padding:10px;
        color:#000;
        height: ;
    }
    .form-control:disabled, .form-control[readonly] {
        background-color: #b1b1b1;
        opacity: 1;
    }
    .form-group .select2-container {
        position: relative;
        z-index: 0!important;
    }
    .card-body{
        color: #000000
    }
    
    .custom-file-label{
        color:#000000
    }
    .btn-sm-mass{
        padding-top: 0px!important;
        padding-bottom: 0px!important;
    }
    .hr-2{
    margin-top: 2px;
        margin-bottom: 2px;
    }
    .bg-arielle-edyconst{
        background-image: radial-gradient(circle 248px at center, #f88506 0%, #f98705 47%, #ff7e00 100%) !important;
    }
    }
    .table-b-table-default td{
        padding-top: 0px!important;
        padding-bottom: 0px!important;
    }
    
     </style>
  <style>
 
          .form-group .select2-container{
            position: relative;
            z-index: 2;
            float: left;
            width: 100%;
            margin-bottom: 0; 
            display: table;
            table-layout: fixed;
          }
 
          .select2-container{ width: 100% !important; }
 /*         
            span.select2-container {
                z-index:99999;
            }
            .select2-container {
                z-index: 99999;
            }
            .select2-close-mask{
    z-index: 2099;
}
.select2-dropdown{
    z-index: 3051;
}
.modal.fade {
  z-index: 10000000 !important;
}
.select2-search__field  {
  z-index: 50000000!important;
}
*/

          .panel_principal{
                background-color:#999;
                border-radius: 5px 5px 5px 5px;
                -moz-border-radius: 5px 5px 5px 5px;
                -webkit-border-radius: 5px 5px 5px 5px;
                border: 1px solid #000000;
                color:#000;
            }
            .texto-titulos{
                font-size:20px;
            }
            .table_td td{
                _width:100%;
                min-height:10px; 
                _max-width: 20px;
                   _vertical-align: top;

            }
            td th {
            min-height: 10px;
            }
            table{
               height:0px; /*Set any facultative length value to Height (percentage value doesn't work)*/
                min-height:20vh;
            }
            .b-table-sticky-header {
                overflow-y: auto;
                max-height: 100%;
            }
            .form-group{
                margin-bottom: 0px;
            }
            .form-control{
                height: calc(1.60rem + 2px);
                border: 1px solid #2e2e2f; 
            }
            .form-control:hover {
                height: calc(1.60rem + 2px);
                 
                _border: 2px solid #ec8d32;
            }
            .formulario{
                background-color: #b1b1b1;
                background-image: linear-gradient(to top, #1e3c72 0%, #1e3c72 1%, #2a5298 100%) !important;
                color: #b1b1b1
            }
            .formulario label{
                color: #ffffff;
                margin-bottom: 0px;
                font-size: 17px;

            }
            .formulario label span{
                color: #dc3545;
                margin-bottom: 0px;
                font-size: 25px;

            }
            .formulario h2{
                color: #ffffff;
            }


            .select2-container--default .select2-selection--single {
                border: 1px solid #2e2e2f!important;
            }
            .select2-container--default.select2-container--disabled .select2-selection--single {
            background-color: #929292;
            cursor: default;
            }
            .form-control:disabled, .form-control[readonly] {
                background-color: #929292;
                opacity: 1;
            }
            .consecutivo_entrada{
                border: silver 5px solid;
                __border-image-source: url("marco-dorado.png");
                __border-image-slice: 21;
                padding: 10px;
                text-align: justify;
            }
            .cartera_cuadro {
                background-color: #bdbdbd;
            }
            .cartera_cuadro_do  {
                background-color: #999;
            }
            .espacio-5{
                padding-top: 5px;
            }
            .tabla-smal{
                margin: 0px;
                
                padding-top: 0px;
                padding-bottom: 0px;

            }
            .row_espacio{
                padding-right: 0px!important;
                margin-right: 0px!important;
                margin-left: 0px!important;
                padding-left: 0px!important;
            }
            .formulario-edy{
                background-color: #9e9e9e;
            }
            .formulario-edy label{
                padding-left: 5px;
                padding-right: 5px;
            }
            .input-group-text{
                padding-top: 0px;
                padding-bottom: 0px;
                

            }
            .input-group-text {
                background-color: #9E9E9E;
                color:#000000
            }
            .card-body{
                padding-top: 5px;
                padding-bottom: 5px;
            }
            .btn{
                
                padding-left: 6px;
                padding-right: 6px;
                padding-top: 0px;
                padding-bottom: 0px;
                margin-top: 0px!important;
                margin-bottom: 0px!important;


            } 



            
          </style>
          <style>
            #myInput {
            margin-top: 0px;
            _background-image: url('/css/searchicon.png'); /* Add a search icon to input */
            background-color:#ffb05d;
            background-position: 10px 12px; /* Position the search icon */
            background-repeat: no-repeat; /* Do not repeat the icon image */
            width: 100%; /* Full-width */
            font-size: 16px; /* Increase font-size */
            padding: 1px 2px 2px 4px; /* Add some padding */
            border: 1px solid #f75f0a;
           
            margin-bottom: 0px; /* Add some space below the input */
            }

            #myUL {
            /* Remove default list styling */
            list-style-type: none;
            padding: 0;
            margin: 0;
            }

            #myUL li a {
            _border: 1px solid #ddd; /* Add a border to all links */
            _margin-top: -1px; /* Prevent double borders */
            _background-color: #f6f6f6; /* Grey background color */
            _padding: 12px; /* Add some padding */
            _text-decoration: none; /* Remove default text underline */
            _font-size: 18px; /* Increase the font-size */
            _color: black; /* Add a black text color */
            _display: block; /* Make it into a block element to fill the whole list */
            }

            #myUL li a:hover:not(.header) {
            background-color: #eee; /* Add a hover effect to all links, except for headers */
            }
            </style>
<link rel="stylesheet" href="{{asset('css/jquery.dataTables.min.css')}}">
<!--
<script type="text/javascript" src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
-->
<script src="{{ asset('https://cdn.datatables.net/fixedcolumns/3.2.2/js/dataTables.fixedColumns.min.js') }}"></script>
<link href="https://cdn.datatables.net/fixedcolumns/3.2.2/css/fixedColumns.dataTables.min.css" rel="stylesheet"/>

<link rel="stylesheet" href="{{ asset('css/toastr.min.css')}}">
<script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js" type="text/javascript"/></script>

<script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js" type="text/javascript"/></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js" type="text/javascript"/></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

<script src="{{ asset('js/vue-multiselect.min.js')}}"></script>
<link rel="stylesheet" href="https://unpkg.com/vue-multiselect@2.1.0/dist/vue-multiselect.min.css">


<link rel="stylesheet" type="text/css" href="{{asset('css/select2.css')}}">

<!--

<link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.css">

<link rel="stylesheet" type="text/css" href="https://select2.github.io/select2-bootstrap-theme/css/select2-bootstrap.css">

<link rel="stylesheet" href="{{asset('plugins/datepicker/datepicker3.css')}}">
<link rel="stylesheet" href="{{ asset('plugins/daterangepicker/daterangepicker.css') }}">
<link rel="stylesheet" href="{{ asset('plugins/datepicker/datepicker3.css') }}">
-->
<!--
<script src="{{ asset('plugins/daterangepicker/daterangepicker.js') }}"></script>
<script type="text/javascript" src="{{ asset('plugins/datepicker/bootstrap-datepicker.js') }}"></script>
-->

<!--
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css" rel="stylesheet"/>
<link href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css" rel="stylesheet"/>
-->

</body>
</html>
@yield('page-js-files')
@yield('page-js-script')
</body>
</html>
<!--
<script>
    const mq = window.matchMedia("(prefers-reduced-motion: no-preference)");
    
    if (mq.matches) {
      let script = document.createElement("script");
      script.src = "//unpkg.com/focus-overlay@latest/dist/focusoverlay.js";
      document.head.appendChild(script);
    }
    </script>
-->
<script>
    function myFunction() {
      // Declare variables
      var input, filter, ul, li, a, i, txtValue;
      input = document.getElementById('myInput');
      filter = input.value.toUpperCase();
      ul = document.getElementById("myUL");
      li = ul.getElementsByTagName('li');
    
      // Loop through all list items, and hide those who don't match the search query
      for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        if(a!=null){
            txtValue = a.textContent || a.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
            } else {
            li[i].style.display = "none";
            }
        }
        
      }
    }
</script>

<script>




  $(function () {
    //$("#data_tables").DataTable();
    /*
    $('#example2').DataTable({
        "pagi1ng": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false
        
    });
    */
  });
  
</script>
<script type="text/javascript">
//color_menu_vertical
$('.swatch-holder').on('click', function() {
var de;   
    //alert($('.switch-sidebar-cs-class active'));
    //console.info($('.switch-sidebar-cs-class active'));
    //de = $('.switch-sidebar-cs-class active').data("id");
    
    var clase = $(this).data("class");
    var theme = $(this).data("theme");


   //var de= $('.switch-sidebar-cs-class active').data('class');
   console.info(clase);
   console.info(theme);
    //alert($('.switch-header-cs-class active').data('class'));
    $.ajax({
        type: 'POST',
        url: "Index/templete_ajuste",
        data: {
            'color_app':clase,
            'theme':theme,
            //'color_app_vertical':$(this).data('class'),
            '_token': $('input[name=_token]').val(),
        },
        success: function(data) {}
    }).done(function() {
        $( this ).addClass( "done" );
    });



/*
    $.ajax({
				type: 'POST',
				url: 'Estado_sanitario',
				data: {
				'id': $('#id_mass').val(),'nombre': $('#nombre_mass').val(),'created_at': $('#created_at_mass').val(),'updated_at': $('#updated_at_mass').val(),
					'_token': $('input[name=_token]').val(),
				},
				success: function(data) {
					$('.errorid').addClass('hidden');$('.errornombre').addClass('hidden');$('.errorcreated_at').addClass('hidden');$('.errorupdated_at').addClass('hidden');;
					if ((data.errors)) {
						setTimeout(function () {
							$('#massModal').modal('show');
							toastr.error('Validation error!', 'Error Alert', {timeOut: 5000});
						}, 500);
						$('.errorid').removeClass('hidden');$('.errorid').text(data.errors.id);$('.errornombre').removeClass('hidden');$('.errornombre').text(data.errors.nombre);$('.errorcreated_at').removeClass('hidden');$('.errorcreated_at').text(data.errors.created_at);$('.errorupdated_at').removeClass('hidden');$('.errorupdated_at').text(data.errors.updated_at);;
					}
                }
    });

*/
});



$('.switch-sidebar-cs-class').on('click', function() {
    
    //$(this).data('estado_id')
    //alert($(this).data('class'));
    var classes = $(this).data('class');
    sessionStorage.setItem('switch_sidebar',classes);
    //console.info($(this));
    //console.info(this.data('class'));
});

$('#hamburger-close').on('click', function() {
//alert("de");


});

 
$('.switch-header-cs-class').on('click', function() {
    var classes_header = $(this).data('class');
    sessionStorage.setItem('switch_header',classes_header);
});



    $('.input-number-line').on('input', function () { 
      this.value = this.value.replace(/[^0-9-]/g,'');
    });
     $('.input-number-guion-abajo').on('input', function () { 
      this.value = this.value.replace(/[^0-9_]/g,'');
    });
    $('.input-number').on('input', function () { 
      this.value = this.value.replace(/[^0-9]/g,'');
    });
    $('.input-number-coma').on('input', function () { 
      this.value = this.value.replace(/[^0-9,]/g,'');
    });
    $('.input-number-coma-punto').on('input', function () { 
      this.value = this.value.replace(/[^0-9.]/g,'');
    });
     $('.input-number-punto').on('input', function () { 
      this.value = this.value.replace(/[^0-9.-]/g,'');
    });
    $('.input-number-punto-coma').on('input', function () { 
      this.value = this.value.replace(/[^0-9.,]/g,'');
    });
    $('.solo-texto').on('input', function () { 
      this.value = this.value.replace(/[^a-zA-ZñÑáéíóúÁÉÍÓÚ.(),@ _-]/g,'');
    });
    /*
    $('.form-control').on('input', function () { 
      this.value = this.value.replace(/[^0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.(),@ _-]/g,'');
    });
    */
    /*
    $('.datepicker').datepicker({
    format: 'yyyy-mm-dd',
    //startDate: '-3d',
    todayHighlight: true,
    closeText: 'Cerrar',
        prevText: '<Ant',
        nextText: 'Sig>',
        currentText: 'Hoy',
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
        weekHeader: 'Sm',
        dateFormat: 'dd/mm/yy',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''

    });

    $('#fecha_mass').datepicker({
          autoclose: true,
          format: 'yyyy-dd-mm',
          closeText: 'Cerrar',
        prevText: '<Ant',
        nextText: 'Sig>',
        currentText: 'Hoy',
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
        weekHeader: 'Sm',
        dateFormat: 'dd/mm/yy',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    });

*/
</script>
<!--
<style>
._____datepicker{z-index:1151 !important;}
</style>
-->

<script> 
/*
  $(document).ready(function(){
    $("#myTable").DataTable({
        scrollY:        '100%',
        language: {
            "decimal": "",
            "emptyTable": "No hay información",
            "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
            "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "Mostrar _MENU_ Entradas",
            "loadingRecords": "Cargando...",
            "processing": "Procesando...",
            "search": "Buscar:",
            "zeroRecords": "Sin resultados encontrados",
            "paginate": {
                "first": "Primero",
                "last": "Ultimo",
                "next": "Siguiente",
                "previous": "Anterior"
            }
        }, 
    });
  });

$(document).ready(function() {
  $(".Select2").select2({
    dropdownParent: $("#moda-registro")
  });
});
*/
</script>
 <style>
    .select2-container {
      width: 100%;
    }
    span.select2-container {
    __z-index:10050;
}


.has-error .select2-selection {
    border-color: rgb(185, 74, 72) !important;
}
      </style>
      
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.js"></script>

<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css" rel="stylesheet"/>
<script>
    $(document).ready( function () {
        $('#data_tables').DataTable();
    });
</script>







