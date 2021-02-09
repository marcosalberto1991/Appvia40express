<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;
  use OwenIt\Auditing\Contracts\Auditable;

	class FresadoDetalleModel extends Model implements Auditable {
    use \OwenIt\Auditing\Auditable;
		protected $table = 'fresado_detalle';
    protected $fillable = [];
    //public $timestamps = false;
    /*
    public function tipo_factura_id_pk(){
      return $this->belongsTo('App\Tipo_FacturaModel', 'tipo_factura_id');
    }
    */
    public function fresado_registro_fotografico_all(){
      return $this->HasMany('App\FresadoRegistroFotograficoModel', 'fresado_detalle_id');
    }

	}
