<!doctype html>
<html lang="es">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Landing Page - Start Bootstrap Theme</title>

  <!-- Bootstrap core CSS -->
  <link href="{{asset('startbootstrap-landing/vendor/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="{{asset('startbootstrap-landing/vendor/fontawesome-free/css/all.min.css')}}" rel="stylesheet">
  <link href="{{asset('startbootstrap-landing/vendor/simple-line-icons/css/simple-line-icons.css')}}" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic')}}" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="{{asset('startbootstrap-landing/css/landing-page.min.css')}}" rel="stylesheet">
  <style>
    .back-greed {
    background-color: #6dc9e4!important;}
  .fa{
    margin-right: 5px;}
  .margin-mass{
    margin-left: 30px;
    margin-right: 30px;}
    a{
      color: #111;
    }
  </style>
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-light bg-light static-top back-greed">
  
    <div class="container">
      <a class="navbar-brand" href="../">Estacion Metodologicas</a>
      <a class="nav-link" href="{{ action('DatosDispositivoController@index') }}">Datos Dispositivo</a>
      <a class="nav-link " href="{{ action('DispositivoController@index') }}">Dispositivo</a>
      <a class=" nav-link" href="{{ action('TipoDispositivoController@index') }}">Tipo de Dispositivo</a>

  




      <ul class="nav nav-pills">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Notificación</a>
          <div class="dropdown-menu" style="
    width: 357px;
">
            
          
          <div class="dropdown-divider"></div>




          <div class="list-group">
            <a href="#" class="list-group-item list-group-item-action active">
              <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">List group item heading</h5>
                <small>3 days ago</small>
              </div>
              <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
              <small>Donec id elit non mi porta.</small>
            </a>
            <a href="#" class="list-group-item list-group-item-action">
              <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">List group item heading</h5>
                <small class="text-muted">3 days ago</small>
              </div>
              <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
              <small class="text-muted">Donec id elit non mi porta.</small>
            </a>
            <a href="#" class="list-group-item list-group-item-action">
              <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">List group item heading</h5>
                <small class="text-muted">3 days ago</small>
              </div>
              <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
              <small class="text-muted">Donec id elit non mi porta.</small>
            </a>
          </div>

            
          </div>
        </li>
      </ul>



               



      @hasrole('Super Administrador')
      <ul class="nav nav-pills">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Administrador</a>
          <div class="dropdown-menu">
            <a href="log-viewer" class="dropdown-item"><i class=" fa fa-font m-r-10" aria-hidden="true"></i>LOG</a>
            <a class="dropdown-item" href="{{ action('AuditoriaController@index') }}"><i class="fa fa-globe m-r-10" aria-hidden="true"></i>Auditoria</a>
            <a class="dropdown-item" href="{{ action('BackupController@index') }}"><i class="fa fa-columns m-r-10" aria-hidden="true"></i>Backup</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="{{ action('PermissionController@index') }}">Permiso</a>
            <a class="dropdown-item" href="{{ action('RoleController@index') }}">Roles</a>
            <a class="dropdown-item" href="{{ action('UserController@index') }}">Usuarios</a>
          </div>
        </li>
      </ul>
      @endhasrole
          

      
      
     
     

      @if (Route::has('login'))
            @if (Auth::check())
           
          <a href="{{ route('logout') }}" class="nav-link" 
                      onclick="event.preventDefault();
                      document.getElementById('logout-form').submit();"
                   >Salir</a>
                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                      {{ csrf_field() }}
                    </form>
          <a href="{{ action('PerfilUsuarioController@DatosUsuario') }}" class="nav-link"><b>Perfil</b></a>
          <?php $foto=auth()->user()->avatar;?>
                <img width="42" class="rounded-circle" src='{{ asset("perfil_usuario/$foto")}}' alt="">
        @else
        
          <a class="nav-link " href="{{ url('/login') }}">Ingresar</a>
          <a class="nav-link " href="{{ url('/register') }}">registrate</a>
        
        @endif
        @endif
    </div>
        @if (Route::has('login'))
            @if (Auth::check())
            
                {{ auth()->user()->name}}
                
            @endif
        @endif
  </nav>
   
  <section class="features-icons bg-light text-center" style="padding-bottom: 0px;">


    @yield('content')
  </section>
                        



<footer class="footer bg-light back-greed">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 h-100 text-center text-lg-left my-auto" >
          <ul class="list-inline mb-2">
            <li class="list-inline-item">
              <a href="#">Servicios</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">contáctenos</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">Términos de uso </a>
            </li>
           
          </ul>
          <p class="text-muted small mb-4 mb-lg-0">&copy; Estación Metodológicas, 2019. todos los derechos reservados.</p>
        </div>
        <div class="col-lg-6 h-100 text-center text-lg-right my-auto">
          <ul class="list-inline mb-0">
            <li class="list-inline-item mr-3">
              <a href="#">
                <i class="fab fa-facebook fa-2x fa-fw"></i>
              </a>
            </li>
            <li class="list-inline-item mr-3">
              <a href="#">
                <i class="fab fa-twitter-square fa-2x fa-fw"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <i class="fab fa-instagram fa-2x fa-fw"></i>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="{{asset('startbootstrap-landing/vendor/jquery/jquery.min.js')}}"></script>

  <link rel="stylesheet" href="{{asset('css/jquery.dataTables.min.css')}}">

  
  <link rel="stylesheet" href="{{ asset('css/toastr.min.css')}}">
  <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js" type="text/javascript"/></script>



  
<link rel="stylesheet" href="{{asset('plugins/datepicker/datepicker3.css')}}">
<script type="text/javascript" src="{{ asset('plugins/datepicker/bootstrap-datepicker.js') }}"></script>
  <script src="{{ asset('startbootstrap-landing/vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
  <script type="text/javascript" src="{{ asset('https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('plugins/daterangepicker/daterangepicker.js') }}"></script>
<link rel="stylesheet" href="{{asset('plugins/datepicker/datepicker3.css')}}">
  <script type="text/javascript" src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>

  <link href="{{ asset('css/select2.min.css') }}" rel="stylesheet" />
  <script src="{{ asset('js/select2.min.js') }}"></script>

                  
    @yield('page-js-files')
    @yield('page-js-script')
</body>
<style>
.datepicker{z-index:1151 !important;}
</style>
</html>
<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false
        
    });
  });


  $(document).ready(function() {
});
$(document).ready(function() {
    $('.js-example-basic-single').select2();
    $('.js-example-basic-multiple').select2();
    $('.multiple-select').select2();
    $('.busca_select').select2();
    //$('.select2').select2();
});
</script>
<script type="text/javascript">

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
    $('.form-control').on('input', function () { 
      this.value = this.value.replace(/[^0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.(),@ _-]/g,'');
    });

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


</script>
<style>
.datepicker{z-index:1151 !important;}
</style>


<script> 
  $(document).ready(function(){
    $("#myTable").DataTable({
        //scrollY:        '100%',
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
</script>
 <style>
    .select2-container {
      width: 100%;
    }
      </style>







