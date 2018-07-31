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
//= require datetimepicker
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
//= require lib/raphaeljs/raphael
//= require lib/morrisjs/morris
//= require_tree .

$('.menu .item').tab();




// initialize all progress bar
$('.progress-bar').each(function(){
  $(this).progress({
    label: 'ratio',
    text: {
      ratio: '{total}'
    }
  });
});

// $('#example1').progress();

// var progressBar = function(){

// };

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

$('#edit_nota').click(function () {
  $('.note_modal').modal('show');
});

$('#red_info').click(function () {
  $('.red_modal').modal('show');
});

$('#green_info').click(function () {
  $('.green_modal').modal('show');
});

$('#orange_info').click(function () {
  $('.orange_modal').modal('show');
});
$('#blue_info').click(function () {
  $('.blue_modal').modal('show');
});

$('.ui.dropdown').dropdown();

$("#register-users").dropdown({
  onChange: function(value, text, $selected) {
    // $('.ui.tab').tab('change tab', text);
    var elems = document.querySelectorAll(".ui.tab");
    [].forEach.call(elems, function(el) {
      el.classList.remove("active");
      console.log('tab_changed');
    });
    document.querySelectorAll(`[data-tab='${text}']`)[0].classList.add("active");
    console.log(text);

    $('.scrollx').each(function(index, el) {
      el.scrollTop = 50;
    });

  }
});

/************ Initializers **************/
$( document ).ready(function() {
  $('.ui.radio.checkbox').checkbox({
    onChange: function () {
      
      if(this.id === 'ce1') {
        console.log('doctor');
        $('.e1').removeClass("disabled");
        $('.e2').dropdown('clear');
        $('.e2').addClass("disabled");
        
      }
      else {
        console.log('farmacia');
        $('.e1').addClass("disabled");
        $('.e1').dropdown('clear');
        $('.e2').removeClass("disabled");
      }

    }
  });

  $('.ui.accordion').accordion();
  // gmap_form(null);    // form map for new view (print nothing with possibility of put marker)
  // gmap_show(center);    // init show map for center card (only print marker)
  $('.menu .item').tab();
  
  if (window.location.pathname != '/events/index') {
    console.log(window.location.pathname);
    $('table').tablesort();
  }
  
  $("#notice_center" ).fadeOut(5000);
  // $('.datepicker').datepicker();
  $('#datetimepicker').datetimepicker({
    format: 'd/m/Y h:i a',
    locale: 'es'
    // hours12: true
  });
  // $('#datetimepicker').datetimepicker({
  //   i18n: {
  //     de: {
  //       months: [
  //         'Januar', 'Februar', 'März', 'April',
  //         'Mai', 'Juni', 'Juli', 'August',
  //         'September', 'Oktober', 'November', 'Dezember',
  //       ],
  //       dayOfWeek: [
  //         "So.", "Mo", "Di", "Mi",
  //         "Do", "Fr", "Sa.",
  //       ]
  //     }
  //   },
  //   timepicker: true,
  //   format: 'd/m/Y H:i'
  // });

  // $.datetimepicker.setLocale('es');
  $('#planning_date_visit').calendar( {
    type: 'date',
    formatter: {
      date: function (date, settings) {
          if (!date) return '';
          var day = date.getDate();
          var month = date.getMonth() + 1;
          var year = date.getFullYear();
          // var hour = date.getHours();
          // var minu = date.getMinutes();
          return day + '/' + month + '/' + year;
      }
    },
    type: 'date',
    text: {
      days: ['Do', 'L', 'M', 'Mi', 'J', 'V', 'S'],
      months: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
      monthsShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
    }
  });
  $('#planning_date_visit_lteq').calendar( {
    type: 'date',
    text: {
      days: ['Do', 'L', 'M', 'Mi', 'J', 'V', 'S'],
      months: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
      monthsShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
    }
  });
  $('#planning_date_visit_gteq').calendar( {
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



