<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;
  use OwenIt\Auditing\Contracts\Auditable;

	class ConcretoDetallesModel extends Model implements Auditable {
    use \OwenIt\Auditing\Auditable;
	protected $table = 'concreto_detalles';
    protected $fillable = [];
    public $timestamps = false;
    /*
    public function tipo_factura_id_pk(){
      return $this->belongsTo('App\Tipo_FacturaModel', 'tipo_factura_id');
    }
    */
    public function concreto_registro_fotografico_all(){
      return $this->HasMany('App\ConcretoRegistroFotograficoModel', 'concreto_detalles_id');
    }

	}
