//when page is complete select the current item of the menu
$("document").ready(function() { 
    $('#menu_assistenza').addClass('current');
    placeFooter();
});

// position the footer in the end of the page
function placeFooter() {
    $('#footer').css({ 'margin-top': 0 });
    var windowH = $(window).height();
    var wrapperH = $('#header').height() + $('#page_title').height() + $('#content').height();
    if( windowH > wrapperH ) {
        $('#footer').css({ 'margin-top': ( windowH - wrapperH ) });        
    }
    //when page is complete select the current item of the menu
    $("document").ready(function(){ $('#menu_highlights').addClass('current');}); 
}