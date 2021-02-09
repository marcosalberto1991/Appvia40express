<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;
  use OwenIt\Auditing\Contracts\Auditable;

	class FresadoModel extends Model implements Auditable {
    use \OwenIt\Auditing\Auditable;
		protected $table = 'fresado';
    protected $fillable = [];
    public function users_id(){
        return $this->belongsTo('App\User', 'users_id');
    }
    public function estado_tramite_id(){
        return $this->belongsTo('App\EstadoTramiteModel', 'estado_tramite_id');
    }
    public function unidad_funcional_id(){
        return $this->belongsTo('App\UnidadFuncionalModel', 'unidad_funcional_id');
    }
    //public $timestamps = false;
    /*
    public function tipo_factura_id_pk(){
      return $this->belongsTo('App\Tipo_FacturaModel', 'tipo_factura_id');
    }
    public function cartera_lista_all(){
      return $this->HasMany('App\Cartera_ListaModel', 'cartera_sam_id');
    }
    */
	}
