//// the following 3 rows are shared in the js of each page with different parameters
//load the shared menu 
$("#header").load("shared-menu.html");
//load the shared footer
$("#footer").load("shared-footer.html");
//when page is complete select the current item of the menu
$("document").ready(function(){ $('#menu_smartlife').addClass('current');}); 

//get the pars
var parametersMap = getParameters();
//select the category of sls 
var categ = parametersMap['categoria'];


//load the shared js file to do an ajax request and fill the page with the result
$.getScript('js/sls_shared.js', function()
{
    //change the title in the page based on the category
    $("#sls_list_title").text(getTitlePageFromCategory(categ,false));
    $("#sls_list_bartitle").text(getTitlePageFromCategory(categ,true));
    
    //do the async request for all the smart life services filtered by the category
    asyncAjaxRequestSls(categ);
});

/*********************************************************************/
/**************  PARAMETERS PARSER HELPER FUNCTION   *****************/
/*********************************************************************/

//In our website the parameters must be separed by & example id=1&name=Iphone
function getParameters(){
    
    var parametersMap = {};
    
    var query = window.location.search.substring(1);
    
    var parameterList = query.split("&");
    
    for(var i = 0; i < parameterList.length; i++) {
        var pair = parameterList[i].split("=");
        
        parametersMap[pair[0]] = pair[1];
    }
    return parametersMap;
}

       
       
       
       
       