//set the right size of the slider so that the footer is hidden right after the window bottom
var windowHeight = $(window).height();
var headerHeight = $('#header').height();
$("#slider").attr("data-height-lg", windowHeight - headerHeight);

//set the right size of the slider so that the footer is hidden right after the window bottom when the page is resized TODO, refix
jQuery(window).resize(function () {
   var windowHeight = $(window).height();
var headerHeight = $('#header').height();
$("#slider").attr("data-height-lg", windowHeight - headerHeight);});

//when page is complete select the current item of the menu
$("document").ready(function(){ $('#menu_index').addClass('current');}); 