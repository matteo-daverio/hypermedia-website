//set the right size of the slider so that the footer is hidden right after the window bottom
var windowHeight = $(window).height();
var windowWidth = $(window).width();
var headerHeight = $('#header').height();

//According to the screen dim we provide an ad hoc picture
    setSliderImage();
    setSliderAttributes();

//when page is complete select the current item of the menu
$("document").ready(function(){ 
    
    windowHeight = $(window).height();
    windowWidth = $(window).width();
    $('#menu_index').addClass('current');
}); 

//Represent the margin (0,e) in which resize is not performed
var epsilon = 0.1;

//set the right size of the slider so that the footer is hidden right after the window bottom when the page is resized
jQuery(window).resize(function () {
    
    //This is to fix the mobie bug and to fix the full screen bug
    if( 
        (Math.abs( (windowHeight - $(window).height()) / (windowHeight + $(window).height())) < epsilon &&
        Math.abs( (windowWidth - $(window).width()) / (windowWidth + $(window).width())) < epsilon ) && 
        Math.abs( (windowHeight - $(window).height()) / (windowHeight + $(window).height())) !== 0 &&
        Math.abs( (windowWidth - $(window).width()) / (windowWidth + $(window).width())) !== 0 
        ){
        return;
    }
    
    //This is to fix the bug for the bobile version
    if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) 
       && windowWidth === $(window).width()){
        return;
    }else{
        windowWidth = $(window).width();
    }
     
    var headerHeight = $('#header').height();
    
    setSliderImage();
    setSliderAttributes();

});

function setSliderAttributes(){
    $("#slider").attr("data-height-lg", $(window).height() - headerHeight);
    $("#slider").attr("data-height-md", $(window).height() - headerHeight);
    $("#slider").attr("data-height-sm", $(window).height() - headerHeight);
    $("#slider").attr("data-height-xs", $(window).height() - headerHeight);
    $("#slider").attr("data-height-xxs", $(window).height() - headerHeight);
}
//According to the screen dim we provide an ad hoc picture
function setSliderImage(){
    
    if($(window).height() > $(window).width()){
        $("#slider").attr("style", style="background: url('images/home/mobile_sfondo.png') no-repeat; background-size: cover");
    }else{
        $("#slider").attr("style", style="background: url('images/home/sfondo.jpg') no-repeat; background-size: cover");
    }
}

