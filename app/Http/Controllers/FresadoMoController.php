<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;
use Auth;
use App\FresadoModel;
use App\FresadoDetalleModel;
use App\FresadoRegistroFotograficoModel;
use View;
use App\User;

class FresadoMoController extends Controller
{
    public function __construct()
    {
        //$this->middleware('auth');
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
    public function subir_informenv2(Request $request){
        $data_fresado= $request->fresado;

        foreach ($data_fresado as $key => $fe) {

            $Fresado=FresadoModel::where('users_id',$fe['users_id'] )->where('id_key',$fe['id_key'])->first();
            $FresadoCount=FresadoModel::where('users_id',$fe['users_id'])->where('id_key',$fe['id_key'])->count();
            if($FresadoCount>=1 ){
                $Fresado = FresadoModel::find($Fresado->id);
            }else{
                $Fresado = new FresadoModel();
            }
                $Fresado->unidad_funcional_id = $fe['unidad_funcional_id'];
                $Fresado->id_key = $fe['id_key'];
                $Fresado->calzada = $fe['calzada'];
                $Fresado->users_id = $fe['users_id'];
                $Fresado->longitud = $fe['longitud'];
                $Fresado->plano_codigo = $fe['plano_codigo'];
                $Fresado->version = $fe['version'];
                $Fresado->ancho_uno = $fe['ancho_uno'];
                $Fresado->ancho_dos = $fe['ancho_dos'];
                $Fresado->espesor_uno = $fe['espesor_uno'];
                $Fresado->espesor_dos = $fe['espesor_dos'];
                $Fresado->estado_tramite_id = $fe['estado_tramite_id'];
                $Fresado->estado_tramite_id = $fe['estado_tramite_id'];
                $Fresado->latitud = $fe['latitud'];
                $Fresado->longitud_x = $fe['longitud_x'];
                $Fresado->eje = $fe['eje'];
                $data=$Fresado->save();

        }

        return response()->json($data);


    }
    public function subir_informen_fresado_detallev2(Request $request){

        $data_fresadodetalle= $request->fresadodetalle;

        foreach ($data_fresadodetalle as $key => $fe) {

            $FresadoDetalle__=FresadoDetalleModel::where('fresado_id_key',$fe['fresado_id_key'])->first();
            $FresadoCount=FresadoDetalleModel::where('fresado_id_key',$fe['fresado_id_key'])->count();
            if($FresadoCount>=1 ){
                $FresadoDetalle = FresadoDetalleModel::find($FresadoDetalle__->id);
            }else{
                $FresadoDetalle = new FresadoDetalleModel();
            }
                $FresadoDetalle->fresado_id_key = $fe['fresado_id_key'];
                $FresadoDetalle->id_key = $fe['id_key'];
                $FresadoDetalle->actividad = $fe['actividad'];
                $FresadoDetalle->si_aplica = $fe['si_aplica'];
                $FresadoDetalle->si_cumple = $fe['si_cumple'];
                $FresadoDetalle->fecha = $fe['fecha'];
                $FresadoDetalle->observaciones = $fe['observaciones'];
                $FresadoDetalle->fresado_id = $FresadoDetalle__->fresado_id;
                $FresadoDetalle->columna = $fe['columna'];
                $FresadoDetalle->save();

        }


    }
    public function subir_informen(Request $request){
        $countitem=0;
        $data_fresado= $request->fresado;
        $data_fresadodetalle= $request->fresadodetalle;
        $data_fresadodetallefoto= $request->fresadodetallefoto;

        foreach ($data_fresadodetalle as $key => $fe) {
            $Fresado=FresadoDetalleModel::where('id_key',$fe['id_key'])->first();
            $Fresado_count=FresadoDetalleModel::where('id_key',$fe['id_key'])->count();

            if($Fresado_count==1 ){
                $FresadoDetalle = FresadoDetalleModel::find($Fresado->id);
                $FresadoDetalle->actividad = $fe['actividad'];
                $FresadoDetalle->calzada = $fe['si_aplica'];
                $FresadoDetalle->si_cumple = $fe['si_cumple'];
                $FresadoDetalle->fecha = $fe['fecha'];
                $FresadoDetalle->observaciones = $fe['observaciones'];
                $FresadoDetalle->save();
            }
        }
        foreach ($data_fresadodetallefoto as $key => $fe) {

            $FresadoFoto=FresadoRegistroFotograficoModel::where('id_key',$fe['id_key'])->first();
            $FresadoDetalleCount=FresadoRegistroFotograficoModel::where('id_key',$fe['id_key'])->count();
            if($FresadoDetalleCount==1 ){
                $FresadoFoto = FresadoRegistroFotograficoModel::find($FresadoFoto->id);
                $FresadoFoto->nombre = $fe['nombre'];
                $FresadoFoto->file = $fe['file'];
                $FresadoFoto->save();
            }
        }

        foreach ($data_fresado as $key => $fe) {

            $Fresado=FresadoModel::where('id_key',$fe['id_key'])->first();
            if(count($Fresado)==1 ){
                $Fresado = FresadoModel::find($Fresado->id);
                $Fresado->unidad_funcional_id = $fe['unidad_funcional_id'];
                $Fresado->calzada = $fe['calzada'];
                $Fresado->longitud = $fe['longitud'];
                $Fresado->plano_codigo = $fe['plano_codigo'];
                $Fresado->version = $fe['version'];
                $Fresado->ancho_uno = $fe['ancho_uno'];
                $Fresado->ancho_dos = $fe['ancho_dos'];
                $Fresado->espesor_uno = $fe['espesor_uno'];
                $Fresado->espesor_dos = $fe['espesor_dos'];
                $Fresado->estado_tramite_id = $fe['estado_tramite_id'];
                $Fresado->estado_tramite_id = $fe['estado_tramite_id'];
                $Fresado->latitud = $fe['latitud'];
                $Fresado->longitud_x = $fe['longitud_x'];
                $Fresado->eje = $fe['eje'];
                $Fresado->save();
            }
        }










        //guarda nuevos datos
        foreach ($data_fresado as $key => $fe) {
            //echo $fe['id_key'];
            //exit();
            $count=FresadoModel::where('id_key',$fe['id_key'])->count();
            $countitem++;
            if($count==0){

                $Fresado = new FresadoModel();
                $Fresado->users_id=$fe['users_id'];
                $Fresado->unidad_funcional_id =$fe['unidad_funcional_id'];
                $Fresado->calzada=$fe['calzada'];
                $Fresado->longitud=$fe['longitud'];
                $Fresado->plano_codigo=$fe['plano_codigo'];
                $Fresado->version=$fe['version'];
                $Fresado->ancho_uno=$fe['ancho_uno'];
                $Fresado->espesor_uno=$fe['espesor_uno'];
                $Fresado->espesor_dos=$fe['espesor_dos'];
                $Fresado->estado_tramite_id=$fe['estado_tramite_id'];
                $Fresado->latitud=$fe['longitud_x'];
                $Fresado->eje=$fe['eje'];
                $Fresado->id_key=$fe['id_key'];
                $Fresado->save();
                $fresadoid=$Fresado->id;
                foreach ($data_fresadodetalle as $key => $fede) {

                    if($fe['id']==$fede['fresado_id']){
                        $fresadodetalle = new FresadoDetalleModel();
                        $fresadodetalle->actividad=$fede['actividad'];
                        $fresadodetalle->si_aplica=$fede['si_aplica'];
                        $fresadodetalle->si_cumple=$fede['si_cumple'];
                        $fresadodetalle->fecha=$fede['fecha'];
                        $fresadodetalle->observaciones = $fede['observaciones'];
                        $fresadodetalle->fresado_id = $fresadoid;
                        $fresadodetalle->columna = $fede['columna'];
                        $fresadodetalle->save();
                        $fresadodetalle_id=$fresadodetalle->id;

                    }
                    foreach ($data_fresadodetallefoto as $key => $fefo) {
                        if($fefo['fresado_detalle_id']==$fede['id']){

                            $fresadofoto = new FresadoRegistroFotograficoModel();
                            $fresadofoto->nombre='sin foto';
                            $fresadofoto->file=$fefo['file'];
                            $fresadofoto->fresado_detalle_id =$fresadodetalle_id;
                            $fresadofoto->save();


                        }

                    }


                }


            }else{










                //$Fresado = FresadoModel::findOrFail($id);



            }
        }

        //$data='true_data_mo';
        return response()->json($countitem);

    }
}
