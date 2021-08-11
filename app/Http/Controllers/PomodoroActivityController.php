<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Models\PomodoroActivity;
use DB;

class PomodoroActivityController extends Controller
{
    public function getPomodoroActivity($id) {
        $pomodoro_activity = PomodoroActivity::where([
            ['id_pomodoro', '=', $id],
            ['status', '=', 1]
        ])->get();

        return response([
            'status' => 200,
            'message' => '',
            'data' => $pomodoro_activity
        ]);
    }

    public function store(Request $request) {
        $requestData = $request->all();
        $requestData['status'] = 1;

        $pomodoro_activity = PomodoroActivity::create($requestData);

        return response()->json([
            'status' => 200,
            'message'=> 'Data added successfully.',
            'data' => $pomodoro_activity
        ], 200);
    }

    public function update(Request $request, $id) {
        $requestData = $request->all();

        $pomodoro_activity = PomodoroActivity::findOrFail($id);
        $pomodoro_activity->update($requestData);

        return response()->json([
            'status' => 200,
            'message'=> 'Data updated successfully.',
            'data' => $pomodoro_activity
        ], 200);
    }

    public function destroy($id)
    {
        try {
            $pomodoro_activity = PomodoroActivity::findOrFail($id);
            $pomodoro_activity->status = 0;
            $pomodoro_activity->update();

            return response([
                'status' => 200,
                'message' => 'Data deleted successfully.',
                'data' => $pomodoro_activity
            ], 200);
        } catch(ModelNotFoundException $e) {
            return response([
                'status' => 500,
                'message' => 'Pomodoro Activity not found.',
                'data' => $id
            ], 404);
        }
    }
}
