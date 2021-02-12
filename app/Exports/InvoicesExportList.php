<?php

namespace App\Exports;

use App\Encuesta_SaludModel;
use App\Perfil_SaludModel;
use App\PerfilSaludEncuestaSaludModel;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class InvoicesExportList implements FromView
{
    public function view(): View
    {
        $perfil = Perfil_SaludModel::all()->toarray();

        $preguntas = Encuesta_SaludModel::where('is_activo',1)->where('is_titulo',0)->get()->toarray();

        $respuesta = PerfilSaludEncuestaSaludModel:://where('perfil_salud_id',$perfi['id'])
        //->select('id','fecha','respuesta')

        groupBy('fecha','perfil_salud_id')
        ->with('perfil_salud')
        ->get()->toarray();

        //$dataf=[];
        foreach ($respuesta as $re => $redata) {
            $respu =PerfilSaludEncuestaSaludModel::
            select('perfil_salud_id','respuesta')
            ->where('perfil_salud_id',$redata['perfil_salud_id'])->where('fecha',$redata['fecha'])->get()->toarray();
            $respuesta[$re]['respuesta'] =$respu;

            foreach ($preguntas as $pe => $pedata) {

                $respu =PerfilSaludEncuestaSaludModel::
                select('perfil_salud_id','respuesta')
                ->where('encuesta_salud_id', $pedata['id'])
                ->where('perfil_salud_id', $redata['perfil_salud_id'])
                ->where('fecha',$redata['fecha'])->get()->toarray();
                $respuesta[$re]['respuesta_2'][$pe]['resul'] =$respu;




            }
        }
       // return response()->json($respuesta);

        //var_dump($respuesta);exit();





        return view('Excel.saludLista', [
            'data' => $respuesta,
            'preguntas'=>$preguntas
        ]);
    }
}
