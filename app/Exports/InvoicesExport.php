<?php

namespace App\Exports;

use App\Perfil_SaludModel;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class InvoicesExport implements FromView
{
    public function view(): View
    {
        return view('Excel.salud', [
            'users' => Perfil_SaludModel::all()
        ]);
    }
}
