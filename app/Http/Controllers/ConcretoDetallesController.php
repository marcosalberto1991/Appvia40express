<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
//use Illuminate\Http\Request;
use Validator;
use Response;
use App\ConcretoDetallesModel;
//use Illuminate\Support\Facades\Request;
use Illuminate\Http\Request;
use Carbon\Carbon;

use View;
use App\User;
class ConcretoDetallesController extends Controller {
	public function __construct(){
		$this->middleware('auth');
	}

	protected $rules =
	[
       // 'id' => 'required|min:2|max:255',
        //'titulo' => 'required|min:2|max:255',
        'si_aplica' => 'required|min:1|max:255',
        'si_cumple' => 'required|min:1|max:255',
        'fecha' => 'required|min:2|max:255',
        'observaciones' => '',
        'registro_fotografico' => '',
        //'concreto_id' => 'required|min:1|max:255',

	];

	//public function index(){
		//return view('ConcretoDetalles.index', [] );
  //}
  public function index(Request $request){
    $consulta_data=$request->get("consulta_data");
    if($consulta_data==""){
      $data=ConcretoDetallesModel::paginate(20);
    }else{
      $data=ConcretoDetallesModel::where("id",1)
      ->orwhere("id","like","%". $consulta_data."%")
        ->orwhere("titulo","like","%". $consulta_data."%")
        ->orwhere("si_aplica","like","%". $consulta_data."%")
        ->orwhere("si_cumple","like","%". $consulta_data."%")
        ->orwhere("fecha","like","%". $consulta_data."%")
        ->orwhere("observaciones","like","%". $consulta_data."%")
        ->orwhere("registro_fotografico","like","%". $consulta_data."%")
        ->orwhere("concreto_id","like","%". $consulta_data."%")

      ->paginate(20);
    }

    return response()->json($data);
  }

    public function create(){
        $data_foraneos = [
            "concreto_id" => ConcretoDetallesModel::select("id","id as nombre","id as text")->get(),

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

        $ConcretoDetalles = new ConcretoDetallesModel();
         $ConcretoDetalles->titulo=$request->titulo;
				 $ConcretoDetalles->si_aplica=$request->si_aplica;
				 $ConcretoDetalles->si_cumple=$request->si_cumple;
				 $ConcretoDetalles->fecha=$request->fecha;
				 $ConcretoDetalles->observaciones=$request->observaciones;
				 $ConcretoDetalles->registro_fotografico=$request->registro_fotografico;
				 $ConcretoDetalles->concreto_id=$request->concreto_id;

        $ConcretoDetalles->save();
        return response()->json($ConcretoDetalles);
      }
    }
    public function show($id){
        return response()->json(ConcretoDetallesModel::findOrFail($id));
    }
    Public function consulta_data($concreto_id){
      $data_count=ConcretoDetallesModel::where('concreto_id',$concreto_id)->count();

      if($data_count==0){

        $string = '[
            {
              "titulo": "<b>Localización y replanteo</b>  Ubicación de elemento cumple con planos de diseño",
              "columna": "1"
            },{
              "titulo": "<b>Verticalidad</b>  Elemento cumple con planos y diseños",
              "columna": "1"
            },{
                "titulo": " <b>Solado</b> Concreto de limpieza y nivelación",
                "columna": "1"
            },{
                "titulo": "<b>Desmoldante</b> Paredes de Formaleta cuentan con desmoldante que permitira en desencofre de la estructura",
                "columna": "1"
            },{
                "titulo": " <b>Muestras de concreto</b> - Toma de cilindros de concreto",
                "columna": "1"
            },{
                "titulo": "<b>Temperatura</b> - Temperatura máxima del concreto no mayor a 32 C.",
                "columna": "1"
            },{
                "titulo": "<b>Asentamiento</b> - Asentamiento dentro del rango de diseño.",
                "columna": "1"
            },{
                "titulo": "<b>Seguridad</b> Ubicación de formaleta segura que permita el trabajo de descarga del concreto sin inconvenientes.",
                "columna": "1"
            },{
                "titulo": "<b>Curado</b>  aplicación de productos para el curado del concreto (indicar en observaciones el método utilizado)",
                "columna": "2"
            },{
                "titulo": "<b>Acabados</b>  Elemento cumple con buenos acabados",
                "columna": "2"
            },{
                "titulo": "<b>Juntas</b> Elemento con juntas de dilatación o construcción",
                "columna": "2"
            },{
                "titulo": "<b>Fisuras</b> Presencia de fisuras después de la fundida",
                "columna": "2"
            }
        ]';

        $resultado = json_decode($string, true);
        foreach ($resultado as $key => $value) {

            $ConcretoDetalles = new ConcretoDetallesModel();
            $ConcretoDetalles->columna=$value['columna'];
            $ConcretoDetalles->titulo=$value['titulo'];
            $ConcretoDetalles->si_aplica='3';
            $ConcretoDetalles->si_cumple='3';
            $ConcretoDetalles->fecha=Carbon::now()->toDateTimeString();
            $ConcretoDetalles->observaciones=' ';
            $ConcretoDetalles->registro_fotografico='sinfoto';
            $ConcretoDetalles->concreto_id=$concreto_id;
            $ConcretoDetalles->save();

        }

      }
      $data=ConcretoDetallesModel::where('concreto_id',$concreto_id)->with('concreto_registro_fotografico_all')->get();

      return response()->json($data);



    }


    public function edit($id){
        return view("ConcretoDetalles.index", [] );

    }

    public function update(Request $request, $id){
		$validator = Validator::make($request->all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {
			$ConcretoDetalles = ConcretoDetallesModel::findOrFail($id);

            $file2 = $request->file('registro_fotografico');// Input::file('registro_fotografico');
            if (isset($file2)) {
              $codigo='str_random(5)';
              $nombre_original=$file2->getClientOriginalName();
              $nombres = $nombre_original.$codigo. '.' . $file2->getClientOriginalExtension();
              \Storage::disk('Concreto')->put($nombres, \File::get($file2));
              $ConcretoDetalles->registro_fotografico=$nombres;

            }

			//$ConcretoDetalles->titulo=$request->titulo;
            $ConcretoDetalles->si_aplica=$request->si_aplica;
            $ConcretoDetalles->si_cumple=$request->si_cumple;
            $ConcretoDetalles->fecha=$request->fecha;
            $ConcretoDetalles->observaciones=$request->observaciones;
            //$ConcretoDetalles->concreto_id=$request->concreto_id;


			$ConcretoDetalles->save();

            //$data=ConcretoDetallesModel::where('concreto_id',$request->concreto_id)->with('concreto_registro_fotografico_all')->get();

			return response()->json($ConcretoDetalles);
		}
	}

	public function destroy($id){
		$ConcretoDetalles = ConcretoDetallesModel::findOrFail($id);
		$ConcretoDetalles->delete();
		return response()->json($ConcretoDetalles);
	}

}


