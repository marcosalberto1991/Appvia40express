<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;
use Auth;
use App\AceroModel;
use App\EstadoTramiteModel;
use App\UnidadFuncionalModel;
use View;
use App\User;

class AceroController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    protected $rules =
    [
      //  'id' => 'required|min:2|max:255',
        //'users_id' => 'required|min:2|max:255',
        'estrutura' => 'required|min:2|max:255',
        'plano' => 'required|min:2|max:255',
        'calzada' => 'required|min:2|max:255',
        'elemento' => 'required|min:2|max:255',
        'version' => 'required|min:2|max:255',
        'estado_tramite_id' => 'required|min:1|max:255',
        'unidad_funcional_id' => 'required|min:1|max:255',

    ];

    //public function index(){
    //return view('Acero.index', [] );
    //}
    public function index(Request $request)
    {
        $consulta_data = $request->get("consulta_data");
        if ($consulta_data == "") {
            $data = AceroModel::paginate(20);
        } else {
            $data = AceroModel::where("id", 1)
                ->orwhere("id", "like", "%" . $consulta_data . "%")
                ->orwhere("users_id", "like", "%" . $consulta_data . "%")
                ->orwhere("estrutura", "like", "%" . $consulta_data . "%")
                ->orwhere("plano", "like", "%" . $consulta_data . "%")
                ->orwhere("calzada", "like", "%" . $consulta_data . "%")
                ->orwhere("elemento", "like", "%" . $consulta_data . "%")
                ->orwhere("version", "like", "%" . $consulta_data . "%")
                ->orwhere("estado_tramite_id", "like", "%" . $consulta_data . "%")
                ->orwhere("unidad_funcional_id", "like", "%" . $consulta_data . "%")

                ->paginate(20);
        }

        return response()->json($data);
    }

    public function create()
    {
        $data_foraneos = [
            "estado_tramite_id" => EstadoTramiteModel::select("id", "nombre as text")->get(),
            "unidad_funcional_id" => UnidadFuncionalModel::select("id", "nombre as text")->get(),

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


            $Acero = new AceroModel();
            $Acero->users_id = Auth::user()->id;
            $Acero->estrutura = $request->estrutura;
            $Acero->plano = $request->plano;
            $Acero->calzada = $request->calzada;
            $Acero->elemento = $request->elemento;
            $Acero->version = $request->version;
            $Acero->estado_tramite_id = $request->estado_tramite_id;
            $Acero->unidad_funcional_id = $request->unidad_funcional_id;

            $Acero->save();
            return response()->json($Acero);
        }
    }
    public function show($id)
    {
        return response()->json(AceroModel::findOrFail($id));
    }


    public function edit($id)
    {
        return view("Acero.index", []);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), $this->rules);
        if ($validator->fails()) {
            return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
        } else {
            $Acero = AceroModel::findOrFail($id);

            $Acero->users_id = $request->users_id;
            $Acero->estrutura = $request->estrutura;
            $Acero->plano = $request->plano;
            $Acero->calzada = $request->calzada;
            $Acero->elemento = $request->elemento;
            $Acero->version = $request->version;
            $Acero->estado_tramite_id = $request->estado_tramite_id;
            $Acero->unidad_funcional_id = $request->unidad_funcional_id;


            $Acero->save();
            return response()->json($Acero);
        }
    }

    public function destroy($id)
    {
        $Acero = AceroModel::findOrFail($id);
        $Acero->delete();
        return response()->json($Acero);
    }
}
