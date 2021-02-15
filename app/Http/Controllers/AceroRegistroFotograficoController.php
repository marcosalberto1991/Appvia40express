<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;

use App\AceroRegistroFotograficoModel;
use View;
use App\User;

class AceroRegistroFotograficoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    protected $rules =
    [
        'nombre' => 'required|min:2',
        'acero_detalle_id' => 'required|min:1|max:255',
    ];
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), $this->rules);
        if ($validator->fails()) {
            return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
        } else {

            $AceroRegistroFotografico = new AceroRegistroFotograficoModel();
            $file2 = $request->hasFile('nombre');// Input::file('registro_fotografico');
            if (isset($file2)) {
                $file_id=$request->acero_detalle_id;
                $codigo='ser';
                $nombre_original=$file2->getClientOriginalName();
                $nombres = $file_id.'-'.$nombre_original.$codigo. '.' . $file2->getClientOriginalExtension();
                \Storage::disk('Concreto')->put($nombres, \File::get($file2));
            }
            $AceroRegistroFotografico->nombre = $nombres;
            $AceroRegistroFotografico->acero_detalle_id = $request->acero_detalle_id;

            $AceroRegistroFotografico->save();
            return response()->json($AceroRegistroFotografico);
        }
    }



    public function destroy($id)
    {
        $AceroRegistroFotografico = AceroRegistroFotograficoModel::findOrFail($id);
        $AceroRegistroFotografico->delete();
        return response()->json($AceroRegistroFotografico);
    }
}
