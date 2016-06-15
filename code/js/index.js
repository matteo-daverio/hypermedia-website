//set the right size of the slider so that the footer is hidden right after the window bottom
var windowHeight = $(window).height();
var headerHeight = $('#header').height();

console.log($(window).height());
console.log($(window).width());
console.log($(window).height() > $(window).width());

if($(window).height() > $(window).width()){
    $("#slider").attr("style", style="background: url('images/home/mobile_sfondo.png') no-repeat; background-size: cover");
}else{
    $("#slider").attr("style", style="background: url('images/home/sfondo.jpg') no-repeat; background-size: cover");
}

$("#slider").attr("data-height-lg", windowHeight - headerHeight);
$("#slider").attr("data-height-md", windowHeight - headerHeight);
$("#slider").attr("data-height-sm", windowHeight - headerHeight);
$("#slider").attr("data-height-xs", windowHeight - headerHeight);
$("#slider").attr("data-height-xxs", windowHeight - headerHeight);




console.log(windowHeight);
console.log(headerHeight);
console.log(windowHeight - headerHeight);

//set the right size of the slider so that the footer is hidden right after the window bottom when the page is resized TODO, refix
jQuery(window).resize(function () {
    console.log("Resize");
   var windowHeight = $(window).height();
var headerHeight = $('#header').height();
    
if($(window).height() > $(window).width()){
    $("#slider").attr("style", style="background: url('images/home/mobile_sfondo.png') no-repeat; background-size: cover");
    
}else{
    $("#slider").attr("style", style="background: url('images/home/sfondo.jpg') no-repeat; background-size: cover");
}
    
$("#slider").attr("data-height-lg", windowHeight - headerHeight);
$("#slider").attr("data-height-md", windowHeight - headerHeight);
$("#slider").attr("data-height-sm", windowHeight - headerHeight);
$("#slider").attr("data-height-xs", windowHeight - headerHeight);
$("#slider").attr("data-height-xxs", windowHeight - headerHeight);



});

//when page is complete select the current item of the menu
$("document").ready(function(){ $('#menu_index').addClass('current');}); 