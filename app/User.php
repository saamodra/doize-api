<?php
namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model {
    protected $table = 'user';

    protected $primaryKey = 'id_user';

    protected $fillable = [
        'first_name', 'last_name', 'birth_date', 'phone', 'email', 'password', 'status', 'creaby', 'creadate', 'modiby', 'modidate'
    ];

    public $timestamps = false;

    public function dailyActivity()
    {
        return $this->hasMany(DailyActivity::class, 'id_user');
    }
}