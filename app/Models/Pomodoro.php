<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pomodoro extends Model {
    protected $table = 'pomodoro';

    protected $primaryKey = 'id_pomodoro';

    protected $fillable = [
        'id_user', 'productivity_time', 'count',  'saved_time', 'short_break', 'long_break', 'modidate'
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