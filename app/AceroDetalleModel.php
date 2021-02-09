<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;
  use OwenIt\Auditing\Contracts\Auditable;

	class AceroDetalleModel extends Model implements Auditable {
    use \OwenIt\Auditing\Auditable;
		protected $table = 'acero_detalle';
    protected $fillable = [];
    //public $timestamps = false;
    /*
    public function tipo_factura_id_pk(){
      return $this->belongsTo('App\Tipo_FacturaModel', 'tipo_factura_id');
    }
    */
    public function aceroregistrofotografico_all(){
      return $this->HasMany('App\AceroRegistroFotograficoModel', 'acero_detalle_id');
    }

	}
