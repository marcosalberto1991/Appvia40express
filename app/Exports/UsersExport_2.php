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
            'id',
            'Nombre',
            'Email',
            'to',
        ];
    }

    public function collection()
    {
        $da=Perfil_SaludModel::all();


         return $da ;



    }
}
