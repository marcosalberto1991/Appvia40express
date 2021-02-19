<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;
  use OwenIt\Auditing\Contracts\Auditable;

	class GranularesDetalleModel extends Model implements Auditable {
    use \OwenIt\Auditing\Auditable;
		protected $table = 'granularesdetalle';
    protected $fillable = [];
    //public $timestamps = false;
    /*
    public function tipo_factura_id_pk(){
      return $this->belongsTo('App\Tipo_FacturaModel', 'tipo_factura_id');
    }
    */
    public function registro_fotografico_all(){
      return $this->HasMany('App\GranularesRegistroFotograficoModel', 'granulares_detalle_id');
    }

	}
