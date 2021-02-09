<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;

use Illuminate\Http\Request;

use Validator;
use Response;

use App\ConcretoRegistroFotograficoModel;
use View;
use App\User;
class ConcretoRegistroFotograficoController extends Controller {
	public function __construct(){
		$this->middleware('auth');
	}
	protected $rules =
	[
        'nombre' => 'required|min:2|max:16555',
	   	'concreto_detalles_id' => 'required|min:1|max:255',
	];

    public function store(Request $request){
      $validator = Validator::make($request->all(), $this->rules);
      if ($validator->fails()) {
        return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
      } else {
        $ConcretoRegistroFotografico = new ConcretoRegistroFotograficoModel();

        $file2 = $request->file('nombre');// Input::file('registro_fotografico');
        if (isset($file2)) {
            $file_id=$request->concreto_detalles_id;
            $codigo='ser';
            $nombre_original=$file2->getClientOriginalName();
            $nombres = $file_id.'-'.$nombre_original.$codigo. '.' . $file2->getClientOriginalExtension();
            \Storage::disk('Concreto')->put($nombres, \File::get($file2));
        }
            $ConcretoRegistroFotografico->nombre=$nombres;
			$ConcretoRegistroFotografico->concreto_detalles_id=$request->concreto_detalles_id;

        $ConcretoRegistroFotografico->save();
        return response()->json($ConcretoRegistroFotografico);
      }
    }

	public function destroy($id){
		$ConcretoRegistroFotografico = ConcretoRegistroFotograficoModel::findOrFail($id);
		$ConcretoRegistroFotografico->delete();
		return response()->json($ConcretoRegistroFotografico);
	}

}


