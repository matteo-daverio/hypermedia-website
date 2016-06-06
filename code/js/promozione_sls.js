//// the following 3 rows are shared in the js of each page with different parameters
//load the shared menu 
$("#header").load("shared-menu.html");
//load the shared footer
$("#footer").load("shared-footer.html");
//when page is complete select the current item of the menu
$("document").ready(function(){ $('#menu_promozioni').addClass('current');}); 


//load the shared js file to do an ajax request and fill the page with the result
$.getScript('js/sls_shared.js', function()
{
    asyncAjaxRequestSlsPromotion();
});   