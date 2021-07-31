<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PomodoroActivity extends Model {
    protected $table = 'pomodoro_activity';

    protected $primaryKey = 'id_pomodoro_activity';

    protected $fillable = [
        'id_pomodoro', 'activity_name', 'working_status'
    ];

    public $timestamps = false;

    /**
     * Get the pomodoro that owns the pomodoroactivity.
     */
    public function pomodoro()
    {
        return $this->belongsTo(Pomodoro::class, 'id_pomodoro');
    }
}