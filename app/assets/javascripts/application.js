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
//= require lib/progressbar
//= require gmaps/google
//= require lib/masked-input
//= require lib/timepicki
//= require tablesort
//= require_tree .



// var line = new ProgressBar.Line('#container');
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
  $('.menu .item').tab();
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


$(document).ready(function() {


  var bar1 = new ProgressBar.Line(container1, {
    strokeWidth: 4,
    easing: 'easeInOut',
    duration: 1400,
    color: '#FFEA82',
    trailColor: '#eee',
    trailWidth: 1,
    svgStyle: {width: '100%', height: '100%'},
    from: {color: '#3498db'},
    to: {color: '#3498db'},
    step: (state, bar) => {
      bar.path.setAttribute('stroke', state.color);
    }
  });

  var bar2 = new ProgressBar.Line(container2, {
    strokeWidth: 4,
    easing: 'easeInOut',
    duration: 1400,
    color: '#FFEA82',
    trailColor: '#eee',
    trailWidth: 1,
    svgStyle: {width: '100%', height: '100%'},
    from: {color: '#8e44ad'},
    to: {color: '#8e44ad'},
    step: (state, bar) => {
      bar.path.setAttribute('stroke', state.color);
    }
  });

  var bar3 = new ProgressBar.Line(container3, {
    strokeWidth: 4,
    easing: 'easeInOut',
    duration: 1400,
    color: '#FFEA82',
    trailColor: '#eee',
    trailWidth: 1,
    svgStyle: {width: '100%', height: '100%'},
    from: {color: '#27ae60'},
    to: {color: '#27ae60'},
    step: (state, bar) => {
      bar.path.setAttribute('stroke', state.color);
    }
  });

  var bar4 = new ProgressBar.Line(container4, {
    strokeWidth: 4,
    easing: 'easeInOut',
    duration: 1400,
    color: '#FFEA82',
    trailColor: '#eee',
    trailWidth: 1,
    svgStyle: {width: '100%', height: '100%'},
    from: {color: '#34495e'},
    to: {color: '#34495e'},
    step: (state, bar) => {
      bar.path.setAttribute('stroke', state.color);
    }
  });

  // Number from 0.0 to 1.0, this act as a %
  bar1.animate(1.0);  
  bar2.animate(1.0);  
  bar3.animate(1.0);  
  bar4.animate(1.0);  


});