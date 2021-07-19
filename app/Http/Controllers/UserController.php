<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Models\User;
use DB;

class UserController extends Controller
{
    public function rules() {
        return [
            'name' => 'required',
            'email' => 'required|unique:doize_user',
            'password' => 'required'
        ];
    }

    protected $pesan = [
        'required' => 'Kolom :attribute tidak boleh kosong.',
        'unique' => 'Email telah terdaftar.',
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
                'message' => 'ID User tidak ditemukan',
                'data' => $id
            ], 404);
        }
    }

    public function register(Request $request) {
        $validator = Validator::make($request->all(), $this->rules(), $this->pesan);

        if ($validator->fails()) {
            return response()->json([
                'status' => 500,
                'message'=> $validator->errors(),
                'data' => ''
            ], 500);
        } else {
            $requestData = $request->all();
            $requestData['creadate'] = date('Y-m-d H:i:s');
            $requestData['modidate'] = date('Y-m-d H:i:s');
            $requestData['password'] = Hash::make($requestData['password']);

            $user = User::create($requestData);

            return response()->json([
                'status' => 200,
                'message'=> 'Data berhasil ditambahkan.',
                'data' => $user
            ], 200);
        }
    }

    public function update(Request $request, $id) {
        $rules = $this->rules();
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
            unset($requestData['creadate']);

            $user = User::findOrFail($id);
            $user->update($requestData);

            return response()->json([
                'status' => 200,
                'message'=> 'Data berhasil diupdate.',
                'data' => $user
            ], 200);
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
                "message" => "Login gagal, email tidak terdaftar!",
                "data"  => null
            ];
            return response()->json($out);
        }

        if (Hash::check($password, $user->password)) {
            $out = [
                "status" => 200,
                "message" => "Login berhasil!",
                "data"  => $user
            ];
        } else {
            $out = [
                "status" => 500,
                "message" => "Login gagal, password salah!",
                "data"  => null
            ];
        }

        return response()->json($out);
    }
}
