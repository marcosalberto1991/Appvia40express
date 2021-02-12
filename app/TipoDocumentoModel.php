<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;
  use OwenIt\Auditing\Contracts\Auditable;

  class TipoDocumentoModel extends Model //implements Auditable
  {
  //  use \OwenIt\Auditing\Auditable;
	protected $table = 'tipo_documento';
    protected $fillable = [];
    public $timestamps = false;



	}
