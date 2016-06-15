var windowHeight = $(window).height();
var windowWidth = $(window).width();
var epsilon = 0.1;

//when page is complete select the current item of the menu
$("document").ready(function() { 
    $('#menu_assistenza').addClass('current');
    placeFooter();
});

jQuery(window).resize(function () {
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
    placeFooter();
});

// position the footer in the end of the page
function placeFooter() {
    $('#footer').css({ 'margin-top': 0 });
    windowHeight = $(window).height();
    windowWidth = $(window).width();
    var windowH = $(window).height();
    var wrapperH = $('#header').height() + $('#page_title').height() + $('#content').height();
    if( windowH > wrapperH ) {
        $('#footer').css({ 'margin-top': ( windowH - wrapperH ) });        
    }
    //when page is complete select the current item of the menu
    $("document").ready(function(){ $('#menu_highlights').addClass('current');}); 
}