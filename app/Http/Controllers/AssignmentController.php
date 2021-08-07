<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Models\Assignment;
use DB;

class AssignmentController extends Controller
{
    public function rules() {
        return [
            'name_assignment' => 'required',
            'course' => 'required',
            'id_user' => 'required'
        ];
    }

    protected $pesan = [
        'required' => 'Kolom :attribute tidak boleh kosong.',
    ];

    public function getAssignment($id) {
        $assignment = Assignment::where([
            ['status', '=', 1],
            ['id_user', '=', $id]
        ])->get();

        return response([
            'status' => 200,
            'message' => '',
            'data' => $assignment
        ]);
    }

    public function showAssignment($id)
    {
        try {
            $assignment = Assignment::findOrFail($id);

            return response([
                'status' => 200,
                'message' => '',
                'data' => $assignment
            ], 200);
        } catch(ModelNotFoundException $e) {
            return response([
                'status' => 500,
                'message' => 'ID Assignment tidak ditemukan',
                'data' => $id
            ], 404);
        }
    }

    public function store(Request $request) {
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

            $assignment = Assignment::create($request->all());

            return response()->json([
                'status' => 200,
                'message'=> 'Data berhasil ditambahkan.',
                'data' => $assignment
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

            $assignment = Assignment::findOrFail($id);
            $assignment->update($request->all());

            return response()->json([
                'status' => 200,
                'message'=> 'Data berhasil diupdate.',
                'data' => $assignment
            ], 200);
        }
    }

    public function destroy($id)
    {
        try {
            $assignment = Assignment::findOrFail($id);
            $assignment->status = 0;
            $assignment->update();

            return response([
                'status' => 200,
                'message' => 'Data berhasil dihapus.',
                'data' => $assignment
            ], 200);
        } catch(ModelNotFoundException $e) {
            return response([
                'status' => 500,
                'message' => 'ID Assignment tidak ditemukan',
                'data' => $id
            ], 404);
        }
    }
}
