<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;
  use OwenIt\Auditing\Contracts\Auditable;

	class MezclasModel extends Model implements Auditable {
    use \OwenIt\Auditing\Auditable;
		protected $table = 'mezclas';
    protected $fillable = [];
    //public $timestamps = false;

    public function users_id(){
      return $this->belongsTo('App\User', 'users_id');
    }
    /*
    public function cartera_lista_all(){
      return $this->HasMany('App\Cartera_ListaModel', 'cartera_sam_id');
    }
    */
	}
