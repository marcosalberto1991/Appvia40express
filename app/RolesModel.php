<?php

	namespace App;

	use Illuminate\Database\Eloquent\Model;

	use OwenIt\Auditing\Contracts\Auditable;
	class RolesModel extends Model implements Auditable
	{
		use \OwenIt\Auditing\Auditable;
		protected $table = 'roles';
		protected $fillable = [
		];
		protected $guard_name = 'web';

	}

