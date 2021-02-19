<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;
use Auth;
use App\UnidadFuncionalModel;
use App\TipoCapaModel;
use View;
use App\User;

class TipoCapaController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function update(Request $request, $id)
    {
            $TipoCapa = TipoCapaModel::findOrFail($id);
            $TipoCapa->material = $request->material;
            $TipoCapa->capa_n = $request->capa_n;
            $TipoCapa->save();
            return response()->json($TipoCapa);
    }

    public function destroy($id)
    {
        $TipoCapa = TipoCapaModel::findOrFail($id);
        $TipoCapa->delete();
        return response()->json($TipoCapa);
    }
}
