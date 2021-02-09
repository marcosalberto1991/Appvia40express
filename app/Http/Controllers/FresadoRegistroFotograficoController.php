<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;

use App\FresadoRegistroFotograficoModel;
use View;
use App\User;
class FresadoRegistroFotograficoController extends Controller {
	public function __construct(){
		$this->middleware('auth');
	}

	protected $rules =
	[

        'nombre' => 'required|min:2',

	   	'fresado_detalle_id' => 'required|min:1|max:255',

	];

	//public function index(){
		//return view('FresadoRegistroFotografico.index', [] );
  //}
  public function index(Request $request){
    $consulta_data=$request->get("consulta_data");
    if($consulta_data==""){
      $data=FresadoRegistroFotograficoModel::paginate(20);
    }else{
      $data=FresadoRegistroFotograficoModel::where("id",1)
      ->orwhere("id","like","%". $consulta_data."%")
        ->orwhere("nombre","like","%". $consulta_data."%")
        ->orwhere("created_at","like","%". $consulta_data."%")
        ->orwhere("updated_at","like","%". $consulta_data."%")
        ->orwhere("fresado_detalle_id","like","%". $consulta_data."%")

      ->paginate(20);
    }

    return response()->json($data);
  }

    public function create(){
        $data_foraneos = [
            "fresado_detalle_id" => FresadoRegistroFotograficoModel::select("id","id as nombre","id as text")->get(),

            //"departamento_id" => DepartamentoModel::select("id_departamento as id","departamento as text")->get(),
            ];
            return response()->json($data_foraneos);

    }

    public function store(Request $request){
      $validator = Validator::make($request->all(), $this->rules);
      if ($validator->fails()) {
        return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
      } else {



        $FresadoRegistroFotografico = new FresadoRegistroFotograficoModel();

        $file2 = $request->file('nombre');// Input::file('registro_fotografico');
        if (isset($file2)) {
            $file_id=$request->fresado_detalles_id;
            $codigo='ser';
            $nombre_original=$file2->getClientOriginalName();
            $nombres = $file_id.'-'.$nombre_original.$codigo. '.' . $file2->getClientOriginalExtension();
            \Storage::disk('Concreto')->put($nombres, \File::get($file2));
        }
        $FresadoRegistroFotografico->nombre=$nombres;
		$FresadoRegistroFotografico->fresado_detalle_id=$request->fresado_detalle_id;

        $FresadoRegistroFotografico->save();
        return response()->json($FresadoRegistroFotografico);
      }
    }
    public function show($id){
        return response()->json(FresadoRegistroFotograficoModel::findOrFail($id));
    }


    public function edit($id){
        return view("FresadoRegistroFotografico.index", [] );

    }

    public function update(Request $request, $id){
		$validator = Validator::make($request->all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {
			$FresadoRegistroFotografico = FresadoRegistroFotograficoModel::findOrFail($id);

			 $FresadoRegistroFotografico->nombre=$request->nombre;
				 $FresadoRegistroFotografico->created_at=$request->created_at;
				 $FresadoRegistroFotografico->updated_at=$request->updated_at;
				 $FresadoRegistroFotografico->fresado_detalle_id=$request->fresado_detalle_id;


			$FresadoRegistroFotografico->save();
			return response()->json($FresadoRegistroFotografico);
		}
	}

	public function destroy($id){
		$FresadoRegistroFotografico = FresadoRegistroFotograficoModel::findOrFail($id);
		$FresadoRegistroFotografico->delete();
		return response()->json($FresadoRegistroFotografico);
	}

}


