<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;

use App\EstadoTramiteModel;
use View;
use App\User;
class EstadoTramiteController extends Controller {
	public function __construct(){
		$this->middleware('auth');
	}

	protected $rules =
	[
    'id' => 'required|min:2|max:255',
          'nombre' => 'required|min:2|max:255',
	   			'class' => 'required|min:2|max:255',
	   			
	];

	//public function index(){
		//return view('EstadoTramite.index', [] );
  //}
  public function index(Request $request){
    $consulta_data=$request->get("consulta_data");
    if($consulta_data==""){
      $data=EstadoTramiteModel::paginate(20);
    }else{
      $data=EstadoTramiteModel::where("id",1)
      ->orwhere("id","like","%". $consulta_data."%")
        ->orwhere("nombre","like","%". $consulta_data."%")
        ->orwhere("class","like","%". $consulta_data."%")
        
      ->paginate(20);
    }

    return response()->json($data);
  }

    public function create(){
        $data_foraneos = [
            
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

        $EstadoTramite = new EstadoTramiteModel();
        $prueba_producto=$request->all();
         $EstadoTramite->nombre=$request->nombre;
				 $EstadoTramite->class=$request->class;
				
        $EstadoTramite->save();
        return response()->json($EstadoTramite);
      }
    }
    public function show($id){
        return response()->json(EstadoTramiteModel::findOrFail($id));
    }


    public function edit($id){
        return view("EstadoTramite.index", [] );

    }

    public function update(Request $request, $id){
		$validator = Validator::make($request->all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {
			$EstadoTramite = EstadoTramiteModel::findOrFail($id);

			 $EstadoTramite->nombre=$request->nombre;
				 $EstadoTramite->class=$request->class;
				

			$EstadoTramite->save();
			return response()->json($EstadoTramite);
		}
	}

	public function destroy($id){
		$EstadoTramite = EstadoTramiteModel::findOrFail($id);
		$EstadoTramite->delete();
		return response()->json($EstadoTramite);
	}

}


