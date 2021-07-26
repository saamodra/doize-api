<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Models\DetailSchedule;
use DB;

class DetailScheduleController extends Controller
{
    public function rules() {
        return [
            'name_detail_schedule' => 'required',
            'day_schedule' => 'required',
            'start_time' => 'required',
            'end_time' => 'required',
            'id_schedule' => 'required'
        ];
    }

    protected $pesan = [
        'required' => 'Kolom :attribute tidak boleh kosong.',
    ];

    public function getDetailSchedule(Request $request) {
        $id_schedule = $request->get('schedule', 1);
        $sunday = DetailSchedule::where([
            ['day_schedule', '=', 'Sunday'],
            ['id_schedule', '=', $id_schedule],
        ])->get();

        $monday = DetailSchedule::where([
            ['day_schedule', '=', 'Monday'],
            ['id_schedule', '=', $id_schedule]
        ])->get();

        $tuesday = DetailSchedule::where([
            ['day_schedule', '=', 'Tuesday'],
            ['id_schedule', '=', $id_schedule]
        ])->get();

        $wednesday = DetailSchedule::where([
            ['day_schedule', '=', 'Wednesday'],
            ['id_schedule', '=', $id_schedule]
        ])->get();

        $thursday = DetailSchedule::where([
            ['day_schedule', '=', 'Thursday'],
            ['id_schedule', '=', $id_schedule]
        ])->get();

        $friday = DetailSchedule::where([
            ['day_schedule', '=', 'Friday'],
            ['id_schedule', '=', $id_schedule]
        ])->get();

        $saturday = DetailSchedule::where([
            ['day_schedule', '=', 'Saturday'],
            ['id_schedule', '=', $id_schedule]
        ])->get();

        // return response([
        //     'status' => 200,
        //     'message' => '',
        //     'data' => [
        //         'sunday' => $sunday,
        //         'monday' => $monday,
        //         'tuesday' => $tuesday,
        //         'wednesday' => $wednesday,
        //         'thursday' => $thursday,
        //         'friday' => $friday,
        //         'saturday' => $saturday
        //     ]
        // ]);

        return response([
            'status' => 200,
            'message' => '',
            'data' => [$sunday, $monday, $tuesday, $wednesday, $thursday, $friday, $saturday]
        ]);
    }

    public function showDetailSchedule($id)
    {
        try {
            $detail_schedule = DetailSchedule::findOrFail($id);

            return response([
                'status' => 200,
                'message' => '',
                'data' => $detail_schedule
            ], 200);
        } catch(ModelNotFoundException $e) {
            return response([
                'status' => 500,
                'message' => 'ID DetailSchedule tidak ditemukan',
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

            $detail_schedule = DetailSchedule::create($requestData);

            return response()->json([
                'status' => 200,
                'message'=> 'Data berhasil ditambahkan.',
                'data' => $detail_schedule
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

            $detail_schedule = DetailSchedule::findOrFail($id);
            $detail_schedule->update($requestData);

            return response()->json([
                'status' => 200,
                'message'=> 'Data berhasil diupdate.',
                'data' => $detail_schedule
            ], 200);
        }
    }

    public function destroy($id)
    {
        try {
            $detail_schedule = DetailSchedule::findOrFail($id);
            $detail_schedule->status = 0;
            $detail_schedule->update();

            return response([
                'status' => 200,
                'message' => 'Data berhasil dihapus.',
                'data' => $detail_schedule
            ], 200);
        } catch(ModelNotFoundException $e) {
            return response([
                'status' => 500,
                'message' => 'ID DetailSchedule tidak ditemukan',
                'data' => $id
            ], 404);
        }
    }
}
