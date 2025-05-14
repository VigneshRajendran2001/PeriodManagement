@extends('layouts.app')

@section('content')
<div class="container">
    <h4 class="text-center" style="font-family: sans-serif;">Timetable for Class {{ $timetable->class }}</h4>

      <div class="d-flex justify-content-between mb-2">      
        <form action="{{ route('logout') }}" method="POST">
            @csrf
            <button type="submit" class="btn btn-danger">Logout</button>
        </form>

        <a href="{{ url()->previous() }}" class="btn btn-info">Go Back</a>
     </div>


   <table class="table table-bordered table-striped text-center">
    <thead>
        <tr>
            <th style="font-family: sans-serif;">Weekdays</th>
            @foreach($periods as $key => $period)
                <th style="font-family: sans-serif;font-size:smaller">
                    {{ $period['label'] }}<br>
                    <b>{{ $period['time'] }}</b>
                </th>
            @endforeach
        </tr>
    </thead>
    <tbody>
        @foreach($weekdays as $day)
           
            <tr>
                <td rowspan="2" style="vertical-align: middle !important;font-weight:bold;font-family: sans-serif;padding:0.35rem !important">
                    {{ $day }}
                </td>
                @foreach($periods as $index => $period)
                    @if($period['type'] === 'period')
                        @php
                            $cell = $cellData[$day][$index][0] ?? null;
                        @endphp
                        <td>
                            <div id="subject-{{ $day }}-{{ $index }}" class="editable-cell" style="cursor:pointer;"
                                 data-day="{{ $day }}" data-period_index="{{ $index }}"
                                 data-period_label="{{ $period['label'] }}" data-period_time="{{ $period['time'] }}">
                                <small><strong>{{ $cell ? $cell->subject : '-' }}</strong></small>
                            </div>
                        </td>
                    @else
                        <td style="vertical-align: middle !important;font-family: sans-serif;"><strong>Break</strong></td>
                    @endif
                @endforeach
            </tr>

            
            <tr>
                @foreach($periods as $index => $period)
                    @if($period['type'] === 'period')
                        @php
                            $cell = $cellData[$day][$index][0] ?? null;
                        @endphp
                        <td>
                            <div id="teacher-{{ $day }}-{{ $index }}" class="editable-cell" style="cursor:pointer;"
                                 data-day="{{ $day }}" data-period_index="{{ $index }}"
                                 data-period_label="{{ $period['label'] }}" data-period_time="{{ $period['time'] }}">
                                <small><strong>{{ $cell ? $cell->teacher : '-' }}</strong></small>
                            </div>
                            
                        </td>
                    @else
                        <td></td> 
                    @endif
                @endforeach
            </tr>
        @endforeach
    </tbody>
</table>

</div>

<!-- Modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel">
  <div class="modal-dialog" role="document">
    <form id="editForm">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title"><b>Assign Subject & Period</b></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">
             <span>&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <input type="hidden" id="modal-day">
          <input type="hidden" id="modal-period-index">

          <div class="col-8 mb-3">
            <label><b>Subject Name</b><span class="text-danger">*</span> </label>
            <input type="text" id="modal-subject" class="form-control" required>
          </div>
          <div class="col-8 mb-3">
            <label><b>Teacher Name</b><span class="text-danger">*</span></label>
            <input type="text" id="modal-teacher" class="form-control" required>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Save</button>
          <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
        </div>
      </div>
    </form>
  </div>
</div>
@endsection

@section('scripts')
<script>
   $(document).ready(function () {
    let currentDay, currentPeriodIndex;

    $('.editable-cell').on('click', function () {
        currentDay = $(this).data('day');
        currentPeriodIndex = $(this).data('period_index');
        const subject = $(this).find('strong').text().trim();
        const teacher = $(this).find('small').text().trim();

        $('#modal-subject').val(subject);
        $('#modal-teacher').val(teacher);
        $('#modal-day').val(currentDay);
        $('#modal-period-index').val(currentPeriodIndex);

        $('#editModal').modal('show');
    });

    $('#editForm').on('submit', function (e) {
        e.preventDefault();

        const subject = $('#modal-subject').val();
        const teacher = $('#modal-teacher').val();

        $.ajax({
            url: '/timetable/update',
            type: 'POST',
            data: {
                _token: $('meta[name="csrf-token"]').attr('content'),
                time_table_id: {{ $timetable->id }},
                day: currentDay,
                period_index: currentPeriodIndex,
                subject: subject,
                teacher: teacher
            },
            success: function (data) {
                if (data.status === 'success') {
                    $('#editModal').modal('hide');

                    $(`#subject-${currentDay}-${currentPeriodIndex}`).html(`
                        <small><strong>${subject}</strong></small>
                    `);


                    $(`#teacher-${currentDay}-${currentPeriodIndex}`).html(`
                        <small><strong>${teacher}</strong></small>
                    `);

                } else {
                    alert(data.message);
                }
            },
            error: function () {
                alert('An error occurred. Please try again.');
            }
        });
    });
});
</script>

@endsection
