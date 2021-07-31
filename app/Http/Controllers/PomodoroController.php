<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Models\Pomodoro;
use DB;

class PomodoroController extends Controller
{
    public function getPomodoro($id)
    {
        try {
            $pomodoro = Pomodoro::where('id_user', $id)->first();

            return response([
                'status' => 200,
                'message' => '',
                'data' => $pomodoro
            ], 200);
        } catch(ModelNotFoundException $e) {
            return response([
                'status' => 500,
                'message' => 'ID Pomodoro tidak ditemukan',
                'data' => $id
            ], 404);
        }
    }

    public function store(Request $request) {
        $requestData = $request->all();
        $requestData['modidate'] = date('Y-m-d H:i:s');

        $pomodoro = Pomodoro::create($request->all());
        $pomodoro = Pomodoro::where('id_user', $pomodoro->id_user)->first();

        return response()->json([
            'status' => 200,
            'message'=> 'Pomodoro added successfully',
            'data' => $pomodoro
        ], 200);
    }

    public function update(Request $request, $id) {
        $requestData = $request->all();
        $requestData['modidate'] = date('Y-m-d H:i:s');

        $pomodoro = Pomodoro::findOrFail($id);
        $pomodoro->update($request->all());

        return response()->json([
            'status' => 200,
            'message'=> 'Pomodoro updated successfully.',
            'data' => $pomodoro
        ], 200);
    }
}
