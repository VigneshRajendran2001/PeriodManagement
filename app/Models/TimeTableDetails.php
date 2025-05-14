<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;

class TimeTableDetails extends Model
{
    use HasFactory,Notifiable,SoftDeletes;

     protected $fillable = [
        'user_id',
        'time_table_id',
        'day',
        'period_index',
        'subject',
        'teacher',
    ];

        public function timetable()
    {
        return $this->belongsTo(TimeTable::class);
    }
}
