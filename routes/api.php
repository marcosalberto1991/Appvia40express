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
    });
});


Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::resource('Api/Concreto','ConcretoController');
Route::get('Api/Concreto/consulta','ConcretoController@consulta');



