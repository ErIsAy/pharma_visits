var date_range_picker;
date_range_picker = function() {
  $('.date-range-picker').each(function(){
    $(this).daterangepicker({
        timePicker: true,
        timePickerIncrement: 15,
        alwaysShowCalendars: true,
        locale: {
                applyLabel: 'Aplicar',
                cancelLabel: 'Cancelar',
                fromLabel: 'Desde',
                toLabel: 'Hasta',
                weekLabel: 'S',
                customRangeLabel: 'Rango'}
    }, function(start, end, label) {
      $('.start_hidden').val(start.format('YYYY-MM-DD hh:mm'));
      $('.end_hidden').val(end.format('YYYY-MM-DD hh:mm'));
    });
  })
};

// $(document).ready(date_range_picker);
$(document).on('turbolinks:load', date_range_picker);
