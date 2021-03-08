<?php

	namespace App;
	use Illuminate\Database\Eloquent\Model;
	use OwenIt\Auditing\Contracts\Auditable;

	class RolePermissionsModel extends Model implements Auditable
	{
		use \OwenIt\Auditing\Auditable;
		protected $table = 'role_has_permissions';
		protected $fillable = [
		];
        public function permission(){
            return $this->belongsTo('App\Permission', 'permission_id');
        }
		//protected $guard_name = 'web';

	}

