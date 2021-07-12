<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\DailyActivity;
use DB;

class DailyActivityController extends Controller
{
    public function rules() {
        return [
            'name_daily_activity' => 'required',
            'id_user' => 'required'
        ];
    }

    protected $pesan = [
        'required' => 'Kolom :attribute tidak boleh kosong.',
    ];

    public function getDailyActivity() {
        $daily_activity = DailyActivity::where('status', 1)->get();

        return response([
            'success' => true,
            'message' => '',
            'data' => $daily_activity
        ]);
    }

    public function showDailyActivity($id)
    {
        try {
            $daily_activity = DailyActivity::findOrFail($id);

            return response([
                'status' => 'success',
                'message' => '',
                'data' => $daily_activity
            ], 200);
        } catch(ModelNotFoundException $e) {
            return response([
                'status' => 'failed',
                'message' => 'ID DailyActivity tidak ditemukan',
                'data' => $id
            ], 404);
        }
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), $this->rules(), $this->pesan);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'failed',
                'message'=> $validator->errors(),
                'data' => ''
            ], 500);
        } else {
            $daily_activity = DailyActivity::create($request->all());

            return response()->json([
                'status' => 'success',
                'message'=> 'Data berhasil ditambahkan.',
                'data' => $daily_activity
            ], 200);
        }
    }

    public function update(Request $request, $id) {
        $rules = $this->rules();
        $validator = Validator::make($request->all(), $rules, $this->pesan);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'failed',
                'message'=> $validator->errors(),
                'data' => ''
            ], 500);
        } else {
            $daily_activity = DailyActivity::findOrFail($id);
            $daily_activity->update($request->all());

            return response()->json([
                'status' => 'success',
                'message'=> 'Data berhasil diupdate.',
                'data' => $daily_activity
            ], 200);
        }
    }

    public function destroy($id)
    {
        try {
            $daily_activity = DailyActivity::findOrFail($id);
            $daily_activity->status = 0;
            $daily_activity->update();

            return response([
                'status' => 'success',
                'message' => 'Data berhasil dihapus.',
                'data' => $daily_activity
            ], 200);
        } catch(ModelNotFoundException $e) {
            return response([
                'status' => 'failed',
                'message' => 'ID DailyActivity tidak ditemukan',
                'data' => $id
            ], 404);
        }
    }
}
