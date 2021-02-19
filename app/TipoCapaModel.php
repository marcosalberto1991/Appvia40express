<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class TipoCapaModel extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;
    protected $table = 'tipo_capa';
    protected $fillable = [];
    public $timestamps = true;

    public function users_id(){
      return $this->belongsTo('App\User', 'users_id');
    }

    public function estado_tramite_id(){
        return $this->belongsTo('App\EstadoTramiteModel', 'estado_tramite_id');
      }

    public function granulares_detalle_all(){
      return $this->HasMany('App\GranularesDetalleModel', 'tipo_capa_id');
    }
    public function unidad_funcional_id(){
        return $this->belongsTo('App\UnidadFuncionalModel', 'unidad_funcional_id');
    }

}
