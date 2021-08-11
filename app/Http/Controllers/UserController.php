<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Models\User;
use Log;
use DB;

class UserController extends Controller
{
    public function createRules() {
        return [
            'name' => 'required',
            'email' => 'required|unique:doize_user',
            'password' => 'required'
        ];
    }

    public function updateRules($id = "") {
        return [
            'name' => 'required',
            'email' => 'required|unique:doize_user,email,'.$id.',id_user',
        ];
    }

    protected $pesan = [
        'required' => ':attribute is required',
        'unique' => 'Email has been registered',
    ];

    public function getUser() {
        $user = User::where('status', 1)->get();

        return response([
            'status' => 200,
            'message' => '',
            'data' => $user
        ]);
    }

    public function showUser($id)
    {
        try {
            $user = User::findOrFail($id);

            return response([
                'status' => 200,
                'message' => '',
                'data' => $user
            ], 200);
        } catch(ModelNotFoundException $e) {
            return response([
                'status' => 404,
                'message' => 'User ID not found',
                'data' => $id
            ], 404);
        }
    }

    public function register(Request $request) {
        $validator = Validator::make($request->all(), $this->createRules(), $this->pesan);

        if ($validator->fails()) {
            return response()->json([
                'status' => 500,
                'message'=> $validator->errors(),
                'data' => ''
            ], 500);
        } else {
            $requestData = $request->all();
            $requestData['birth_date'] = null;
            $requestData['phone'] = null;
            $requestData['creadate'] = date('Y-m-d H:i:s');
            $requestData['modidate'] = date('Y-m-d H:i:s');
            $requestData['password'] = Hash::make($requestData['password']);

            $user = User::create($requestData);

            return response()->json([
                'status' => 200,
                'message'=> 'Data added successfully',
                'data' => $user
            ], 200);
        }
    }

    public function update(Request $request, $id) {
        $rules = $this->updateRules($id);
        $validator = Validator::make($request->all(), $rules, $this->pesan);

        if ($validator->fails()) {
            return response()->json([
                'status' => 500,
                'message'=> $validator->errors(),
                'data' => ''
            ], 500);
        } else {
            $requestData = $request->all();
            $requestData['modidate'] = date('Y-m-d H:i:s');
            $requestData['password'] = Hash::make($request->password);

            $user = User::findOrFail($id);
            $user->update($requestData);

            $userResponse = response()->json([
                'status' => 200,
                'message'=> 'Data updated successfully',
                'data' => $user
            ], 200);

            return $userResponse;
        }
    }

    public function login(Request $request)
    {
        $email = $request->input("email");
        $password = $request->input("password");

        $user = User::where("email", $email)->first();

        if (!$user) {
            $out = [
                "status" => 500,
                "message" => "Sign in failed! Email is not registered",
                "data"  => null
            ];
            return response()->json($out);
        }

        if (Hash::check($password, $user->password)) {
            $user->password = $password;
            $out = [
                "status" => 200,
                "message" => "Sign in success",
                "data"  => $user
            ];
        } else {
            $out = [
                "status" => 500,
                "message" => "Sign in failed! wrong password",
                "data"  => null
            ];
        }

        return response()->json($out);
    }
}
