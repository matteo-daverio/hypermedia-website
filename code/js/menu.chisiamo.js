//// the following 3 rows are shared in the js of each page with different parameters
//load the shared menu 
$("#header").load("shared-menu.html");
//load the shared footer
$("#footer").load("shared-footer.html");
//when page is complete select the current item of the menu
$("document").ready(function(){ $('#menu_chisiamo').addClass('current');}); 

//allow to change the class of the manu in the smart life service menu
var selector = '.nav li';
$(selector).on('click', function(){
    $(selector).removeClass('active');
    $(this).addClass('active');
});