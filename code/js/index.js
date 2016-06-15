//set the right size of the slider so that the footer is hidden right after the window bottom
var windowHeight = $(window).height();
var windowWidth = $(window).width();
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

var epsilon = 0.1;

//set the right size of the slider so that the footer is hidden right after the window bottom when the page is resized TODO, refix
jQuery(window).resize(function () {
    console.log("Resize");

    console.log(Math.abs( (windowHeight - $(window).height()) / (windowHeight + $(window).height())));
    console.log(Math.abs( (windowWidth - $(window).width()) / (windowWidth + $(window).width())));
    
    if( 
        (Math.abs( (windowHeight - $(window).height()) / (windowHeight + $(window).height())) < epsilon &&
        Math.abs( (windowWidth - $(window).width()) / (windowWidth + $(window).width())) < epsilon ) && 
        Math.abs( (windowHeight - $(window).height()) / (windowHeight + $(window).height())) !== 0 &&
        Math.abs( (windowWidth - $(window).width()) / (windowWidth + $(window).width())) !== 0 
        ){
        return;
    }
    
    if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) 
       && windowWidth === $(window).width()){
        return;
    }else{
        windowWidth = $(window).width();
    }
    
    
   
    var headerHeight = $('#header').height();
    
if($(window).height() > $(window).width()){
    $("#slider").attr("style", style="background: url('images/home/mobile_sfondo.png') no-repeat; background-size: cover");
    
}else{
    $("#slider").attr("style", style="background: url('images/home/sfondo.jpg') no-repeat; background-size: cover");
}
    
$("#slider").attr("data-height-lg", $(window).height() - headerHeight);
$("#slider").attr("data-height-md", $(window).height() - headerHeight);
$("#slider").attr("data-height-sm", $(window).height() - headerHeight);
$("#slider").attr("data-height-xs", $(window).height() - headerHeight);
$("#slider").attr("data-height-xxs", $(window).height() - headerHeight);



});

//when page is complete select the current item of the menu
$("document").ready(function(){ 
    
    windowHeight = $(window).height();
    windowWidth = $(window).width();
    $('#menu_index').addClass('current');
}); 


