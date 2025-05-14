@extends('layouts.app')

@section('content')
<div class="container">
    <h4 class="text-center">Manage Time Table</h4>
       
    <form method="POST" action="{{ route('timetable.manage') }}">
        @csrf
        <h6 class="text">Select Class</h6>
        <select name="classes" class="form-control mb-3">
            @for ($i = 1; $i <= 7; $i++)
                <option value="{{ $i }}">{{ $i }}</option>
            @endfor
        </select>
        <span>
            @error('classes')
            <!-- <div class="alert alert-danger">{{ $message }}
                </div> -->
                <small class="text-danger">{{ $message }}</small>
            @enderror
         </span>
        <div><input type="submit" value="Manage" class="btn btn-success mt-0"></div>
        
    </form>

    <h4 class="text-center mt-4">Create Time Table</h4>

    <form action="{{ route('logout') }}" method="POST">
        @csrf
        <button type="submit" class="btn btn-danger mb-2">Logout</button>
    </form>

    <form method="POST" action="{{ route('timetable.store') }}">
        @csrf
        <input type="text" name="class" class="form-control mb-3" placeholder="Class" required>
        <input type="number" name="no_of_days" class="form-control mb-3" placeholder="No. of days" required>
        <input type="number" name="no_of_periods" class="form-control mb-3" placeholder="No. of periods" required>
        <input type="time" name="time" class="form-control mb-3" required>
        <input type="number" name="p_duration" class="form-control mb-3" placeholder="Duration per class (In mins)" required>

        <h6 class="text">No of Breaks</h6>
        <select id="dropdown" name="break" class="form-control mb-3">
            <option value="" selected disabled>Select a Breaks</option>
            @for ($i = 1; $i <= 3; $i++)
                <option value="{{ $i }}">{{ $i }}</option>
            @endfor
        </select>

        <div id="textboxDiv" class="mt-2"></div>

        <input type="submit" value="SUBMIT" class="btn btn-primary mt-2 mb-4">
    </form>
</div>

<script>
$(document).ready(function() {
    $("#dropdown").change(function() {
        var selVal = $(this).val();
        var html = '';
        for (var i = 1; i <= selVal; i++) {
            html += 'Break ' + i + ': After period <input type="text" name="break_after_' + i + '" class="form-control mb-3" required>';
            html += 'Break duration (in mins) <input type="text" name="break_duration_' + i + '" class="form-control mb-3" required><br>';
        }
        $("#textboxDiv").html(html);
    });
});
</script>
@endsection
