//// the following 3 rows are shared in the js of each page with different parameters
//load the shared menu 
$("#header").load("shared-menu.html");
//load the shared footer
$("#footer").load("shared-footer.html");


//async ajax request
$("document").ready(function(){
    //select the right text in the menu
    $('#menu_prodotti').addClass('current');
});




