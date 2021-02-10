<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;
use Auth;
use App\FresadoModel;
use View;
use App\User;

class FresadoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    protected $rules =
    [
       // 'id' => 'required|min:2|max:255',
        'unidad_funcional_id' => 'required|min:1|max:255',
        'calzada' => 'required|min:2|max:255',
        'longitud' => 'required|min:2|max:255',
        'plano_codigo' => 'required|min:2|max:255',
        'version' => 'required|min:2|max:255',
        'ancho_uno' => 'required|min:2|max:255',
        'ancho_dos' => 'required|min:2|max:255',
        'espesor_uno' => 'required|min:2|max:255',
        'espesor_dos' => 'required|min:2|max:255',
        'estado_tramite_id' => 'required|min:1|max:255',
        'eje' => 'required|min:1|max:45',
        'latitud' => 'required|min:1|max:45',
        'longitud' => 'required|min:1|max:45',

    ];

    //public function index(){
    //return view('Fresado.index', [] );
    //}
    public function index(Request $request)
    {
        $consulta_data = $request->get("consulta_data");
        if ($consulta_data == "") {
            if(Auth::user()->hasRole('Operado')){
                $data = FresadoModel::where('estado_tramite_id',1)->where('users_id',Auth::user()->id)->with('users_id','estado_tramite_id','unidad_funcional_id')->paginate(20);
            }
            if(Auth::user()->hasRole('Tecnico')){
                $data = FresadoModel::with('users_id','estado_tramite_id','unidad_funcional_id')->paginate(20);
            }
            if(Auth::user()->hasRole('Gerente')){
                $data = FresadoModel::with('users_id','estado_tramite_id','unidad_funcional_id')->paginate(20);
            }
            if(Auth::user()->hasRole('Administrador')){
                $data = FresadoModel::with('users_id','estado_tramite_id','unidad_funcional_id')->paginate(20);
            }
        } else {
            $data = FresadoModel::where("id", 1)
                ->orwhere("id", "like", "%" . $consulta_data . "%")
                ->orwhere("unidad_funcional_id", "like", "%" . $consulta_data . "%")
                ->orwhere("calzada", "like", "%" . $consulta_data . "%")
                ->orwhere("longitud", "like", "%" . $consulta_data . "%")
                ->orwhere("plano_codigo", "like", "%" . $consulta_data . "%")
                ->orwhere("version", "like", "%" . $consulta_data . "%")
                ->orwhere("ancho_uno", "like", "%" . $consulta_data . "%")
                ->orwhere("ancho_dos", "like", "%" . $consulta_data . "%")
                ->orwhere("espesor_uno", "like", "%" . $consulta_data . "%")
                ->orwhere("espesor_dos", "like", "%" . $consulta_data . "%")
                ->orwhere("estado_tramite_id", "like", "%" . $consulta_data . "%")

                ->paginate(20);
        }

        return response()->json($data);
    }

    public function create()
    {
        $data_foraneos = [
            "unidad_funcional_id" => FresadoModel::select("id", "id as nombre", "id as text")->get(),
            "estado_tramite_id" => FresadoModel::select("id", "id as nombre", "id as text")->get(),

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

            $Fresado = new FresadoModel();
            $Fresado->unidad_funcional_id = $request->unidad_funcional_id;
            $Fresado->calzada = $request->calzada;
            $Fresado->users_id = Auth::user()->id;
            $Fresado->longitud = $request->longitud;
            $Fresado->plano_codigo = $request->plano_codigo;
            $Fresado->version = $request->version;
            $Fresado->ancho_uno = $request->ancho_uno;
            $Fresado->ancho_dos = $request->ancho_dos;
            $Fresado->espesor_uno = $request->espesor_uno;
            $Fresado->espesor_dos = $request->espesor_dos;
            $Fresado->estado_tramite_id = $request->estado_tramite_id;
            $Fresado->latitud = $request->latitud;
            $Fresado->longitud_x = $request->longitud_x;
            $Fresado->eje = $request->eje;

            $Fresado->save();
            return response()->json($Fresado);
        }
    }
    public function show($id)
    {
        return response()->json(FresadoModel::findOrFail($id));
    }


    public function edit($id)
    {
        return view("Fresado.index", []);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), $this->rules);
        if ($validator->fails()) {
            return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
        } else {
            $Fresado = FresadoModel::findOrFail($id);

            $Fresado->unidad_funcional_id = $request->unidad_funcional_id;
            $Fresado->calzada = $request->calzada;
            $Fresado->longitud = $request->longitud;
            $Fresado->plano_codigo = $request->plano_codigo;
            $Fresado->version = $request->version;
            $Fresado->ancho_uno = $request->ancho_uno;
            $Fresado->ancho_dos = $request->ancho_dos;
            $Fresado->espesor_uno = $request->espesor_uno;
            $Fresado->espesor_dos = $request->espesor_dos;
            $Fresado->estado_tramite_id = $request->estado_tramite_id;
            $Fresado->latitud = $request->latitud;
            $Fresado->longitud_x = $request->longitud_x;
            $Fresado->eje = $request->eje;



            $Fresado->save();
            return response()->json($Fresado);
        }
    }
    public function reporte_final(Request $request){
        $Fresado = FresadoModel::findOrFail($request->id);
        $Fresado->estado_tramite_id = 2;
        $Fresado->save();

        return response()->json($Fresado);

    }

    public function destroy($id)
    {
        $Fresado = FresadoModel::findOrFail($id);
        $Fresado->delete();
        return response()->json($Fresado);
    }
}
