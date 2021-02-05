<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;
use Auth;

use App\MezclasModel;
use View;
use App\User;

class MezclasController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    protected $rules =
    [

        'sentido_via' => 'required|min:2|max:255',
        'unidad_funcional_id' => 'required|min:2|max:255',
        'fecha' => 'required|min:2|max:255',
        'tipo_mezcla' => 'required|min:2|max:255',
        'ensayos_de_laboratorio' => 'required|min:2|max:255',
        'is_horas_riego_imrpimacion' => 'required|min:2|max:255',
        'is_horas_liga' => 'required|min:2|max:255',
        'estado-_riego' => 'required|min:2|max:255',
        //'users_id' => 'required|min:2|max:255',

    ];

    //public function index(){
    //return view('Mezclas.index', [] );
    //}
    public function index(Request $request)
    {
        $consulta_data = $request->get("consulta_data");
        if ($consulta_data == "") {
            $data = MezclasModel::paginate(20);
        } else {
            $data = MezclasModel::where("id", 1)

                ->orwhere("sentido_via", "like", "%" . $consulta_data . "%")
                ->orwhere("unidad_funcional_id", "like", "%" . $consulta_data . "%")
                ->orwhere("fecha", "like", "%" . $consulta_data . "%")
                ->orwhere("tipo_mezcla", "like", "%" . $consulta_data . "%")
                ->orwhere("ensayos_de_laboratorio", "like", "%" . $consulta_data . "%")
                ->orwhere("is_horas_riego_imrpimacion", "like", "%" . $consulta_data . "%")
                ->orwhere("is_horas_liga", "like", "%" . $consulta_data . "%")
                ->orwhere("estado_riego", "like", "%" . $consulta_data . "%")
                ->orwhere("users_id", "like", "%" . $consulta_data . "%")

                ->paginate(20);
        }

        return response()->json($data);
    }

    public function create()
    {
        $data_foraneos = [
            "unidad_funcional_id" => MezclasModel::select("id", "id as nombre", "id as text")->get(),

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

            $Mezclas = new MezclasModel();
            $Mezclas->sentido_via = $request->sentido_via;
            $Mezclas->unidad_funcional_id = $request->unidad_funcional_id;
            $Mezclas->fecha = $request->fecha;
            $Mezclas->tipo_mezcla = $request->tipo_mezcla;
            $Mezclas->ensayos_de_laboratorio = $request->ensayos_de_laboratorio;
            $Mezclas->is_horas_riego_imrpimacion = $request->is_horas_riego_imrpimacion;
            $Mezclas->is_horas_liga = $request->is_horas_liga;
            $Mezclas->estado_riego = $request->estado_riego;
            $Mezclas->users_id = Auth::user()->id;
            $Mezclas->save();
            return response()->json($Mezclas);
        }
    }
    public function show($id)
    {
        return response()->json(MezclasModel::findOrFail($id));
    }


    public function edit($id)
    {
        return view("Mezclas.index", []);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), $this->rules);
        if ($validator->fails()) {
            return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
        } else {
            $Mezclas = MezclasModel::findOrFail($id);

            $Mezclas->sentido_via = $request->sentido_via;
            $Mezclas->unidad_funcional_id = $request->unidad_funcional_id;
            $Mezclas->fecha = $request->fecha;
            $Mezclas->tipo_mezcla = $request->tipo_mezcla;
            $Mezclas->ensayos_de_laboratorio = $request->ensayos_de_laboratorio;
            $Mezclas->is_horas_riego_imrpimacion = $request->is_horas_riego_imrpimacion;
            $Mezclas->is_horas_liga = $request->is_horas_liga;
            $Mezclas->estado_riego = $request->estado_riego;
            $Mezclas->users_id = $request->users_id;


            $Mezclas->save();
            return response()->json($Mezclas);
        }
    }

    public function destroy($id)
    {
        $Mezclas = MezclasModel::findOrFail($id);
        $Mezclas->delete();
        return response()->json($Mezclas);
    }
}
