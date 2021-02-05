<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;
use App\Auditoria_SAMModel;
use View;
use App\HasRoles;
use App\Roles;
use App\User;
use Spatie\Permission\Namecontrollers\Role;
use Spatie\Permission\Namecontrollers\Permission;

class Auditoria_SAMController extends Controller {
	public function __construct(){
		$this->middleware('auth');
	}

	protected $rules =
	[
		'id' => 'required|min:1|max:99999999',
	   			'user_type' => 'required|min:2|max:255|regex:/^([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-])+((\s*)+([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-]*)*)+$/',
	   			'user_id' => 'required|min:1|max:99999999',
	   			'event' => 'required|min:2|max:255|regex:/^([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-])+((\s*)+([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-]*)*)+$/',
	   			'auditable_id' => 'required|min:1|max:99999999',
	   			'auditable_type' => 'required|min:2|max:255|regex:/^([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-])+((\s*)+([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-]*)*)+$/',
	   			'ip_address' => 'required|min:2|max:255|regex:/^([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-])+((\s*)+([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-]*)*)+$/',
	   			'user_agent' => 'required|min:2|max:255|regex:/^([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-])+((\s*)+([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-]*)*)+$/',
	   			'tags' => 'required|min:2|max:255|regex:/^([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-])+((\s*)+([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-]*)*)+$/',

	];

	public function index(){
		return view('Auditoria_SAM.index', [] );
  }
  public function consulta(Request $request){
    $consulta_data=$request->post("consulta_data");
	$usuario_id = $request->post("usuario_id");
	$modelo_id = $request->post("modelo_id");
	$data_usuario_id=[];
	$data_modelo_id=[];
	foreach($usuario_id as $key => $dato){
		$data_usuario_id[$key] = $dato['id'];
	}
	foreach($modelo_id as $keys => $datos){
		$data_modelo_id[$keys] = $datos['text'];
	}
	//var_dump($data);exit();




	if($consulta_data=='' && count($data_usuario_id)==0 && count($data_modelo_id)==0 ){
      $data=Auditoria_SAMModel::with('user_id')->orderBy('id','DESC')->paginate(20);
    }else{


	  $data=Auditoria_SAMModel::with('user_id')
	  	->whereIn('user_id',$data_usuario_id)->whereIn('auditable_type',$data_modelo_id)
		->orwhere("new_values","like","%". $consulta_data."%")
		->orwhere("old_values","like","%". $consulta_data."%")
		->orwhere("event","like","%". $consulta_data."%")
		->orwhere("auditable_type","like","%". $consulta_data."%")

		->orderBy('id','DESC')
		->paginate(20);
    }

    return response()->json($data);
  }
	public function create(){
    $data_foraneos = [
      //"user_id" => Auditoria_SAMModel::select("id","id as nombre","id as text")->get(),
       // "auditable_id" => Auditoria_SAMModel::select("id","id as nombre","id as text")->get(),
    	"usuario_id" => User::select("id","email as text")->get(),
		//"auditable_id" => Auditoria_SAMModel::select("id","id as nombre","id as text")->get(),
		"modelo_id" => Auditoria_SAMModel::select("id as id", "auditable_type as text")->groupBy('auditable_type')->get(),


      //"departamento_id" => DepartamentoModel::select("id_departamento as id","departamento as text")->get(),
		];
		return response()->json($data_foraneos);

  }

	public function store(Request $request){
		$validator = Validator::make(Input::all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {
			$Auditoria_SAM = new Auditoria_SAMModel();

			 $Auditoria_SAM->user_type=$request->user_type;
				 $Auditoria_SAM->user_id=$request->user_id;
				 $Auditoria_SAM->event=$request->event;
				 $Auditoria_SAM->auditable_id=$request->auditable_id;
				 $Auditoria_SAM->auditable_type=$request->auditable_type;
				 $Auditoria_SAM->old_values=$request->old_values;
				 $Auditoria_SAM->new_values=$request->new_values;
				 $Auditoria_SAM->url=$request->url;
				 $Auditoria_SAM->ip_address=$request->ip_address;
				 $Auditoria_SAM->user_agent=$request->user_agent;
				 $Auditoria_SAM->tags=$request->tags;
				 $Auditoria_SAM->created_at=$request->created_at;
				 $Auditoria_SAM->updated_at=$request->updated_at;

			$Auditoria_SAM->save();
			return response()->json($Auditoria_SAM);
		}
	}
  public function show($id){
        return response()->json(Auditoria_SAMModel::findOrFail($id));
    }


  public function edit($id){}

    public function update(Request $request, $id){
		$validator = Validator::make(Input::all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {
			$Auditoria_SAM = Auditoria_SAMModel::findOrFail($id);

			 $Auditoria_SAM->user_type=$request->user_type;
				 $Auditoria_SAM->user_id=$request->user_id;
				 $Auditoria_SAM->event=$request->event;
				 $Auditoria_SAM->auditable_id=$request->auditable_id;
				 $Auditoria_SAM->auditable_type=$request->auditable_type;
				 $Auditoria_SAM->old_values=$request->old_values;
				 $Auditoria_SAM->new_values=$request->new_values;
				 $Auditoria_SAM->url=$request->url;
				 $Auditoria_SAM->ip_address=$request->ip_address;
				 $Auditoria_SAM->user_agent=$request->user_agent;
				 $Auditoria_SAM->tags=$request->tags;
				 $Auditoria_SAM->created_at=$request->created_at;
				 $Auditoria_SAM->updated_at=$request->updated_at;


			$Auditoria_SAM->save();
			return response()->json($Auditoria_SAM);
		}
	}

	public function destroy($id){
		$Auditoria_SAM = Auditoria_SAMModel::findOrFail($id);
		$Auditoria_SAM->delete();
		return response()->json($Auditoria_SAM);
	}

}


