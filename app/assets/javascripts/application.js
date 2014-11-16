// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require_tree .


$(document).ready(function(){
	$('#create_new_post').click(function(){
	  $('#create_new_post_model').modal()
	});

	function adjust_window(){
    var winW = $(window).width();
    $('.user_show_cover_photo').css('width',winW);
   }
   adjust_window();
   $(window).resize(function(){
    adjust_window();
   });
   
   // to set back ground color of left nav bar in user#show
   var user_show_hidden_color = $('#hidden_color_field').val();
   $('.user_show_left_nav').css('color',user_show_hidden_color);
   $('.user_show_left_nav_1').css('background-color',user_show_hidden_color).css('color','#ffffff');
});



