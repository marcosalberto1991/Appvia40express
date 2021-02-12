<?php

namespace App\Exports;

use App\Encuesta_SaludModel;
use App\Perfil_SaludModel;
use App\PerfilSaludEncuestaSaludModel;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class InvoicesExport implements FromView
{
    public function view(): View
    {
        $perfil = Perfil_SaludModel::all()->toarray();
        $preguntas = Encuesta_SaludModel::where('is_activo',1)->get()->toarray();

        foreach ($perfil as $key => $perfi){

           $fecha = PerfilSaludEncuestaSaludModel::where('perfil_salud_id',$perfi['id'])
           ->select('id','fecha','respuesta')
           ->groupBy('fecha')
           ->get();
            $perfil[$key]['fecha']=$fecha;
            $perfil[$key]['preguntas']=$preguntas;

           //////////////////////////////////



            $respuesta = PerfilSaludEncuestaSaludModel::where('perfil_salud_id',$perfi['id'])
            //->select('id','fecha','respuesta')
            ->groupBy('fecha','encuesta_salud_id')
            ->get();




           //SELECT * FROM `perfil_salud_has_encuesta_salud` WHERE perfil_salud_id=1 GROUP BY fecha

           //$preguntas[]
           foreach ($preguntas as $key2 => $value) {
            $dss = PerfilSaludEncuestaSaludModel::
            where('perfil_salud_id',$perfi['id'])
            //->select('id','fecha','respuesta')
            ->where('encuesta_salud_id',$value['id'])
            //->groupBy('fecha')
            ->get()->toarray();


            $perfil[$key]['preguntas'][$key2]['resultado']=$dss;

//            var_dump($dss);
  //          exit();
            }



     //       var_dump($perfil[0]['preguntas'][0]['resultado']);
       //     exit();




        }




        return view('Excel.salud', [
            'users' => $perfil
        ]);
    }
}
