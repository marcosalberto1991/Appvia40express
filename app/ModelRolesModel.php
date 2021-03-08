<?php

	namespace App;

	use Illuminate\Database\Eloquent\Model;

	use OwenIt\Auditing\Contracts\Auditable;
	class ModelRolesModel extends Model implements Auditable
	{
		use \OwenIt\Auditing\Auditable;
		protected $table = 'model_has_roles';
		protected $fillable = [
		];
		//protected $guard_name = 'web';

	}

