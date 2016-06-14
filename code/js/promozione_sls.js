//when page is complete select the current item of the menu
$("document").ready(function(){ $('#menu_promozioni').addClass('current');}); 


//load the shared js file to do an ajax request and fill the page with the result
$.getScript('js/sls_shared.js', function()
{
    asyncAjaxRequestSlsPromotion();
});   