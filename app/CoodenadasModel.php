<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class CoodenadasModel extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;
    protected $table = 'coodenadas';
    protected $fillable = [];
    public $timestamps = false;
    /*
    public function users_id(){
      return $this->belongsTo('App\User', 'users_id');
    }

    public function estado_tramite_id(){
        return $this->belongsTo('App\EstadoTramiteModel', 'estado_tramite_id');
      }

    public function cartera_lista_all(){
      return $this->HasMany('App\Cartera_ListaModel', 'cartera_sam_id');
    }
    public function unidad_funcional_id(){
        return $this->belongsTo('App\UnidadFuncionalModel', 'unidad_funcional_id');
    }
    */

}
