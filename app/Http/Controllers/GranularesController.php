<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;
use Auth;
use App\UnidadFuncionalModel;
use App\GranularesModel;
use View;
use App\User;

class GranularesController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    protected $rules =
    [
        'proyecto' => 'required|min:2|max:255',
        'plano_informe' => 'required|min:2|max:255',
        'version' => 'required|min:2|max:255',
        'calzada' => 'required|min:2|max:255',
        'actividad_pavimento' => 'required|min:2|max:255',
        'actividad_terraplen' => 'required|min:2|max:255',
        'actividad_relleno' => 'required|min:2|max:255',
        'especifique_estrutura' => 'required|min:2|max:255',
        'unidad_funcional_id' => 'required|min:1|max:255',
        'abcisado_de' => 'required|min:2|max:255',
        'abcisado_a' => 'required|min:2|max:255',
        'latitud' => 'required|min:2|max:255',
        'longitud' => 'required|min:2|max:255',

    ];

    //public function index(){
    //return view('Granulares.index', [] );
    //}
    public function index(Request $request)
    {
        $consulta_data = $request->get("consulta_data");
        if ($consulta_data == "") {
            if(Auth::user()->hasRole('Operado')){
                $data = GranularesModel::where('estado_tramite_id',1)->where('users_id',Auth::user()->id)->with('users_id','estado_tramite_id','unidad_funcional_id')->paginate(20);
            }
            if(Auth::user()->hasRole('Tecnico')){
                $data = GranularesModel::with('users_id','estado_tramite_id','unidad_funcional_id')->paginate(20);
            }
            if(Auth::user()->hasRole('Gerente')){
                $data = GranularesModel::with('users_id','estado_tramite_id','unidad_funcional_id')->paginate(20);
            }
            if(Auth::user()->hasRole('Administrador')){
                $data = GranularesModel::with('users_id','estado_tramite_id','unidad_funcional_id')->paginate(20);
            }



            //$data = GranularesModel::paginate(20);
        } else {
            $data = GranularesModel::where("id", 1)
                ->orwhere("id", "like", "%" . $consulta_data . "%")
                ->orwhere("proyecto", "like", "%" . $consulta_data . "%")
                ->orwhere("plano_informe", "like", "%" . $consulta_data . "%")
                ->orwhere("version", "like", "%" . $consulta_data . "%")
                ->orwhere("calzada", "like", "%" . $consulta_data . "%")
                ->orwhere("actividad_pavimento", "like", "%" . $consulta_data . "%")
                ->orwhere("actividad_terraplen", "like", "%" . $consulta_data . "%")
                ->orwhere("actividad_relleno", "like", "%" . $consulta_data . "%")
                ->orwhere("especifique_estrutura", "like", "%" . $consulta_data . "%")
                ->orwhere("users_id", "like", "%" . $consulta_data . "%")
                ->orwhere("unidad_funcional_id", "like", "%" . $consulta_data . "%")
                ->orwhere("abcisado_de", "like", "%" . $consulta_data . "%")
                ->orwhere("abcisado_a", "like", "%" . $consulta_data . "%")
                ->orwhere("latitud", "like", "%" . $consulta_data . "%")
                ->orwhere("longitud", "like", "%" . $consulta_data . "%")

                ->paginate(20);
        }

        return response()->json($data);
    }

    public function create()
    {
        $data_foraneos = [

            "unidad_funcional_id" => UnidadFuncionalModel::select("id","nombre as text")->get(),
        ];
        return response()->json($data_foraneos);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), $this->rules);
        if ($validator->fails()) {
            return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
        } else {



            $Granulares = new GranularesModel();
            $Granulares->proyecto = $request->proyecto;
            $Granulares->plano_informe = $request->plano_informe;
            $Granulares->version = $request->version;
            $Granulares->calzada = $request->calzada;
            $Granulares->actividad_pavimento = $request->actividad_pavimento;
            $Granulares->actividad_terraplen = $request->actividad_terraplen;
            $Granulares->actividad_relleno = $request->actividad_relleno;
            $Granulares->especifique_estrutura = $request->especifique_estrutura;
            $Granulares->unidad_funcional_id = $request->unidad_funcional_id;
            $Granulares->abcisado_de = $request->abcisado_de;
            $Granulares->abcisado_a = $request->abcisado_a;
            $Granulares->latitud = $request->latitud;
            $Granulares->longitud = $request->longitud;

            if(Auth::user()->id){
                $Granulares->users_id = Auth::user()->id;
            }else{
                $Granulares->users_id = $request->users_id;
            }
            $Granulares->save();
            return response()->json($Granulares);
        }
    }
    public function show($id)
    {
        return response()->json(GranularesModel::findOrFail($id));
    }


    public function edit($id)
    {
        return view("Granulares.index", []);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), $this->rules);
        if ($validator->fails()) {
            return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
        } else {
            $Granulares = GranularesModel::findOrFail($id);

            $Granulares->proyecto = $request->proyecto;
            $Granulares->plano_informe = $request->plano_informe;
            $Granulares->version = $request->version;
            $Granulares->calzada = $request->calzada;
            $Granulares->actividad_pavimento = $request->actividad_pavimento;
            $Granulares->actividad_terraplen = $request->actividad_terraplen;
            $Granulares->actividad_relleno = $request->actividad_relleno;
            $Granulares->especifique_estrutura = $request->especifique_estrutura;
            $Granulares->users_id = $request->users_id;
            $Granulares->unidad_funcional_id = $request->unidad_funcional_id;
            $Granulares->abcisado_de = $request->abcisado_de;
            $Granulares->abcisado_a = $request->abcisado_a;
            $Granulares->latitud = $request->latitud;
            $Granulares->longitud = $request->longitud;


            $Granulares->save();
            return response()->json($Granulares);
        }
    }

    public function destroy($id)
    {
        $Granulares = GranularesModel::findOrFail($id);
        $Granulares->delete();
        return response()->json($Granulares);
    }
    public function reporte_final(Request $request)
    {
        $Concreto = GranularesModel::findOrFail($request->id);
        $Concreto->estado_tramite_id=2;
        $Concreto->save();
        return response()->json($Concreto);
    }
}
