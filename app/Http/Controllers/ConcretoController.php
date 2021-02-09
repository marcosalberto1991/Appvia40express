<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;
use Auth;
use App\ConcretoModel;
use App\UnidadFuncionalModel;
use App\EstadoTramiteModel;
use App\ConcretoDetalle;
use PDF;

use View;
use App\User;

class ConcretoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    protected $rules =
    [
        'unidad_funcional_id' => 'required|min:1|max:255',
        'calzada' => 'required|min:2|max:255',
        'estrutura' => 'required|min:2|max:255',
        'elemento' => 'required|min:2|max:255',
        'plano_codigo' => 'required|min:2|max:255',
        'version' => 'required|min:2|max:255',
        'resistencia_concreto' => 'required|min:2|max:255',
        'eje' => 'required|min:1|max:45',

        //'estado_tramite_id' => 'min:1|max:255',

    ];
    public function index(Request $request)
    {

        $consulta_data = $request->get("consulta_data");
        if ($consulta_data == "") {
            if(Auth::user()->hasRole('Operado')){
                $data = ConcretoModel::where('estado_tramite_id',1)->where('users_id',Auth::user()->id)->with('users_id','estado_tramite_id','unidad_funcional_id')->paginate(20);
            }
            if(Auth::user()->hasRole('Tecnico')){
                $data = ConcretoModel::with('users_id','estado_tramite_id','unidad_funcional_id')->paginate(20);
            }
            if(Auth::user()->hasRole('Gerente')){
                $data = ConcretoModel::with('users_id','estado_tramite_id','unidad_funcional_id')->paginate(20);
            }
            if(Auth::user()->hasRole('Administrador')){
                $data = ConcretoModel::with('users_id','estado_tramite_id','unidad_funcional_id')->paginate(20);
            }





        } else {
            if(Auth::user()->hasRole('Operado')){
            $data = ConcretoModel::where('users_id',Auth::user()->id)->with('users_id')
                ->orwhere("unidad_funcional_id", "like", "%" . $consulta_data . "%")
                ->orwhere("calzada", "like", "%" . $consulta_data . "%")
                ->orwhere("estrutura", "like", "%" . $consulta_data . "%")
                ->orwhere("elemento", "like", "%" . $consulta_data . "%")
                ->orwhere("plano_codigo", "like", "%" . $consulta_data . "%")
                ->orwhere("version", "like", "%" . $consulta_data . "%")
                ->orwhere("resistencia_concreto", "like", "%" . $consulta_data . "%")
                ->orwhere("estado_tramite_id", "like", "%" . $consulta_data . "%")
                ;

                $data->where('estado_tramite_id',1)->paginate(20);
            }else{
                $data = ConcretoModel::where('users_id',Auth::user()->id)->with('users_id')
                ->orwhere("unidad_funcional_id", "like", "%" . $consulta_data . "%")
                ->orwhere("calzada", "like", "%" . $consulta_data . "%")
                ->orwhere("estrutura", "like", "%" . $consulta_data . "%")
                ->orwhere("elemento", "like", "%" . $consulta_data . "%")
                ->orwhere("plano_codigo", "like", "%" . $consulta_data . "%")
                ->orwhere("version", "like", "%" . $consulta_data . "%")
                ->orwhere("resistencia_concreto", "like", "%" . $consulta_data . "%")
                ->orwhere("estado_tramite_id", "like", "%" . $consulta_data . "%")
                ->paginate(20);
                //$data->where('estado_tramite_id',1)->paginate(20);

            }
        }

        return response()->json($data);
    }

    public function create()
    {
        $data_foraneos = [
            "unidad_funcional_id" => UnidadFuncionalModel::select("id", "id as nombre", "nombre as text")->get(),
            "estado_tramite_id" => EstadoTramiteModel::select("id", "id as nombre", "nombre as text")->get(),

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

            $Concreto = new ConcretoModel();
            $Concreto->users_id = Auth::user()->id;
            $Concreto->unidad_funcional_id = $request->unidad_funcional_id;
            $Concreto->calzada = $request->calzada;
            $Concreto->estrutura = $request->estrutura;
            $Concreto->elemento = $request->elemento;
            $Concreto->plano_codigo = $request->plano_codigo;
            $Concreto->version = $request->version;
            $Concreto->resistencia_concreto = $request->resistencia_concreto;
            $Concreto->estado_tramite_id = 1;
            $Concreto->latitud = $request->latitud;
            $Concreto->longitud = $request->longitud;
            $Concreto->eje = $request->eje;

            $Concreto->save();
            return response()->json($Concreto);
        }
    }
    public function show($id)
    {
        return response()->json(ConcretoModel::findOrFail($id));
    }


    public function edit($id)
    {
        return view("Concreto.index", []);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), $this->rules);
        if ($validator->fails()) {
            return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
        } else {
            $Concreto = ConcretoModel::findOrFail($id);

           // $Concreto->users_id = $request->users_id;
            $Concreto->unidad_funcional_id = $request->unidad_funcional_id;
            $Concreto->calzada = $request->calzada;
            $Concreto->estrutura = $request->estrutura;
            $Concreto->elemento = $request->elemento;
            $Concreto->plano_codigo = $request->plano_codigo;
            $Concreto->version = $request->version;
            $Concreto->resistencia_concreto = $request->resistencia_concreto;
            $Concreto->estado_tramite_id = $request->estado_tramite_id;
            $Concreto->latitud = $request->latitud;
            $Concreto->longitud = $request->longitud;
            $Concreto->eje = $request->eje;



            $Concreto->save();
            return response()->json($Concreto);
        }
    }

    public function destroy($id)
    {
        $Concreto = ConcretoModel::findOrFail($id);
        $Concreto->delete();
        return response()->json($Concreto);
    }
    public function reporte_final(Request $request)
    {
        $Concreto = ConcretoModel::findOrFail($request->id);
        //$Concreto->delete();
        $Concreto->estado_tramite_id=2;
        $Concreto->save();
        return response()->json($Concreto);
    }

    public function pdfConcreto($id){
        $data = ConcretoModel::with('concretoDetalleAll')->findOrFail($id);
        \Cache::put('unidad_funcional_id', $data->unidad_funcional_id, 10);
        \Cache::put('calzada', $data->calzada, 10);
        \Cache::put('estrutura', $data->estrutura, 10);
        \Cache::put('elemento', $data->elemento, 10);
        \Cache::put('plano_codigo', $data->plano_codigo, 10);
        \Cache::put('version', $data->version, 10);
        \Cache::put('resistencia_concreto', $data->resistencia_concreto, 10);

        $view =  \View::make('Concreto.Pdf',
        compact('data')
            )->render();
        $pdf = \App::make('dompdf.wrapper');
        //$pdf->set('isRemoteEnabled', true);
        $pdf->loadHTML($view);
            //Codigo de Numero de pagina
            //$options = new Options();

        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf ->get_canvas();
            $canvas->page_text(350, 20, 'CONTROL DE FUNDIDA DE CONCRETO', null, 11, array(255, 255, 255));
            //$canvas->page_text(350, 119, intval($fecha[2]).'/'.$mes[intval($fecha[1])].'/'.$fecha[0], null, 11, array(0, 0, 0));
            //$canvas->page_text(480, 125, "Pagina {PAGE_NUM} de {PAGE_COUNT}", null, 15, array(0, 0, 0));
            //$canvas->page_text(250, 805, "Pagina {PAGE_NUM} de {PAGE_COUNT}", null, 11, array(0, 0, 0));
            //Codigo de numero de pagina
        return $pdf->stream('orden_servicio_'.$data['id'].'.pdf');
    }
    public function Footer() {
        // Position at 15 mm from bottom
        PDF::SetY(-20);
        // Set font
        PDF::SetFont('courier', 'I', 8);
        // Page number
        PDF::Cell(0, 20, 'OFICINA Y LABORATORIO-DIAGONAL 8 NO. 32-36 BARRIO BLANCO / GIRARDOT - CUNDINAMARCA', 0, false, 'C', 0, '', 0, false, 'T', 'M');
        PDF::Cell(0, 15, 'TEL:888 7452 - CEL: 317 5262303 - 3115571381', 0, false, 'C', 0, '', 0, false, 'T', 'M');
        PDF::Cell(0, 10, 'Page '.PDF::getAliasNumPage().'/'.PDF::getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');


    }

}
