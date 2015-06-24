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
//= require_tree .
//= require bootstrap.min
//= require realtime_validations
//= require bootstrap.min
//= require admin-lte
//= require jsapi
//= require chartkick
//= require underscore
//= require gmaps/google


$(document).ready(function () {
    //
    var colorObject = {
        "Steps taken":"bg-olive",
        "Calories burned":"bg-orange",
        "Sleep":"bg-blue",
        "Distance covered":"bg-purple",
        "Weight decrease":"bg-teal",
        "Weight increase":"bg-aqua",
        "Heart Rate":"bg-red"
    };
    $(".box-title").each(function (){
        $(this).parent().addClass(colorObject[$(this).html()]);
    });

    $('.percentage').each(function(){
        var percentage;
        if($(this).hasClass("badge")){
            percentage = $(this).html();
            percentage = parseInt(percentage.substring(0, percentage.length - 1));
        }
        else{
            var fullBar = $(".progress").width();
            percentage = Math.round(parseInt($(this).css("width"))/fullBar*100);
        }
        if(percentage > 80){
            $(this).addClass('bg-green');
        }
        else if(percentage > 50){
            $(this).addClass('bg-blue');
        }
        else if(percentage > 40){
            $(this).addClass('bg-yellow');
        }
        else{
            $(this).addClass('bg-red');
        }
    });


});