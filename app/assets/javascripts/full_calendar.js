var initialize_calendar
initialize_calendar = function() {
  $('.calendar-main').each(function(){
    var calendar = $(this)
    calendar.fullCalendar({
      lang: 'es',
      header: {
          left:   'today prev,next',
          center: 'title',
          right:  'month, agendaWeek, agendaDay'
      },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true
    });
  })
};
// $(document).on('load', initialize_calendar)


$(document).ready(initialize_calendar);
