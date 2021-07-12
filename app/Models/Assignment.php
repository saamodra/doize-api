<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Assignment extends Model {
    protected $table = 'assignment';

    protected $primaryKey = 'id_assignment';

    protected $fillable = [
        'name_assignment', 'description_assignment', 'course', 'duedate_assignment', 'reminder_at', 'priority', 'priority', 'working_status', 'status', 'id_user', 'creadate', 'modidate'
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