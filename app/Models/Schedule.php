<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Schedule extends Model {
    protected $table = 'schedule';

    protected $primaryKey = 'id_schedule';

    protected $fillable = [
        'name_schedule', 'description_schedule', 'status',  'id_user', 'creadate', 'modidate'
    ];

    public $timestamps = false;

    /**
     * Get the user that owns the dailyactivity.
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }

    public function detailSchedule() {
        return $this->hasMany(DetailSchedule::class, 'id_schedule');
    }

}