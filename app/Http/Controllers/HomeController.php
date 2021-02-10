<?php

namespace App\Http\Controllers;

use App\CoodenadasModel;
use Illuminate\Http\Request;
//use Auth;
use DB;
use Illuminate\Support\Facades\Auth;


class homeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }
    public function obtener_pk($latitud=4.40666917193584,$longitud=-74.3843199485316){


          //  $latitud=4.40666917193584; //4.58609036598748
           // $longitud=-74.3843199485316; //-74.2048071736164
            $data =DB::select(DB::raw("SELECT latitud,eje,pk,longitud, SQRT( POW(69.1 * (latitud - $latitud), 2) + POW(69.1 * ($longitud - longitud) * COS(latitud / 57.3), 2)) AS distance FROM coodenadas  ORDER BY distance limit 5"));
    return response()->json($data);

//    echo $data
    }
}
