<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;
use App\TipoDocumentoModel;
use App\PerfilSaludModel;
use View;
use App\User;
class PerfilSaludController extends Controller {
	public function __construct(){
		$this->middleware('auth');
	}

	protected $rules =
	[
          'tipo_documento_id' => 'required|min:1|max:255',
          'cedula' => 'required|min:2|max:255',
	   			'nombre' => 'required|min:2|max:255',
	   			'apellido' => 'required|min:2|max:255',
	   			'sexo' => 'required|min:1|max:255',
	   			'area' => 'required|min:1|max:255',
	   			'cargo' => 'required|min:2|max:255',
	   			'fecha_nacimiento' => 'required|min:2|max:255',

	];

	//public function index(){
		//return view('PerfilSalud.index', [] );
  //}
  public function index(Request $request){
    $consulta_data=$request->get("consulta_data");
    if($consulta_data==""){
      $data=PerfilSaludModel::paginate(20);
    }else{
      $data=PerfilSaludModel::where("id","like","%". $consulta_data."%")
        ->orwhere("tipo_documento_id","like","%". $consulta_data."%")
        ->orwhere("cedula","like","%". $consulta_data."%")
        ->orwhere("nombre","like","%". $consulta_data."%")
        ->orwhere("apellido","like","%". $consulta_data."%")
        ->orwhere("sexo","like","%". $consulta_data."%")
        ->orwhere("area","like","%". $consulta_data."%")
        ->orwhere("cargo","like","%". $consulta_data."%")
        ->orwhere("fecha_nacimiento","like","%". $consulta_data."%")

      ->paginate(20);
    }

    return response()->json($data);
  }

    public function create(){
        $data_foraneos = [
            "tipo_documento_id" => TipoDocumentoModel::select("id","id as nombre","nombre as text")->get(),

            //"departamento_id" => DepartamentoModel::select("id_departamento as id","departamento as text")->get(),
            ];
            return response()->json($data_foraneos);

    }

    public function store(Request $request){
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

        $PerfilSalud = new PerfilSaludModel();
        $prueba_producto=$request->all();
         $PerfilSalud->tipo_documento_id=$request->tipo_documento_id;
				 $PerfilSalud->cedula=$request->cedula;
				 $PerfilSalud->nombre=$request->nombre;
				 $PerfilSalud->apellido=$request->apellido;
				 $PerfilSalud->sexo=$request->sexo;
				 $PerfilSalud->area=$request->area;
				 $PerfilSalud->cargo=$request->cargo;
				 $PerfilSalud->fecha_nacimiento=$request->fecha_nacimiento;

        $PerfilSalud->save();
        return response()->json($PerfilSalud);
      }
    }
    public function show($id){
        return response()->json(PerfilSaludModel::findOrFail($id));
    }


    public function edit($id){
        return view("PerfilSalud.index", [] );

    }

    public function update(Request $request, $id){
		$validator = Validator::make($request->all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {
			$PerfilSalud = PerfilSaludModel::findOrFail($id);

			 $PerfilSalud->tipo_documento_id=$request->tipo_documento_id;
				 $PerfilSalud->cedula=$request->cedula;
				 $PerfilSalud->nombre=$request->nombre;
				 $PerfilSalud->apellido=$request->apellido;
				 $PerfilSalud->sexo=$request->sexo;
				 $PerfilSalud->area=$request->area;
				 $PerfilSalud->cargo=$request->cargo;
				 $PerfilSalud->fecha_nacimiento=$request->fecha_nacimiento;


			$PerfilSalud->save();
			return response()->json($PerfilSalud);
		}
	}

	public function destroy($id){
		$PerfilSalud = PerfilSaludModel::findOrFail($id);
		$PerfilSalud->delete();
		return response()->json($PerfilSalud);
	}

}


