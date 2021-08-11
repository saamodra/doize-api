<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Models\Schedule;
use DB;

class ScheduleController extends Controller
{
    public function rules() {
        return [
            'name_schedule' => 'required',
            'id_user' => 'required'
        ];
    }

    protected $pesan = [
        'required' => 'Kolom :attribute tidak boleh kosong.',
    ];

    public function getSchedule($idUser) {
        $daily_activity = Schedule::where([
            ['id_user', '=', $idUser],
            ['status', '=', 1]
        ])->get();

        return response([
            'status' => 200,
            'message' => '',
            'data' => $daily_activity
        ]);
    }

    public function getScheduleByDayUser($idUser) {
        $todaySchedules = Schedule::with(['detailSchedule' => function($q) {
            $q->where('day_schedule', date('l', strtotime(date('Y-m-d'))));
        }])->whereHas('detailSchedule', function($q) {
            $q->where('day_schedule', date('l', strtotime(date('Y-m-d'))));
        })->where('id_user', $idUser)->get();

        return response([
            'status' => 200,
            'message' => '',
            'data' => $todaySchedules
        ]);
    }

    public function showSchedule($id)
    {
        try {
            $daily_activity = Schedule::findOrFail($id);

            return response([
                'status' => 200,
                'message' => '',
                'data' => $daily_activity
            ], 200);
        } catch(ModelNotFoundException $e) {
            return response([
                'status' => 500,
                'message' => 'Schedule ID not found.',
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
            $requestData['status'] = 1;
            $requestData['creadate'] = date('Y-m-d H:i:s');
            $requestData['modidate'] = date('Y-m-d H:i:s');

            $daily_activity = Schedule::create($requestData);

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

            $daily_activity = Schedule::findOrFail($id);
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
            $daily_activity = Schedule::findOrFail($id);
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
                'message' => 'Schedule ID not found',
                'data' => $id
            ], 404);
        }
    }
}
