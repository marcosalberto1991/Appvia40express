<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;

use App\UnidadFuncionalModel;
use View;
use App\User;
class UnidadFuncionalController extends Controller {
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
		//return view('UnidadFuncional.index', [] );
  //}
  public function index(Request $request){
    $consulta_data=$request->get("consulta_data");
    if($consulta_data==""){
      $data=UnidadFuncionalModel::paginate(20);
    }else{
      $data=UnidadFuncionalModel::where("id",1)
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

        $UnidadFuncional = new UnidadFuncionalModel();
        $prueba_producto=$request->all();
         $UnidadFuncional->nombre=$request->nombre;
				 $UnidadFuncional->class=$request->class;
				
        $UnidadFuncional->save();
        return response()->json($UnidadFuncional);
      }
    }
    public function show($id){
        return response()->json(UnidadFuncionalModel::findOrFail($id));
    }


    public function edit($id){
        return view("UnidadFuncional.index", [] );

    }

    public function update(Request $request, $id){
		$validator = Validator::make($request->all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {
			$UnidadFuncional = UnidadFuncionalModel::findOrFail($id);

			 $UnidadFuncional->nombre=$request->nombre;
				 $UnidadFuncional->class=$request->class;
				

			$UnidadFuncional->save();
			return response()->json($UnidadFuncional);
		}
	}

	public function destroy($id){
		$UnidadFuncional = UnidadFuncionalModel::findOrFail($id);
		$UnidadFuncional->delete();
		return response()->json($UnidadFuncional);
	}

}


