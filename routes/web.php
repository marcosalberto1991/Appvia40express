<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('UnidadFuncional/consulta', 'UnidadFuncionalController@consulta');
Route::resource('UnidadFuncional','UnidadFuncionalController');

Route::get('EstadoTramite/consulta', 'EstadoTramiteController@consulta');
Route::resource('EstadoTramite','EstadoTramiteController');

Route::get("Concreto/create", function(){return View::make("home");});
Route::get("Concreto", function(){return View::make("home");});
Route::get("Concreto/{id}/edit", function(){return View::make("home");});




Route::group(['prefix' => '*'], function () {
    return View::make("home");
});
//Route::group(['middleware' => 'api'], function() {

Route::get('Api/Concreto/consulta', 'ConcretoController@consulta');
Route::resource('Api/Concreto','ConcretoController');
Route::get('Api/ConcretoDetalles/consulta', 'ConcretoDetallesController@consulta');
Route::resource('Api/ConcretoDetalles','ConcretoDetallesController');
Route::resource('Api/ConcretoDetalles','ConcretoDetallesController');
Route::get('Api/ConcretoDetalles/{concreto_id}/consulta_data', 'ConcretoDetallesController@consulta_data');
Route::post('Api/ConcretoDetalles_update/{id}', 'ConcretoDetallesController@update');
Route::get('Concreto/{concreto_id}/pdfConcreto', 'ConcretoController@pdfConcreto');
Route::get('Concreto/{file}', function ($file) {
    $data =Storage::disk('Concreto')->response("$file");
    if($data){
        return $data;
    }else{
        return 'null.png';
    }

});

Route::get('Api/Acero/consulta', 'AceroController@consulta');
Route::resource('Api/Acero','AceroController');
Route::get("Acero/create", function(){return View::make("home");});
Route::get("Acero", function(){return View::make("home");});
Route::get("Acero/{id}/edit", function(){return View::make("home");});
Route::get('Api/AceroDetalle/{id}/consulta_data', 'AceroDetalleController@consulta_data');
Route::post('Api/AceroDetalles_update/{id}', 'AceroDetalleController@update');


//Fresado
Route::get('Api/Fresado/consulta', 'FresadoController@consulta');
Route::resource('Api/Fresado','FresadoController');
Route::get("Fresado/create", function(){return View::make("home");});
Route::get("Fresado", function(){return View::make("home");});
Route::get("Fresado/{id}/edit", function(){return View::make("home");});
Route::get('Api/FresadoDetalle/consulta', 'FresadoDetalleController@consulta');
Route::resource('Api/FresadoDetalle','FresadoDetalleController');
Route::get('Api/FresadoDetalle/{id}/consulta_data', 'FresadoDetalleController@consulta_data');
Route::post('Api/FresadoDetalles_update/{id}', 'FresadoDetalleController@update');





Route::get('/clear', function() {

    Artisan::call('cache:clear');
    Artisan::call('config:clear');
    Artisan::call('config:cache');
    Artisan::call('view:clear');

    return "configuracion actualizado en ENV!";

 });
//    Route::get('users', 'UserController@index');
  //  Route::get('users/create', 'UserController@create');
//});
