<?php

namespace App\Exports;
use App\Perfil_SaludModel;

use App\User;
use DB;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class UsersExport implements FromCollection,WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function headings(): array
    {
        return [
            'Id',
            'Nombre',
            'Email',
        ];
    }
    public function collection()
    {
        $data_excel=[];
        $da=Perfil_SaludModel::all();

        foreach ($da as $key => $va) {
            array_push($data_excel, array(
                'Cedula'=>$va['cedula'],
                'nombre'=>$va['nombre'],
                'nombre'=>$va['apellido'],
                ));

        }


         //$users = DB::table('Users')->select('id','name', 'email')->get();
         return $data_excel;

    }
}
