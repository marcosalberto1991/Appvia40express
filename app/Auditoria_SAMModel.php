<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;
    use OwenIt\Auditing\Contracts\Auditable;

	class Auditoria_SAMModel extends Model implements Auditable {
        use \OwenIt\Auditing\Auditable;
		protected $table = 'audits';
		protected $fillable = [];

		public function user_id() {
        	return $this->belongsTo('App\User', 'user_id');
		}
	}
