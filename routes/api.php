<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['middleware' => ['api']], function () {
    //Rutas a las que se permitirá acceso
    Route::resource('Notas','NotasController');
    Route::resource('post','PostController');
    Route::get('ConcretoMo/consulta','ConcretoMoController@consulta')->middleware('auth:api');
    Route::resource('ConcretoMo','ConcretoMoController');




});


Route::group([
    'prefix' => 'auth'
], function () {
    Route::post('login', 'AuthController@login');
    Route::post('signup', 'AuthController@signUp');
    Route::get('PPconsulta', 'AuthController@consulta');


    Route::group([
      'middleware' => 'auth:api'
    ], function() {
        //Resource::get('logout', 'AuthController@logout');


        Route::get('logout', 'AuthController@logout');
        Route::get('user', 'AuthController@user');
        //Route::get('Concreto/consulta','ConcretoController@consulta');

    });
});


Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();

});

//Route::resource('apim/Concreto','ConcretoController')->middleware('auth:api');
//Route::get('apim/Concreto/consulta','ConcretoController@consulta')->middleware('auth:api');
//Route::get('api/Concreto/consulta2','ConcretoController@consulta');//->middleware('auth:api');
//Route::apiResource('api/Concreto','ConcretoController');//->middleware('auth:api');


