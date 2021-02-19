<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;

use App\GranularesRegistroFotograficoModel;
use View;
use App\User;

class GranularesRegistroFotograficoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    protected $rules =
    [
        //'id' => 'required|min:2|max:255',
        'foto' => 'required',
        'granulares_detalle_id' => 'required|min:1|max:255',
        //'file' => 'required|min:2|max:255',

    ];

    //public function index(){
    //return view('GranularesRegistroFotografico.index', [] );
    //}
    /*
    public function index(Request $request)
    {
        $consulta_data = $request->get("consulta_data");
        if ($consulta_data == "") {
            $data = GranularesRegistroFotograficoModel::paginate(20);
        } else {
            $data = GranularesRegistroFotograficoModel::where("id", 1)
                ->orwhere("id", "like", "%" . $consulta_data . "%")
                ->orwhere("fotografia", "like", "%" . $consulta_data . "%")
                ->orwhere("granulares_detalle_id", "like", "%" . $consulta_data . "%")
                ->orwhere("file", "like", "%" . $consulta_data . "%")

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
    */

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), $this->rules);
        if ($validator->fails()) {
            return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
        } else {

            $GranularesRegistroFotografico = new GranularesRegistroFotograficoModel();

            $file2 = $request->file('foto');// Input::file('registro_fotografico');
            if (isset($file2)) {
                $granulares_detalle_id=$request->granulares_detalle_id;
                $granulares_id=$request->granulares_id;
                $nombre_original=$file2->getClientOriginalName();
                $nombres = $granulares_id.'-'.$granulares_detalle_id.$nombre_original. '.' . $file2->getClientOriginalExtension();
                \Storage::disk('Concreto')->put($nombres, \File::get($file2));

             //   $base64=base64_encode($request->file('foto'));

            }
            $GranularesRegistroFotografico->fotografia = $nombres;
            //$GranularesRegistroFotografico->file = $base64;

            $GranularesRegistroFotografico->granulares_detalle_id = $request->granulares_detalle_id;

            $GranularesRegistroFotografico->save();
            return response()->json($GranularesRegistroFotografico);
        }
    }
    /*
    public function show($id)
    {
        return response()->json(GranularesRegistroFotograficoModel::findOrFail($id));
    }


    public function edit($id)
    {
        return view("GranularesRegistroFotografico.index", []);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), $this->rules);
        if ($validator->fails()) {
            return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
        } else {
            $GranularesRegistroFotografico = GranularesRegistroFotograficoModel::findOrFail($id);

            $GranularesRegistroFotografico->fotografia = $request->fotografia;
            $GranularesRegistroFotografico->granularesdetalle_item = $request->granularesdetalle_item;
            $GranularesRegistroFotografico->file = $request->file;


            $GranularesRegistroFotografico->save();
            return response()->json($GranularesRegistroFotografico);
        }
    }
*/
    public function destroy($id)
    {
        $GranularesRegistroFotografico = GranularesRegistroFotograficoModel::findOrFail($id);
        $GranularesRegistroFotografico->delete();
        return response()->json($GranularesRegistroFotografico);
    }
}
