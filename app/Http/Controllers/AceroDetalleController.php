<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;

use App\AceroDetalleModel;
use View;
use App\User;

class AceroDetalleController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    protected $rules =
    [
      //  'actividad' => 'required|min:2|max:255',
        'si_aplica' => 'required|min:1|max:255',
        'si_cumple' => 'required|min:1|max:255',
        'fecha' => 'required|min:2|max:255',
        'observaciones' => 'required|min:2|max:255',
        'registro_fotografico' => 'required|min:2|max:2555',
        //'acero_id' => 'required|min:2|max:255',

    ];

    //public function index(){
    //return view('AceroDetalle.index', [] );
    //}
    public function index(Request $request)
    {
        $consulta_data = $request->get("consulta_data");
        if ($consulta_data == "") {
            $data = AceroDetalleModel::paginate(20);
        } else {
            $data = AceroDetalleModel::where("id", 1)
                ->orwhere("id", "like", "%" . $consulta_data . "%")
                ->orwhere("actividad", "like", "%" . $consulta_data . "%")
                ->orwhere("si_aplica", "like", "%" . $consulta_data . "%")
                ->orwhere("si_cumple", "like", "%" . $consulta_data . "%")
                ->orwhere("fecha", "like", "%" . $consulta_data . "%")
                ->orwhere("observaciones", "like", "%" . $consulta_data . "%")
                ->orwhere("registro_fotografico", "like", "%" . $consulta_data . "%")
                ->orwhere("acero_id", "like", "%" . $consulta_data . "%")

                ->paginate(20);
        }

        return response()->json($data);
    }

    public function create()
    {
        $data_foraneos = [
            "acero_id" => AceroDetalleModel::select("id", "id as nombre", "id as text")->get(),

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

            $AceroDetalle = new AceroDetalleModel();
            $prueba_producto = $request->all();
            $AceroDetalle->actividad = $request->actividad;
            $AceroDetalle->si_aplica = $request->si_aplica;
            $AceroDetalle->si_cumple = $request->si_cumple;
            $AceroDetalle->fecha = $request->fecha;
            $AceroDetalle->observaciones = $request->observaciones;
            $AceroDetalle->registro_fotografico = $request->registro_fotografico;
            $AceroDetalle->acero_id = $request->acero_id;

            $AceroDetalle->save();
            return response()->json($AceroDetalle);
        }
    }
    public function show($id)
    {
        return response()->json(AceroDetalleModel::findOrFail($id));
    }


    public function edit($id)
    {
        return view("AceroDetalle.index", []);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), $this->rules);
        if ($validator->fails()) {
            return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
        } else {
            $AceroDetalle = AceroDetalleModel::findOrFail($id);

            $file2 = $request->file('registro_fotografico'); // Input::file('registro_fotografico');
            if (isset($file2)) {
                $codigo = 'str_random(5)';
                $nombre_original = $file2->getClientOriginalName();
                $nombres = $nombre_original . $codigo . '.' . $file2->getClientOriginalExtension();
                \Storage::disk('Concreto')->put($nombres, \File::get($file2));
                $AceroDetalle->registro_fotografico = $nombres;
            }

          //  $AceroDetalle->actividad = $request->actividad;
            $AceroDetalle->si_aplica = $request->si_aplica;
            $AceroDetalle->si_cumple = $request->si_cumple;
            $AceroDetalle->fecha = $request->fecha;
            $AceroDetalle->observaciones = $request->observaciones;
            //$AceroDetalle->registro_fotografico = $request->registro_fotografico;
            //$AceroDetalle->acero_id = $request->acero_id;


            $AceroDetalle->save();
            return response()->json($AceroDetalle);
        }
    }

    public function destroy($id)
    {
        $AceroDetalle = AceroDetalleModel::findOrFail($id);
        $AceroDetalle->delete();
        return response()->json($AceroDetalle);
    }

    public function consulta_data($acero_id)
    {
        $data_count = AceroDetalleModel::where('acero_id', $acero_id)->count();

        if ($data_count == 0) {

            $string = '[
              {
                "titulo": "<b>Acero de refuerzo</b> con las formas indicadas en los planos, cumpliendo con despieces y diagramas de diseño",
                "columna": "3"
              },{
                "titulo": "<b>Estado del refuerzo</b> Las varillas y alambres de amarres no presentan alto grado de corrosión",
                "columna": "3"
              },{
                  "titulo": " <b>Recubrimiento y amarre</b>  Ubicación,  alineacion y espaciamiento  de acuerdo a los planos y normas.",
                  "columna": "3"
              }
          ]';

            $resultado = json_decode($string, true);
            foreach ($resultado as $key => $value) {

                $AceroDetalles = new AceroDetalleModel();
                $AceroDetalles->columna = $value['columna'];
                $AceroDetalles->actividad = $value['titulo'];
                $AceroDetalles->si_aplica = '3';
                $AceroDetalles->si_cumple = '3';
                $AceroDetalles->fecha = '2020-01-05';
                $AceroDetalles->observaciones = ' ';
                $AceroDetalles->registro_fotografico = 'sinfoto';
                $AceroDetalles->acero_id = $acero_id;
                $AceroDetalles->save();
            }
        }
        $data = AceroDetalleModel::where('acero_id', $acero_id)->get();

        return response()->json($data);
    }
}
