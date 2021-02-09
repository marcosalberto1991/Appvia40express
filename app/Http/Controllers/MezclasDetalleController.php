<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;
use Auth;

use App\MezclasDetalleModel;
use View;
use App\User;

class MezclasDetalleController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    protected $rules =
    [
        'hora_llegada' => 'required|min:2|max:255',
        'tem_llegada' => 'required|min:2|max:255',
        'cantidad_ton' => 'required|min:1|max:255',
        'hora_extendida' => 'required|min:2|max:255',
        'temp_extendida' => 'required|min:2|max:255',
        'abcisas_inicio' => 'required|min:1|max:255',
        'abcisas_fin' => 'required|min:1|max:255',
        'abcisas_espersor' => 'required|min:1|max:255',
        'abscisas_carril' => 'required|min:1|max:255',
        'temp_compactacion' => 'required|min:2|max:255',
        'temp_apertu_trafico' => 'required|min:2|max:255',
        'observaciones' => 'max:255',
        'registro_fotografico' => 'max:2550',
        //'users_id1' => 'required|min:2|max:255',
        'mezclas_id' => 'required|min:1|max:255',

    ];

    //public function index(){
    //return view('MezclasDetalle.index', [] );
    //}
    public function index(Request $request)
    {
        $consulta_data = $request->get("consulta_data");
        if ($consulta_data == "") {
            $data = MezclasDetalleModel::paginate(20);
        } else {
            $data = MezclasDetalleModel::where("id", 1)
                ->orwhere("id", "like", "%" . $consulta_data . "%")
                ->orwhere("recino_no", "like", "%" . $consulta_data . "%")
                ->orwhere("hora_llegada", "like", "%" . $consulta_data . "%")
                ->orwhere("tem_llegada", "like", "%" . $consulta_data . "%")
                ->orwhere("cantidad_ton", "like", "%" . $consulta_data . "%")
                ->orwhere("hora_extendida", "like", "%" . $consulta_data . "%")
                ->orwhere("temp_extendida", "like", "%" . $consulta_data . "%")
                ->orwhere("abcisas_inicio", "like", "%" . $consulta_data . "%")
                ->orwhere("abcisas_fin", "like", "%" . $consulta_data . "%")
                ->orwhere("abcisas_espersor", "like", "%" . $consulta_data . "%")
                ->orwhere("abscisas_carril", "like", "%" . $consulta_data . "%")
                ->orwhere("temp_compactacion", "like", "%" . $consulta_data . "%")
                ->orwhere("temp_apertu_trafico", "like", "%" . $consulta_data . "%")
                ->orwhere("observaciones", "like", "%" . $consulta_data . "%")
                ->orwhere("registro_fotografico", "like", "%" . $consulta_data . "%")
                ->orwhere("users_id1", "like", "%" . $consulta_data . "%")
                ->orwhere("mezclas_id", "like", "%" . $consulta_data . "%")

                ->paginate(20);
        }

        return response()->json($data);
    }
    public function consulta_data($id){
        $data = MezclasDetalleModel::where('mezclas_id',$id)->get();
        return response()->json($data);
    }
    public function create()
    {
        $data_foraneos = [
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

            $MezclasDetalle = new MezclasDetalleModel();
            $MezclasDetalle->recino_no = $request->recino_no;
            $MezclasDetalle->hora_llegada = $request->hora_llegada;
            $MezclasDetalle->tem_llegada = $request->tem_llegada;
            $MezclasDetalle->cantidad_ton = $request->cantidad_ton;
            $MezclasDetalle->hora_extendida = $request->hora_extendida;
            $MezclasDetalle->temp_extendida = $request->temp_extendida;
            $MezclasDetalle->abcisas_inicio = $request->abcisas_inicio;
            $MezclasDetalle->abcisas_fin = $request->abcisas_fin;
            $MezclasDetalle->abcisas_espersor = $request->abcisas_espersor;
            $MezclasDetalle->abscisas_carril = $request->abscisas_carril;
            $MezclasDetalle->temp_compactacion = $request->temp_compactacion;
            $MezclasDetalle->temp_apertu_trafico = $request->temp_apertu_trafico;
            $MezclasDetalle->observaciones = $request->observaciones;
            $MezclasDetalle->registro_fotografico = $request->registro_fotografico;
            $MezclasDetalle->users_id1 = Auth::user()->id;
            $MezclasDetalle->mezclas_id = $request->mezclas_id;

            $MezclasDetalle->save();
            return response()->json($MezclasDetalle);
        }
    }
    public function show($id)
    {
        return response()->json(MezclasDetalleModel::findOrFail($id));
    }


    public function edit($id)
    {
        return view("MezclasDetalle.index", []);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), $this->rules);
        if ($validator->fails()) {
            return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
        } else {
            $conunt = MezclasDetalleModel::where('mezclas_id',$request->mezclas_id)->conunt();

            $MezclasDetalle = MezclasDetalleModel::findOrFail($id);


            $MezclasDetalle->recino_no = $conunt++;
            $MezclasDetalle->hora_llegada = $request->hora_llegada;
            $MezclasDetalle->tem_llegada = $request->tem_llegada;
            $MezclasDetalle->cantidad_ton = $request->cantidad_ton;
            $MezclasDetalle->hora_extendida = $request->hora_extendida;
            $MezclasDetalle->temp_extendida = $request->temp_extendida;
            $MezclasDetalle->abcisas_inicio = $request->abcisas_inicio;
            $MezclasDetalle->abcisas_fin = $request->abcisas_fin;
            $MezclasDetalle->abcisas_espersor = $request->abcisas_espersor;
            $MezclasDetalle->abscisas_carril = $request->abscisas_carril;
            $MezclasDetalle->temp_compactacion = $request->temp_compactacion;
            $MezclasDetalle->temp_apertu_trafico = $request->temp_apertu_trafico;
            $MezclasDetalle->observaciones = $request->observaciones;
            $MezclasDetalle->registro_fotografico = $request->registro_fotografico;
            //$MezclasDetalle->users_id1 = $request->users_id1;
            //$MezclasDetalle->mezclas_id = $request->mezclas_id;


            $MezclasDetalle->save();
            return response()->json($MezclasDetalle);
        }
    }

    public function destroy($id)
    {
        $MezclasDetalle = MezclasDetalleModel::findOrFail($id);
        $MezclasDetalle->delete();
        return response()->json($MezclasDetalle);
    }
}
