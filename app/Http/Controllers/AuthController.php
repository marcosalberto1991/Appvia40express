<?php



namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Request;
use App\User;
use App\ModelRolesModel;
use App\RolesModel;
use App\RolePermissionsModel;
use Auth;
use Illuminate\Support\Carbon;

use Spatie\Permission\Models\Permission;
use Spatie\Permission\Traits\HasRoles;

//use Illuminate\Foundation\Auth\User as Authenticatable;

class AuthController extends Controller{

   // use HasRoles,HasPermission;
    /**
     * Registro de usuario
     */
    public function signUp(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'email' => 'required|string|email|unique:users',
            'password' => 'required|string'
        ]);

        User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password)
        ]);

        return response()->json([
            'message' => 'Successfully created user!'
        ], 201);
    }

    /**
     * Inicio de sesión y creación de token
     */
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
            'remember_me' => 'boolean'
        ]);

        $credentials = request(['email', 'password']);

        if (!Auth::attempt($credentials))
            return response()->json([
                'message' => 'Unauthorized'
            ], 401);

        $user = $request->user();
        $tokenResult = $user->createToken('Personal Access Token');

        $token = $tokenResult->token;
        if ($request->remember_me)
            $token->expires_at = Carbon::now()->addWeeks(1);
        $token->save();





        $permissions = [];
        $user_id = $request->user()->id;
        $roles = ModelRolesModel::where('model_id',$user_id)->pluck('role_id')->toarray();
        $roles_name = RolesModel::whereIn('id',$roles)->select('name')->get()->toarray();

        $permisio = RolePermissionsModel::with('permission')->whereIn('role_id',$roles)->groupBy('permission_id')->get()->toarray();

        foreach ($permisio as $permission) {
            $permiso = $permission['permission']['name'];
                $permissions[] = $permiso;
        }

        return response()->json([
            'access_token' => $tokenResult->accessToken,
            'token_type' => 'Bearer',
            'expires_at' => Carbon::parse($token->expires_at)->toDateTimeString(),
            'user' => $request->user(),
            'user_id' => $request->user(),
            'permisos' => $permissions,
            'roles_name' => $roles_name,
        ]);
    }

    /**
     * Cierre de sesión (anular el token)
     */
    public function logout(Request $request)
    {
        $request->user()->token()->revoke();

        return response()->json([
            'message' => 'Successfully logged out'
        ]);
    }

    /**
     * Obtener el objeto User como json
     */
    public function user(Request $request)
    {
        return response()->json($request->user());
    }
    public function consulta()
    {
        return response()->json(true);
    }
}
