<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;
  use OwenIt\Auditing\Contracts\Auditable;

  class PerfilSaludEncuestaSaludModel extends Model implements Auditable
  {
    use \OwenIt\Auditing\Auditable;
	protected $table = 'perfil_salud_has_encuesta_salud';
    protected $fillable = [];
    public $timestamps = false;


    public function perfil_salud(){
        return $this->belongsTo('App\Perfil_SaludModel', 'perfil_salud_id');
      }


	}
