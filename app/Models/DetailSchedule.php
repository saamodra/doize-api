<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DetailSchedule extends Model {
    protected $table = 'detail_schedule';

    protected $primaryKey = 'id_detail_schedule';

    protected $fillable = [
        'name_detail_schedule', 'day_detail_schedule', 'day_schedule', 'start_time', 'end_time', 'id_schedule', 'creadate', 'modidate'
    ];

    public $timestamps = false;

    /**
     * Get the user that owns the dailyactivity.
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }

}