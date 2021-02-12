<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;
use App\PerfilSaludEncuestaSaludModel;
use App\Encuesta_SaludModel;
use App\Perfil_SaludModel;
use Carbon\Carbon;
use View;
use DB;
use App\User;
use App\Exports\UsersExport;
use App\Exports\InvoicesExport;
//Use Arr;

use Maatwebsite\Excel\Facades\Excel;
//use Excel;

use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromCollection;
//use Maatwebsite\Excel\Facades\Excel;
class Encuesta_SaludController extends Controller
{
    public function __construct()
    {
        //$this->middleware('auth');
    }

    protected $rules =
    [
        'id' => 'required|min:2|max:255',
        'nombre' => 'required|min:2|max:255',

    ];


    public function index(Request $request)
    {
        $consulta_data = $request->get("consulta_data");
        if ($consulta_data == "") {
            $data = Encuesta_SaludModel::paginate(20);
        } else {
            $data = Encuesta_SaludModel::where("id", 1)
                ->orwhere("id", "like", "%" . $consulta_data . "%")
                ->orwhere("nombre", "like", "%" . $consulta_data . "%")

                ->paginate(20);
        }

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


            $Encuesta_Salud = new Encuesta_SaludModel();
            $prueba_producto = $request->all();
            $Encuesta_Salud->nombre = $request->nombre;

            $Encuesta_Salud->save();
            return response()->json($Encuesta_Salud);
        }
    }
    public function show($id)
    {
        return response()->json(Encuesta_SaludModel::findOrFail($id));
    }


    public function edit($id)
    {
        return view("Encuesta_Salud.index", []);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), $this->rules);
        if ($validator->fails()) {
            return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
        } else {
            $Encuesta_Salud = Encuesta_SaludModel::findOrFail($id);

            $Encuesta_Salud->nombre = $request->nombre;


            $Encuesta_Salud->save();
            return response()->json($Encuesta_Salud);
        }
    }

    public function destroy($id)
    {
        $Encuesta_Salud = Encuesta_SaludModel::findOrFail($id);
        $Encuesta_Salud->delete();
        return response()->json($Encuesta_Salud);
    }
    public function buscar_cedula(Request $request)
    {
        $preguntas=null;
        $perfil = Perfil_SaludModel::where('cedula', $request->cedula)->first();
        if ($perfil) {
            $fecha = PerfilSaludEncuestaSaludModel::where('perfil_salud_id', $perfil->id)->where('fecha', '<=', Carbon::now()->format('Y-m-d'))->orderby('fecha','DESC')->first();
            if ($fecha) {
                $fecha = $fecha->toarray();
                $fecha_anterio = $fecha['fecha'];
                $preguntas = Encuesta_SaludModel::where('is_titulo', 0)->where('is_activo', 1)->get()->toarray();
                foreach ($preguntas as $key => $value) {
                    $respuesta = PerfilSaludEncuestaSaludModel::where('perfil_salud_id', $perfil->id)->where('fecha', $fecha_anterio)->where('encuesta_salud_id', $value['id'])->pluck('respuesta')->first();
                    $preguntas[$key]['respuesta'] = $respuesta;
                }
            }
        }
        if($preguntas==null){
            $preguntas= Encuesta_SaludModel::where('is_titulo', 0)->where('is_activo', 1)->get();
        }
        if($perfil==null || $perfil==''){
            $perfil='0';
        }
        $data = [
            "perfil" => $perfil,
            "preguntas" => $preguntas,
        ];
        return response()->json($data);
    }
    public function obtener_preguntas()
    {
        $data = Encuesta_SaludModel::where('is_titulo', 0)->where('is_activo', 1)->get();
        return response()->json($data);
    }
    public function enviar_respuesta(Request $request)
    {

        $dataPersona = $request->cedula;
        $dataPersona['id'];
        $datas = $request->lista_preguntas;
        //PerfilSaludEncuestaSaludModel::
        foreach ($datas as $key => $value) {

            $data = new PerfilSaludEncuestaSaludModel();
            $data->perfil_salud_id = $dataPersona['id'];
            $data->respuesta = $value['respuesta'];
            $data->encuesta_salud_id = $value['id'];
            $data->fecha = Carbon::now()->format('Y-m-d');
            //$data->fecha='2021-02-11';
            $data->save();
        }
        $data = true;
        return response()->json($data);
    }
    public function Exporta_Excel()
    {

        //$users = DB::table('Users')->select('id','name', 'email')->get();
        //var_dump($users);
        //        return Excel::download(new UsersExport, 'users.xlsx');
        return Excel::download(new InvoicesExport, 'invoices.xlsx');
    }
}
