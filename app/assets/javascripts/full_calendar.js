var initialize_calendar;
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
      eventLimit: false,
      displayEventTime: true,
      timeFormat: 'hh:mm a',
      events: '/events.json',

      select: function(start, end) {
        $.getScript('/events/new', function() {
          $('.date-range-picker').val(moment(start).format("MM/DD/YYYY hh:mm") + ' - ' + moment(end).format("MM/DD/YYYY hh:mm"))
          date_range_picker();
          $('.start_hidden').val(moment(start).format('YYYY-MM-DD hh:mm'));

          $('.end_hidden').val(moment(end).format('YYYY-MM-DD hh:mm'));
        });

        calendar.fullCalendar('unselect');
      },
      eventDrop: function(event, delta, revertFunc) {
           event_data = {
             event: {
               id: event.id,
               start: event.start.format(),
               end: event.end.format()
             }
           };
           $.ajax({
               url: event.update_url,
               data: event_data,
               type: 'PATCH'
           });
         },
//"MM/DD/YYYY h:mm A"
      eventClick: function(event, jsEvent, view) {
        $.getScript(event.edit_url, function() {
          $('.date-range-picker').val(moment(event.start).format("MM/DD/YYYY hh:mm") + ' - ' + moment(event.end).format("MM/DD/YYYY hh:mm"))
          date_range_picker();
          $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD hh:mm'));
          $('.end_hidden').val(moment(event.end).format('YYYY-MM-DD hh:mm'));
        });
       }
    });
  })
};
// $(document).on('load', initialize_calendar)

$(document).on('turbolinks:load', initialize_calendar);

// $(document).ready(initialize_calendar);
