<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;
use Carbon\Carbon;
use App\GranularesDetalleModel;
use App\TipoCapaModel;
use View;
use App\User;

class GranularesDetalleController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    protected $rules =
    [
        // 'id' => 'required|min:2|max:255',
        //'item' => 'required|min:2|max:255',
        'tipo_capa_id' => 'required|min:2|max:255',
        'si_aplica' => 'required|min:2|max:255',
        'abcisado_inicial' => 'required|min:2|max:255',
        'abcisado_final' => 'required|min:2|max:255',
        'si_supervidsado' => 'required|min:2|max:255',
        'fecha' => 'required|min:2|max:255',
        'observaciones' => 'required|min:2|max:255',
        'granulares_id' => 'required|min:2|max:255',

    ];

    //public function index(){
    //return view('GranularesDetalle.index', [] );
    //}
    public function index(Request $request)
    {
        $consulta_data = $request->get("consulta_data");
        if ($consulta_data == "") {
            $data = GranularesDetalleModel::with('registro_fotografico_all')->paginate(20);
        } else {
            $data = GranularesDetalleModel::where("id", 1)
                ->orwhere("id", "like", "%" . $consulta_data . "%")
                ->orwhere("item", "like", "%" . $consulta_data . "%")
                ->orwhere("tipo_capa_id", "like", "%" . $consulta_data . "%")
                ->orwhere("si_aplica", "like", "%" . $consulta_data . "%")
                ->orwhere("abcisado_inicial", "like", "%" . $consulta_data . "%")
                ->orwhere("abcisado_final", "like", "%" . $consulta_data . "%")
                ->orwhere("si_supervidsado", "like", "%" . $consulta_data . "%")
                ->orwhere("fecha", "like", "%" . $consulta_data . "%")
                ->orwhere("observaciones", "like", "%" . $consulta_data . "%")
                ->orwhere("granulares_id", "like", "%" . $consulta_data . "%")

                ->paginate(20);
        }

        return response()->json($data);
    }

    public function create()
    {
        $data_foraneos = [
            "tipo_capa_id" => GranularesDetalleModel::select("id", "id as nombre", "id as text")->get(),
            "granulares_id" => GranularesDetalleModel::select("id", "id as nombre", "id as text")->get(),

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


            $GranularesDetalle = new GranularesDetalleModel();
            $GranularesDetalle->item = $request->item;
            $GranularesDetalle->tipo_capa_id = $request->tipo_capa_id;
            $GranularesDetalle->si_aplica = $request->si_aplica;
            $GranularesDetalle->abcisado_inicial = $request->abcisado_inicial;
            $GranularesDetalle->abcisado_final = $request->abcisado_final;
            $GranularesDetalle->si_supervidsado = $request->si_supervidsado;
            $GranularesDetalle->fecha = $request->fecha;
            $GranularesDetalle->observaciones = $request->observaciones;
            $GranularesDetalle->granulares_id = $request->granulares_id;

            $GranularesDetalle->save();
            return response()->json($GranularesDetalle);
        }
    }
    public function nueva_capa($granulares_id){

        $capa = '[
            {
                "item": " <b>Material</b>",
                "si_subrasante": "0"
            },{
                "item": "<b>Topografía</b>   Control topográfico por parte del contratista",
                "si_subrasante": "0"
            },{
                "item": " <b>Ensayos</b>  (Densidades) Porcentaje de compactación",
                "si_subrasante": "0"
            },{
                "item": "<b>Prueba de carga</b>  Volqueta cargada",
                "si_subrasante": "0"
            },{
                "item": "<b>Imprimación</b>",
                "si_subrasante": "0"
            },{
              "item": "<b>Riego de liga</b>",
              "si_subrasante": "0"
            }
         ]';

         $tipocapa = new TipoCapaModel();
            $tipocapa->nombre = 'Capa N°';
            $tipocapa->material = ' ';
            $tipocapa->capa_n = ' ';
            $tipocapa->granulares_id = $granulares_id;
            $tipocapa->si_subrasante=0;
            $tipocapa->save();
            $tipocapa_id = $tipocapa->id;

            $resultado = json_decode($capa, true);

            foreach ($resultado as $key => $value) {

                $GranularesDetalles = new GranularesDetalleModel();
                $GranularesDetalles->item = $value['item'];

                $GranularesDetalles->tipo_capa_id = $tipocapa_id;
               // $GranularesDetalles->titulo = $value['titulo'];
                $GranularesDetalles->granulares_id = $granulares_id;
                $GranularesDetalles->si_aplica = '3';
                //$GranularesDetalles->si_cumple = '3';
                $GranularesDetalles->fecha = Carbon::now()->format('Y-m-d');
                $GranularesDetalles->save();
            }


    }
    public function consulta_data($granulares_id)
    {
        $data_count = GranularesDetalleModel::where('granulares_id', $granulares_id)->count();

        if ($data_count == 0) {

            $string = '[
              {
                "item": "Ensayo del cono dinámico (PDC)",
                "tipo_capa_id": "1",
                "si_subrasante":1
              },{
                "item": "Mejoramiento de subrasante",
                "tipo_capa_id": "1",
                "si_subrasante":0
              }]';



            $tipocapa = new TipoCapaModel();
            $tipocapa->nombre = ' ';
            $tipocapa->material = ' ';
            $tipocapa->capa_n = ' ';
            $tipocapa->si_subrasante = 1;
            $tipocapa->granulares_id = $granulares_id;
            $tipocapa->save();
            $tipocapa_id = $tipocapa->id;

            $resultado = json_decode($string, true);
            foreach ($resultado as $key => $value) {

                $GranularesDetalles = new GranularesDetalleModel();
                $GranularesDetalles->item = $value['item'];
                $GranularesDetalles->tipo_capa_id = $tipocapa_id;
                //$GranularesDetalles->titulo = $value['titulo'];
                $GranularesDetalles->granulares_id = $granulares_id;
                $GranularesDetalles->si_aplica = '3';
                $GranularesDetalles->si_supervisado = '3';
                $GranularesDetalles->fecha = Carbon::now()->format('Y-m-d');
                $GranularesDetalles->save();
            }
        }

        //$data = GranularesDetalleModel::where('granulares_id', $granulares_id)
            //->with('concreto_registro_fotografico_all')
            //->get();
            $tipocapa = TipoCapaModel::where('granulares_id', $granulares_id)->with('granulares_detalle_all.registro_fotografico_all')->get();

        return response()->json($tipocapa);
    }
    public function show($id)
    {
        return response()->json(GranularesDetalleModel::findOrFail($id));
    }


    public function edit($id)
    {
        return view("GranularesDetalle.index", []);
    }

    public function update(Request $request, $id)
    {

            $GranularesDetalle = GranularesDetalleModel::findOrFail($id);

            //$GranularesDetalle->item = $request->item;
            //$GranularesDetalle->tipo_capa_id = $request->tipo_capa_id;
            $GranularesDetalle->si_aplica = $request->si_aplica;
            $GranularesDetalle->abcisado_inicial = $request->abcisado_inicial;
            $GranularesDetalle->abcisado_final = $request->abcisado_final;
            $GranularesDetalle->si_supervisado = $request->si_supervisado;
            $GranularesDetalle->fecha = $request->fecha;
            if($request->observaciones!=''){
                $GranularesDetalle->observaciones = $request->observaciones;
            }
            //$GranularesDetalle->granulares_id = $request->granulares_id;


            $GranularesDetalle->save();
            return response()->json($GranularesDetalle);

    }

    public function destroy($id)
    {
        $GranularesDetalle = GranularesDetalleModel::findOrFail($id);
        $GranularesDetalle->delete();
        return response()->json($GranularesDetalle);
    }
}
