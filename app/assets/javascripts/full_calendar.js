var initialize_calendar;
initialize_calendar = function() {
  $('.calendar-main').each(function(){
    var calendar = $(this)
    calendar.fullCalendar({
      locale: 'es',
      header: {
          left:   'today prev,next',
          center: 'title',
          right:  'month, listWeek, listDay'
      },
      views: {
        listDay: {
          buttonText: 'Día'
        },
        listWeek: {
          buttonText: 'Semana'
        },
        listMonth: {
          buttonText: 'list month'
        },
        listYear: {
          buttonText: 'list year'
        }
      },
      selectable: false,
      selectHelper: true,
      editable: true,
      eventLimit: false,
      displayEventTime: false,
      timeFormat: 'hh:mm a',
      events: '/events/index.json',

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
              //  id: planning.id,
              //  start: planning.date_visit.format(),
              //  end: planning.date_visit.format(),
              //  date_visit: planning.date_visit.format()
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
        console.log(event);
        window.location.href = event.update_url
        $.getScript(event.edit_url, function() {
          // $('#edit_event').modal('show');
          // $('#remote_container').html('<%= j render "edit" %>');
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

// $(document).on('turbolinks:load', initialize_calendar);

$(document).ready(initialize_calendar);
