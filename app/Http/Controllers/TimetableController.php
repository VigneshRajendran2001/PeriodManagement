<?php

namespace App\Http\Controllers;

use App\Models\TimeTable;
use App\Models\TimeTableDetails;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TimetableController extends Controller
{
    public function index() {
        return view('timetable.index');
    }


     public function store(Request $request) {

        $request->validate([
            'class' => 'required|string',
            'no_of_days' => 'required|integer|min:1|max:7',
            'no_of_periods' => 'required|integer|min:1',
            'time' => 'required',
            'p_duration' => 'required|integer|min:1',
            'break' => 'nullable|integer',
        ]);

        $breakDetails = [];

        for ($i = 1; $i <= $request->break; $i++) {
            $breakDetails[] = [
                'after_period' => $request->input('break_after_' . $i),
                'duration' => $request->input('break_duration_' . $i),
            ];
        }

        $timetable = TimeTable::create([
            'user_id' => Auth::id(),
            'class' => $request->class,
            'no_of_days' => $request->no_of_days,
            'no_of_periods' => $request->no_of_periods,
            'start_time' => $request->time,
            'period_duration' => $request->p_duration,
            'breaks' => $request->break ?? 0,
            'break_details' => $breakDetails,
        ]);

        return redirect()->route('timetable.view', $timetable->id);
    }

     public function manage(Request $request)
    {
        $request->validate([
            'classes' => 'required|integer'
        ]);

        $userId = Auth::id();
        $class = $request->input('classes');

        $timetable = TimeTable::where('user_id', $userId)->where('class', $class)->with('cells')->orderby('id','desc')->first();

        if (!$timetable) {
            return back()->withErrors(['classes' => 'Timetable not found for selected class']);
        }

        $allDays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
        $weekdays = array_slice($allDays, 0, $timetable->no_of_days);

        $startTime = Carbon::parse($timetable->start_time);
        $breaks = $timetable->break_details ?? [];

        $breakIndex = 0;
        $periods = [];
        for ($i = 1; $i <= $timetable->no_of_periods; $i++) {
            $endTime = $startTime->copy()->addMinutes($timetable->period_duration);
            $periods[] = [
                'type' => 'period',
                'label' => "Period $i",
                'time' => $startTime->format('H:i') . ' to ' . $endTime->format('H:i'),
            ];

            $startTime = $endTime;

            if ($breakIndex < count($breaks) && $breaks[$breakIndex]['after_period'] == $i) {
                $breakEnd = $startTime->copy()->addMinutes($breaks[$breakIndex]['duration']);
                $periods[] = [
                    'type' => 'break',
                    'label' => "Break " . ($breakIndex + 1),
                    'time' => $startTime->format('H:i') . ' to ' . $breakEnd->format('H:i'),
                ];
                $startTime = $breakEnd;
                $breakIndex++;
            }
        }

        $cellData = $timetable->cells->groupBy(['day', 'period_index']);
        return view('timetable.view', compact('timetable', 'weekdays', 'periods','cellData'));
    }


    public function view($id)
    {
        $timetable = TimeTable::where('id', $id)->where('user_id', auth()->id())->firstOrFail();

        $allDays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
        $weekdays = array_slice($allDays, 0, $timetable->no_of_days);

        $startTime = Carbon::parse($timetable->start_time);
        $periods = [];
        $breaks = $timetable->break_details ?? [];

        $breakIndex = 0;

        for ($i = 1; $i <= $timetable->no_of_periods; $i++) {
            $endTime = $startTime->copy()->addMinutes($timetable->period_duration);
            $periods[] = [
                'type' => 'period',
                'label' => "Period $i",
                'time' => $startTime->format('H:i') . ' to ' . $endTime->format('H:i'),
            ];

            $startTime = $endTime;

            if ($breakIndex < count($breaks) && $breaks[$breakIndex]['after_period'] == $i) {
                $breakEnd = $startTime->copy()->addMinutes($breaks[$breakIndex]['duration']);
                $periods[] = [
                    'type' => 'break',
                    'label' => "Break " . ($breakIndex + 1),
                    'time' => $startTime->format('H:i') . ' to ' . $breakEnd->format('H:i'),
                ];
                $startTime = $breakEnd;
                $breakIndex++;
            }
        }

        $cellData = $timetable->cells->groupBy(['day', 'period_index']);
        return view('timetable.view', compact('timetable', 'weekdays', 'periods','cellData'));
    }

   
        public function update(Request $request)
    {
        
        $request->validate([
            'time_table_id' => 'required|exists:time_tables,id',
            'day' => 'required|string',
            'period_index' => 'required|integer',
            'subject' => 'required|string',
            'teacher' => 'required|string',
        ]);

        $detail = TimeTableDetails::updateOrCreate(
            [
                'user_id' => Auth::id(),
                'time_table_id' => $request->time_table_id,
                'day' => $request->day,
                'period_index' => $request->period_index,
            ],
            [
                'subject' => $request->subject,
                'teacher' => $request->teacher,
            ]
        );

            return response()->json([
            'status' => 'success',
            'message' => 'Timetable updated successfully.',
            'data' => $detail,
        ], 200); 
    }

}
