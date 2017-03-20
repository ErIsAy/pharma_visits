// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require lib/underscore-min
//= require turbolinks
//= require dist/semantic
//= require lib/momentjs/moment
//= require lib/fullcalendar/fullcalendar
//= require lib/daterangepicker
//= require lib/calendar
//= require gmaps/google
//= require lib/masked-input
//= require lib/timepicki
//= require tablesort
//= require_tree .

/************fadeOut messages ***********/
$(function() {
  return $(".message.closable .close.icon").on("click", function() {
    $('.message.closable').fadeOut("slow");
    return false;
  });

});
/****************************************/

/****************sidebar*****************/
$( "#sidebar-toggle" ).click(function() {
  $('.ui.labeled.icon.sidebar')
  .sidebar('toggle');
});
/****************************************/

/************ Initializers **************/
$( document ).ready(function() {
  // gmap_form(null);    // form map for new view (print nothing with possibility of put marker)
  // gmap_show(center);    // init show map for center card (only print marker)

  $('.ui.dropdown').dropdown();
  $('table').tablesort()
  $("#notice_center" ).fadeOut(5000);
  $('.datepicker').datepicker();
  // $('.datetimepicker').datetimepicker();
  // $.datetimepicker.setLocale('es');
  $('#planning_date_visit').calendar( {
    type: 'date',
    text: {
      days: ['Do', 'L', 'M', 'Mi', 'J', 'V', 'S'],
      months: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
      monthsShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
    }
  });

  $('#birthday_cal').calendar( {
    type: 'date',
    text: {
      days: ['Do', 'L', 'M', 'Mi', 'J', 'V', 'S'],
      months: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
      monthsShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
    }
  });

});

/****************************************/
