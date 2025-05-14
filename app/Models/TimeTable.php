<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;

class TimeTable extends Model
{
    use HasFactory,Notifiable,SoftDeletes;

    protected $fillable = [
        'user_id',
        'class',
        'no_of_days',
        'no_of_periods',
        'start_time',
        'period_duration',
        'breaks',
        'break_details',
    ];

    protected $casts = [
        'break_details' => 'array',
    ];


        public function user()
    {
        return $this->belongsTo(User::class);
    }

        public function cells()
    {
        return $this->hasMany(TimeTableDetails::class);
    }

}
