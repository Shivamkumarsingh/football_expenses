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
//= require turbolinks
//= require bootstrap-sprockets
//= require jquery.growl
//= require bootstrap-datepicker
//= require_tree .

function flashMsg(message, type, options){
  var params = {message: message};

  if(options && options.title){
    params.title = options.title
  }

  if(!params.title){
    params.title = ''
  }

  if(type == 'error'){
    $.growl.error(params);
  }else if(type == 'warning'){
    $.growl.warning(params);
  }else if(type == 'notice'){
    $.growl.notice(params);
  }else{
    $.growl(params);
  }
}

$.fn.datepicker.defaults.format = "dd/mm/yyyy";
