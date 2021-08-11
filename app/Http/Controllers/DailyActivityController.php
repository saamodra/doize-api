<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Models\DailyActivity;
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

    public function getDailyActivity($id) {
        $daily_activity = DailyActivity::where([
            ['status', '=', 1],
            ['id_user', '=', $id]
        ])->get();

        return response([
            'status' => 200,
            'message' => '',
            'data' => $daily_activity
        ]);
    }

    public function showDailyActivity($id)
    {
        try {
            $daily_activity = DailyActivity::findOrFail($id);

            return response([
                'status' => 200,
                'message' => '',
                'data' => $daily_activity
            ], 200);
        } catch(ModelNotFoundException $e) {
            return response([
                'status' => 500,
                'message' => 'Daily Activity ID not found.',
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

            $daily_activity = DailyActivity::create($requestData);

            return response()->json([
                'status' => 200,
                'message'=> 'Data added successfully.',
                'data' => $daily_activity
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

            $daily_activity = DailyActivity::findOrFail($id);
            $daily_activity->update($requestData);

            return response()->json([
                'status' => 200,
                'message'=> 'Data updated successfully.',
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
                'status' => 200,
                'message' => 'Data deleted successfully.',
                'data' => $daily_activity
            ], 200);
        } catch(ModelNotFoundException $e) {
            return response([
                'status' => 500,
                'message' => 'Daily Activity ID not found.',
                'data' => $id
            ], 404);
        }
    }
}
