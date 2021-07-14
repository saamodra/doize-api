<?php

namespace App\Models;

use Illuminate\Auth\Authenticatable;
use Illuminate\Contracts\Auth\Access\Authorizable as AuthorizableContract;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Lumen\Auth\Authorizable;

class User extends Model implements AuthenticatableContract, AuthorizableContract
{
    use Authenticatable, Authorizable, HasFactory;

    protected $table = 'user';

    protected $primaryKey = 'id_user';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'first_name', 'last_name', 'birth_date', 'phone', 'email', 'password' ,'status', 'creadate', 'modidate'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [
        'password',
    ];

    public $timestamps = false;

    /**
     * Get the user that owns the dailyactivity.
     */

    public function Schedule() {
        return $this->hasMany(Schedule::class, 'id_user');
    }

    public function Assignment() {
        return $this->hasMany(Assignment::class, 'id_user');
    }

    public function DailyActivity() {
        return $this->hasMany(DailyActivity::class, 'id_user');
    }
}
