<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DailyActivity extends Model {
    protected $table = 'daily_activity';

    protected $primaryKey = 'id_daily_activity';

    protected $fillable = [
        'name_daily_activity', 'description_daily_activity', 'duedate_daily_activity', 'reminder_at', 'priority', 'priority', 'working_status', 'status', 'id_user', 'creadate', 'modidate'
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