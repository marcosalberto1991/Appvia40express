<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;
use Carbon\Carbon;

use App\FresadoDetalleModel;
use View;
use App\User;

class FresadoDetalleController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    protected $rules =
    [
        // 'id' => 'required|min:2|max:255',
        //'actividad' => 'required|min:2|max:255',
        'si_aplica' => 'required|min:1|max:255',
        'si_cumple' => 'required|min:1|max:255',
        'fecha' => 'required|min:2|max:255',
        'observaciones' => 'max:255',
        'registro_fotografico' => 'required|min:2|max:2555',
        //'created_at' => 'required|min:2|max:255',
        //'updated_at' => 'required|min:2|max:255',
        //'fresado_id' => 'required|min:2|max:255',
        //'estado_tramite_id' => 'required|min:2|max:255',

    ];

    //public function index(){
    //return view('FresadoDetalle.index', [] );
    //}
    public function index(Request $request)
    {
        $consulta_data = $request->get("consulta_data");
        if ($consulta_data == "") {
            $data = FresadoDetalleModel::paginate(20);
        } else {
            $data = FresadoDetalleModel::where("id", 1)
                ->orwhere("id", "like", "%" . $consulta_data . "%")
                ->orwhere("actividad", "like", "%" . $consulta_data . "%")
                ->orwhere("si_aplica", "like", "%" . $consulta_data . "%")
                ->orwhere("si_cumple", "like", "%" . $consulta_data . "%")
                ->orwhere("fecha", "like", "%" . $consulta_data . "%")
                ->orwhere("observaciones", "like", "%" . $consulta_data . "%")
                ->orwhere("registro_fotografico", "like", "%" . $consulta_data . "%")
                ->orwhere("created_at", "like", "%" . $consulta_data . "%")
                ->orwhere("updated_at", "like", "%" . $consulta_data . "%")
                ->orwhere("fresado_id", "like", "%" . $consulta_data . "%")
                ->orwhere("estado_tramite_id", "like", "%" . $consulta_data . "%")

                ->paginate(20);
        }

        return response()->json($data);
    }

    public function create()
    {
        $data_foraneos = [
            "fresado_id" => FresadoDetalleModel::select("id", "id as nombre", "id as text")->get(),
            "estado_tramite_id" => FresadoDetalleModel::select("id", "id as nombre", "id as text")->get(),

            //"departamento_id" => DepartamentoModel::select("id_departamento as id","departamento as text")->get(),
        ];
        return response()->json($data_foraneos);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), $this->rules);
        if ($validator->fails()) {
            return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
        } else {

            /*
        $file2 = Input::file('archivo');
        if (isset($file2)) {
          $codigo=str_random(5);
          $nombre_original=$file2->getClientOriginalName();
          $nombres = $nombre_original.$codigo. '.' . $file2->getClientOriginalExtension();
          \Storage::disk('intervenir')->put($nombres, \File::get($file2));
        }
        */

            $FresadoDetalle = new FresadoDetalleModel();
            $prueba_producto = $request->all();
            $FresadoDetalle->actividad = $request->actividad;
            $FresadoDetalle->si_aplica = $request->si_aplica;
            $FresadoDetalle->si_cumple = $request->si_cumple;
            $FresadoDetalle->fecha = $request->fecha;
            $FresadoDetalle->observaciones = $request->observaciones;
            $FresadoDetalle->registro_fotografico = $request->registro_fotografico;
            $FresadoDetalle->created_at = $request->created_at;
            $FresadoDetalle->updated_at = $request->updated_at;
            $FresadoDetalle->fresado_id = $request->fresado_id;
            $FresadoDetalle->estado_tramite_id = $request->estado_tramite_id;

            $FresadoDetalle->save();
            return response()->json($FresadoDetalle);
        }
    }
    public function show($id)
    {
        return response()->json(FresadoDetalleModel::findOrFail($id));
    }


    public function edit($id)
    {
        return view("FresadoDetalle.index", []);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), $this->rules);
        if ($validator->fails()) {
            return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
        } else {
            $FresadoDetalle = FresadoDetalleModel::findOrFail($id);
            $file2 = $request->file('registro_fotografico'); // Input::file('registro_fotografico');

            if (isset($file2)) {
                $codigo = 'str_random(5)';
                $nombre_original = $file2->getClientOriginalName();
                $nombres = $nombre_original . $codigo . '.' . $file2->getClientOriginalExtension();
                \Storage::disk('Concreto')->put($nombres, \File::get($file2));
                $FresadoDetalle->registro_fotografico = $nombres;
            }
           // $FresadoDetalle->actividad = $request->actividad;
            $FresadoDetalle->si_aplica = $request->si_aplica;
            $FresadoDetalle->si_cumple = $request->si_cumple;
            $FresadoDetalle->fecha = $request->fecha;
            $FresadoDetalle->observaciones = $request->observaciones;
            //$FresadoDetalle->registro_fotografico = $request->registro_fotografico;
           // $FresadoDetalle->created_at = $request->created_at;
           // $FresadoDetalle->updated_at = $request->updated_at;
           // $FresadoDetalle->fresado_id = $request->fresado_id;
         //   $FresadoDetalle->estado_tramite_id = $request->estado_tramite_id;


            $FresadoDetalle->save();
            return response()->json($FresadoDetalle);
        }
    }

    public function destroy($id)
    {
        $FresadoDetalle = FresadoDetalleModel::findOrFail($id);
        $FresadoDetalle->delete();
        return response()->json($FresadoDetalle);
    }
    public function consulta_data($fresado_id)
    {
        $data_count = FresadoDetalleModel::where('fresado_id', $fresado_id)->count();

        if ($data_count == 0) {

            $string = '[
              {
                "titulo": "<b>Seguridad  El frente de trabajo se encuentra señalizado de manera adecuada y aislado correctamente",
                "columna": "4"
              },{
                "titulo": "<b>Localización y replanteo  Se cuenta con control topográfico de las actividades",
                "columna": "4"
              },{
                  "titulo": " <b>Seguridad  Las volquetas cuentan con sistema de autocarpado",
                  "columna": "4"
              }
          ]';

            $resultado = json_decode($string, true);
            foreach ($resultado as $key => $value) {

                $AceroDetalles = new FresadoDetalleModel();
                $AceroDetalles->columna = $value['columna'];
                $AceroDetalles->actividad = $value['titulo'];
                $AceroDetalles->si_aplica = '3';
                $AceroDetalles->si_cumple = '3';
                $AceroDetalles->fecha = Carbon::now()->toDateTimeString();
                $AceroDetalles->observaciones = ' ';
                $AceroDetalles->registro_fotografico = 'sinfoto';
                $AceroDetalles->fresado_id = $fresado_id;
                $AceroDetalles->save();
            }
        }
        $data = FresadoDetalleModel::with('fresado_registro_fotografico_all')->where('fresado_id', $fresado_id)->get();

        return response()->json($data);
    }
}
