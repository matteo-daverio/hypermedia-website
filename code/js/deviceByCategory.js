//// the following 3 rows are shared in the js of each page with different parameters
//load the shared menu 
$("#header").load("shared-menu.html");
//load the shared footer
$("#footer").load("shared-footer.html");


//select the right text in the menu
$("document").ready(function(){ $('#menu_prodotti').addClass('current');});


//Define the dynamic environment in which we are working
var categoria;

//when the filter is created at each activable row is added an incremental id to haldle the retrive fase



/*********************************************************************/
/******************   AJAX REQUESTS DISPATCHER   *********************/
/*********************************************************************/



    var phpFile = "db/deviceByCategory.php";
    
    var titleMap = { "smartphone_telefoni" : "Smartphone e Telefoni" ,
                     "tablet_computer"     : "Tablet e Computer",
                     "modem_networking"    : "Modem e Networking",
                     "tv_smart_living"     : "Tv e Smart Living",
                     "outlet"              : "Outlet",
                     "all_devices"         : "Promozioni"
                   } 
    
    var parametersMap = getParameters();
    
    categoria = parametersMap['categoria'];//es: smartphone_telefoni
    
    var titleForThePage = titleMap[categoria];
    
    var filter;
    
    if( parametersMap['filter'] !== undefined){
        filter = decodeURI(parametersMap['filter']);
    }else{
        filter = getCookie(categoria);
    }
    
    
    
    
    setPageTitle(titleForThePage);
    
    loadCookieInfoOrderingPreferences("orderingForm");
    
    ajaxFilterComponents(phpFile, categoria, filter);
    
    ajaxGridProduct(phpFile, categoria, filter);

//Helper function to dispatch all the ajax calls for the Filter's Components
function ajaxFilterComponents(phpFile, categoria, filter){
    
     //TODO
    ajaxBrandFilter(phpFile, categoria, filter);
    ajaxCategoryFilter(phpFile, categoria, filter);
    ajaxBuyModeFilter(phpFile, categoria, filter);
    ajaxShowOnlyFilter(phpFile, categoria, filter); 
    ajaxMaxPriceFilter(phpFile, categoria, filter);
    
}

/*********************************************************************/
/************************   AJAX REQUESTS   **************************/
/*********************************************************************/

function helperOrderingNotSpecifiedIntoTheFilter(filter){
    
    var arrayIndexChildActive = getActiveIndexInCookieForThisFatherId("orderingForm");
    var indexSelected = arrayIndexChildActive[0];
    
    if(indexSelected === undefined){
        return filter;
    }
    
    if(filter.indexOf("orderingForm") < 0){
        if(filter === '' && indexSelected !== undefined){
            filter = "[orderingPreference:" + indexSelected + "]";
        }
    }
    
    return filter
}

/*****************   AJAX GRID PRODUCT REQUESTS   ********************/

function ajaxGridProduct(phpFile, categoria, filter){
    
    filter = helperOrderingNotSpecifiedIntoTheFilter(filter);
    
    $.ajax({
        method: "GET",
        //dataType: "json", //type of data
        crossDomain: true,
        url: phpFile, //Relative or absolute path to file.php file
        data: {query: 'gridProducts', categoria: categoria, filter: filter},
        success: function(response) { 
            
            //parse the json and get an array where the index is the row and the .User is the name of the column
            var resultArray = $.parseJSON(response);
            
            if ( resultArray === null ){
                alert("Nessun Prodotto disponibile");
                return;
            }
            
            //Add the html for each device that basically is a row
            for(i = 0; i < resultArray.length ; i++){
                
                divRow = addNewDevice(resultArray[i].id, resultArray[i].nome, resultArray[i].promo, resultArray[i].nuovo, resultArray[i].prezzo, resultArray[i].prezzoScontato, resultArray[i].gridImagePath, categoria);
            }
        
        },
        error: function(request,error)
        {
            console.log(request+":"+error);
        }
    });
}


function ajaxBrandFilter(phpFile, categoria, filter){
    
    $.ajax({
        method: "GET",
        //dataType: "json", //type of data
        crossDomain: true,
        url: phpFile, //Relative or absolute path to file.php file
        data: {query: "brands", categoria: categoria},
        success: function(response) { 
            
            //parse the json and get an array where the index is the row and the .User is the name of the column
            var resultArray = $.parseJSON(response);
            
            //Add the html for each device that basically is a row
            for(i = 0; i < resultArray.length ; i++){
                addNewBrand(resultArray[i].marca, resultArray[i].numero);
            }
            
            loadBrandSelectionsFromCookies(filter);
        },
        error: function(request,error)
        {
            console.log(request+":"+error);
        }
    });
    
    
}




function ajaxBuyModeFilter(phpFile, categoria, filter){
    
    $.ajax({
        method: "GET",
        //dataType: "json", //type of data
        crossDomain: true,
        url: phpFile, //Relative or absolute path to file.php file
        data: {query: "buyMode", categoria: categoria},
        success: function(response) { 
            
            //parse the json and get an array where the index is the row and the .User is the name of the column
            var resultArray = $.parseJSON(response);
            
            //Add the buyMode option in the right filter box
            addBuyMode(resultArray[0].compraloSubitoNumero, resultArray[0].aRateNumero, resultArray[0].aNoleggioNumero, filter);
            
            
            
            
        },
        error: function(request,error)
        {
            console.log(request+":"+error);
        }
    });
    
}


function ajaxShowOnlyFilter(phpFile, categoria, filter){
    
     $.ajax({
        method: "GET",
        //dataType: "json", //type of data
        crossDomain: true,
        url: phpFile, //Relative or absolute path to file.php file
        data: {query: "showMode", categoria: categoria},
        success: function(response) { 
            
            //parse the json and get an array where the index is the row and the .User is the name of the column
            var resultArray = $.parseJSON(response);
                 
            //Add the ahowMode option in the right filter box
            addShowMode(resultArray[0].novitaNumero, resultArray[0].promoNumero, filter);
            
        },
        error: function(request,error)
        {
            console.log(request+":"+error);
        }
    });
    
}


function ajaxCategoryFilter(phpFile, categoria, filter){
    
    $.ajax({
        method: "GET",
        //dataType: "json", //type of data
        crossDomain: true,
        url: phpFile, //Relative or absolute path to file.php file
        data: {query: "specificCategory", categoria: categoria },
        success: function(response) { 
            
            //parse the json and get an array where the index is the row and the .User is the name of the column
            var resultArray = $.parseJSON(response);
            
            //Add the html for each device that basically is a row
            
            //Make no sense to have a filter for only one category
            if(resultArray.length === 1){
                var child = document.getElementById("sottoCategoria");
                document.getElementById("fatherFilterElements").removeChild(child);
                return;
            }
            
            for(i = 0; i < resultArray.length ; i++){
                addNewCategory(resultArray[i].nomeCategoria);
            }
            
            loadCategorySelectionsFromCookies(filter);
        
        },
        error: function(request,error)
        {
            console.log(request+":"+error);
        }
    });
}


function ajaxMaxPriceFilter(phpFile, categoria, filter){
    
    $.ajax({
        method: "GET",
        //dataType: "json", //type of data
        crossDomain: true,
        url: phpFile, //Relative or absolute path to file.php file
        data: {query: "maxPrice", categoria: categoria },
        success: function(response) { 
            
            //parse the json and get an array where the index is the row and the .User is the name of the column
            var resultArray = $.parseJSON(response);
            
            if (resultArray === null){
                return;
            }
            
            var maxPrice = parseInt(resultArray[0].prezzoMax) + parseInt(resultArray[0].prezzoMax* 0.20);
            
            $("#slider-range").slider("option","max", maxPrice);
            $("#slider-range").slider("values", [0, maxPrice]);
            
            
            setSliderCookie(filter);
            
            
        },
        error: function(request,error)
        {
            console.log(request+":"+error);
        }
    });
    
    
    
    
}


/***************************************************************************/
                /* helper functions for the ajax calls*/
/***************************************************************************/

function addNewCategory(nomeCategoria){ 
        
    var liElement = document.createElement("LI");
    liElement.setAttribute("onClick", "javascript:selectFilterRow(this)");
    liElement.setAttribute("id", nomeCategoria);
    
  
    var aElement = document.createElement("A");
    
    //TODO
    aElement.setAttribute("href", "javascript:void(0)");
    
    aElement.innerHTML = nomeCategoria;
    
    liElement.appendChild(aElement);
    
    document.getElementById("sottoCategoria").appendChild(liElement);

}


function addShowMode(novitaNumero, promoNumero, filter){
    
    helperAddShowMode("Novità", novitaNumero);
    loadCookieOneParameter("Novità", "nuovo", filter);
    
    helperAddShowMode("Promo", promoNumero);
    loadCookieOneParameter("Promo", "promo", filter);
    
}


function addBuyMode(compraloSubitoNumero, aRateNumero, aNoleggioNumero, filter){

    
        
    helperAddBuyMode("Compralo Subito", compraloSubitoNumero);
    loadCookieOneParameter("Compralo Subito", "compraSubito", filter); 
    
    helperAddBuyMode("A Rate", aRateNumero);
    loadCookieOneParameter("A Rate", "aRate", filter); 
    
    helperAddBuyMode("Noleggio", aNoleggioNumero);
    loadCookieOneParameter("Noleggio", "noleggio", filter);
}


function addNewBrand(marca, numero){
    
    var liElement = document.createElement("LI");
    liElement.setAttribute("onClick", "javascript:selectFilterRow(this)");
    liElement.setAttribute("id", marca);
    
    var aElement = document.createElement("A");
    
    //TODO
    aElement.setAttribute("href", "javascript:void(0)");
    aElement.innerHTML = marca;
    
    var spanElement = document.createElement("SPAN");
    spanElement.setAttribute("class", "floatright");
    spanElement.innerHTML = numero;
    
    aElement.appendChild(spanElement);
    
    liElement.appendChild(aElement);
    
    document.getElementById("marca").appendChild(liElement);
    
}



function addNewDevice(id, nome, promo, nuovo, prezzo, prezzoScontato, gridImagePath, categoria){
    
    var divElementMain = document.createElement("DIV"); 
    
    divElementMain.setAttribute("class","col-xs-12 col-sm-6 col-md-4");

    divElementMain.appendChild(buildDivElement(id, nome, promo, nuovo, prezzo, prezzoScontato, gridImagePath, categoria));
    
    document.getElementById("grid").appendChild(divElementMain);
}

function buildDivElement(id, nome, promo, nuovo, prezzo, prezzoScontato, gridImagePath, categoria) {
    var divElement = document.createElement("DIV"); 
    divElement.setAttribute("class","single-product");
    
    divElement.appendChild(buildDivImage(id, nome, promo, nuovo, gridImagePath, categoria));
    divElement.appendChild(buildDivProductDsc(id, nome, promo, nuovo, prezzo, prezzoScontato, categoria));
    
    return divElement;
}



//First branch call Main Function buildDivElement

function buildDivImage(id, nome, promo, nuovo, gridImagePath, categoria){
    var divElement = document.createElement("DIV"); 
    divElement.setAttribute("class","product-img");
    
    divElement.appendChild(buildDivPromoNewTipo(promo, nuovo));
    divElement.appendChild(buildDivProductImage(id, nome, gridImagePath, categoria))
    
    return divElement;
    
}



//helper function buildDivProductDsc

function buildDivPromoNewTipo(promo,nuovo) {
    
    if(promo === '1'){
        var divElement = document.createElement("DIV");
        var spanElement = document.createElement("SPAN");
        
        divElement.setAttribute("class","pro-type");
        spanElement.innerHTML = "Promo";
        
        divElement.appendChild(spanElement);
        
        return divElement;
        
    }else if(nuovo === '1'){
        var divElement = document.createElement("DIV");
        var spanElement = document.createElement("SPAN");
        
        divElement.setAttribute("class","pro-type");
        spanElement.innerHTML = "Nuovo";
        
        divElement.appendChild(spanElement);
        
        return divElement;
    }else {
        return document.createElement("DIV");
    }
}

//helper function buildDivProductDsc

function buildDivProductImage(id, nome, gridImagePath, categoria) {
    var aElement = document.createElement("A");
    var imgElement = document.createElement("IMG");
    
    aElement.setAttribute("href", "page.device.html?id=" + id);
    imgElement.setAttribute("src", gridImagePath);
    imgElement.setAttribute("height", "270");
    imgElement.setAttribute("alt", nome);
    
    aElement.appendChild(imgElement);
    
    return aElement;
}




//Second branch call Main Function buildDivElement
function buildDivProductDsc(id, nome, promo, nuovo, prezzo, prezzoScontato, categoria) {
    var divElement = document.createElement("DIV");
    
    divElement.setAttribute("class","product-dsc");
    
    divElement.appendChild(buildNome(id, nome, categoria));
    divElement.appendChild(buildPrizeElement(promo, nuovo, prezzo, prezzoScontato));
    return divElement;
}



//helper function that create the device's name block buildDivProductDsc

function buildNome(id,nome, categoria) {
    var pElement = document.createElement("P");
    var aElement = document.createElement("A");
    
    aElement.setAttribute("href","page.device.html?id=" + id);
    aElement.innerHTML = nome;
    
    pElement.appendChild(aElement);
    
    return pElement;
}


//helper function that create the price block buildDivProductDsc
function buildPrizeElement(promo, nuovo, prezzo, prezzoScontato) {
    
    if(promo === '1'){
        var spanElement = document.createElement("SPAN");
        
        spanElement.innerHTML = '<del>' + prezzo + "&euro;" + '</del>' + prezzoScontato + "&euro;";
        return spanElement;
        
    }  
        var spanElement = document.createElement("SPAN");
        spanElement.innerHTML = prezzo + "&euro;";
        return spanElement;
    
}


/***************************************************************************/
     /* helper functions for the helper function of the ajax calls*/
/***************************************************************************/


function helperAddShowMode(name,number){
    var liElement = document.createElement("LI");
    liElement.setAttribute("onClick", "javascript:selectFilterRow(this)");
    liElement.setAttribute("id", name);
    
    var aElement = document.createElement("A");
    
    //TODO
    aElement.setAttribute("href", "javascript:void(0)");
    aElement.innerHTML = name;
    
    var spanElement = document.createElement("SPAN");
    spanElement.setAttribute("class", "floatright");
    spanElement.innerHTML = number;
    
    aElement.appendChild(spanElement);
    
    liElement.appendChild(aElement);
    
    document.getElementById("showMode").appendChild(liElement);
}

function helperAddBuyMode(nome,numero){
    
    var liElement = document.createElement("LI");
    liElement.setAttribute("onClick", "javascript:selectFilterRow(this)");
    liElement.setAttribute("id", nome);   

        var aElement = document.createElement("A");
    
        //TODO
        aElement.setAttribute("href", "javascript:void(0)");
        aElement.innerHTML = nome;
        
        var spanElement = document.createElement("SPAN");
        spanElement.setAttribute("class", "floatright");
        spanElement.innerHTML = numero;
        
        aElement.appendChild(spanElement);
        
        liElement.appendChild(aElement);
        
        document.getElementById("buyMode").appendChild(liElement);
    
    
}


function setPageTitle(titleForThePage){
    document.getElementById("deviceByCategoryTitle").innerHTML = titleForThePage;
    document.getElementById("page_title").innerHTML = titleForThePage;
}


/*********************************************************************/
/**************  FILTER OPTIONS TO QUERY FUNCTIONS   *****************/
/*********************************************************************/

//Helper function to create the structure [aaa:bbb] for some type of preferences like brand
function collectOptions(nome, id){
    
    var query = '[' + nome + ":";
    
    var element = document.getElementById(id);
    
    if (element === null){
        return "[:]";
    }
    
    var listOption = element.children;
    
    var j = 0;
    
    for (var i = 0; i < listOption.length; i++ ){
        if(listOption[i].getAttribute("class") === 'active'){
            
            //Take the text of the only name of the brand
            var opzione = $(listOption[i].children[0]).clone().children().remove().end().text();
            
            if( j > 0){
                query += "|" + opzione;
            }else{
                query += opzione;
            }   
            //Important for the OR counter
            j++;
        }
    }
    
    query = query + "]";
    
    return query;
    
}

//Helper function to create the structure [aaa:bbb] for the boolean type es promo
function collectOptions2(nome, id, index){
    
    var query = '[' + nome + ":";
    
    var i = parseInt(index);
    
    var element = document.getElementById(id);
    
    if (element === null){
        return "[:]";
    }
    
    var listOption = element.children;
    
    
    if(listOption[i].getAttribute("class") === 'active'){
        var opzione = $(listOption[i].children[0]).clone().children().remove().end().text();
        query +=  1;
    }
    
    query = query + "]";
    
    return query;
    
}

//Is needed to retrive the text of an element in the filter without the annoying number on the right
function justtext(element) {

    return element.children.remove().end().text();

}

/*********************************************************************/
/**************  FILTER  HELPER FUNCTIONS   *****************/
/*********************************************************************/

//CHANGE THE STYLE OF THE SELECTED PARaMETER and update cookies
function selectFilterRow(element){
    var where = element.parentElement.getAttribute('id');
    if (element.getAttribute("class") === 'active'){
        element.removeAttribute("class");
        setCookie(categoria, createFilterStringFromTheStateOfTheFilter(), 1);
        return;
    }
    element.setAttribute("class","active");
    setCookie(categoria, createFilterStringFromTheStateOfTheFilter(), 1);
}

function createFilterStringFromTheStateOfTheFilter(){
    //Salva i valori dello slider in un cookie ad hoc
    var minMax = getMinMaxValueSlider();
    
    var queryMarca = collectOptions("marca", "marca");
    var queryCategoria = collectOptions("sottoCategoria", "sottoCategoria");
    
    //The extra parameter is for the index of the child to consider
    var queryCompraSubito = collectOptions2("compraSubito", "buyMode", "0");
    var queryARate = collectOptions2("aRate", "buyMode", "1");
    var queryNoleggio = collectOptions2("noleggio", "buyMode", "2");
    
    //Mostra Solo
    var queryNovita = collectOptions2("nuovo", "showMode", "0");
    var queryPromozione = collectOptions2("promo", "showMode", "1");
    
    var queryPrezzo = queryPrezzoOption();
    
    var queryOrdering = queryOrderingPreferences();
    
    var queryFilter = [queryMarca, queryCategoria, queryCompraSubito, queryARate,
                       queryNoleggio, queryNovita, queryPromozione,queryPrezzo,queryOrdering];
    
    //Takes out the empty options
    var query = cleanFilterQuery(queryFilter);
    
    return query;
    
}

//CHECK THE FILTER STATUS AND BUILD THE QUERY TO SUBMIT
function submitQueryWithFilterOptions(){
    
    var query = createFilterStringFromTheStateOfTheFilter();
    
    setCookie(categoria,query,1);
    
    window.location.href = "deviceByCategory.html?categoria=" + categoria;
}


function queryOrderingPreferences(){
    var formElement = document.getElementById("orderingForm");
    var selectedOption = formElement.selectedIndex;
    selectedOption = '[orderingPreference:' + selectedOption + ']';
    
    return selectedOption;
}


//HELPER FUNCTION TO PUT THE CONDITIONS IN AND 
function addAndCondition(queryFilter){
    
    var query = '';
    
    for (var i = 0; i < queryFilter.length; i++ ){
            
        if( i > 0){
            query += " AND " + queryFilter[i];
        }else{
            query += queryFilter[i];
        }   
    }
    
    return query;
}

//HELPER FUNCTION REMOVE THOSE PARAMETERS THAT ARE NOT SPECIFIED
function cleanFilterQuery(queryFilter){
    for(var i = 0; i < queryFilter.length; i++){
        var option = queryFilter[i].split("]");
        var parameterList = option[0].split(":");
        if ( parameterList[1] === ''){
             queryFilter.splice(i,1);
             i--;
        }
    }
    
    return queryFilter;
}

//HELPER FUNCTION TO BUILD THE PIECE OF QUERY ABOUT THE PRICE
function queryPrezzoOption(){
    
    var minMax = getMinMaxValueSlider();
    
    var min = minMax[0];
    var max = minMax[1];
    
    var query = "[prezzo:" + min + "|" + max + "]";
    
    return query;
    
}


function getMinMaxValueSlider(){
    var range = document.getElementById("amount").value;
    var minMax = range.split("-");
    
    var min = minMax[0].replace(/\s/g, '');
    var max = minMax[1].replace(/\s/g, '');
    
    return [min,max];
}


function validateOrderingForm(element){
    addSafeOrderingPreferencesToCookies(element);
    submitQueryWithFilterOptions();
}


/*********************************************************************/
/*********************  COOKIE FUNCTIONS   ***************************/
/*********************************************************************/

function setCookie(cname, cvalue, exdays) {
    
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+ d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
} 


function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length,c.length);
        }
    }
    return "";
} 

function getActiveIndexInCookieForThisFatherId(fatherId){
    var currentCookie = getCookie(categoria);

    var activeIndexArray = [];
    
    if (currentCookie === ''){
        return activeIndexArray;
    }

    var arrayId = currentCookie.split('|');

    for ( var i = 0; i < arrayId.length; i++){
        var candidateFatherId = arrayId[i].split(':')[0];
        
        var indexChild = arrayId[i].split(':')[1];
        
        if (fatherId === candidateFatherId){
            activeIndexArray.push(indexChild);
        }
    }
    
    return activeIndexArray;
}

//restore the position of the slider
function setSliderCookie(filter){

    if(filter.indexOf("prezzo") < 0){
        return;
    }

    var minMax = filter.split("[prezzo:")[1].split(']')[0];
    
    filter = minMax.split("|");
    
    $( "#amount" ).val( "" + filter[0] + " - " + filter[1]);
    $("#slider-range").slider("values", [filter[0],filter[1]]);
}

function addSafeOrderingPreferencesToCookies(element){
    
    var formElement = document.getElementById("orderingForm");
    var selectedOption = formElement.selectedIndex;
    
    var cookie = getCookie(categoria);
    
    if(cookie.indexOf("orderingPreference") > -1){
        var substring = "[orderingPreference:" + cookie.split("[orderingPreference:")[1].split("]")[0] + "]";
        
        cookie = cookie.replace(substring,"[orderingPreference:" + selectedOption +"]");
    }
    
}

function loadCookieInfoOrderingPreferences(idOrderingForm){
    
    var cookie = getCookie(categoria);
    var selectedIndex = 0;
    
    if (cookie.indexOf("orderingPreference") > -1){
        selectedIndex = cookie.split("[orderingPreference:")[1].split("]")[0];
    }
    
    $("#" + idOrderingForm + ' option')[selectedIndex].selected = true;
    
}

function loadCategorySelectionsFromCookies(filter){
    
    var listId = "sottoCategoria";
    
    if (filter.indexOf(listId) > -1){
        var paramListId = filter.split("[" + listId +":")[1].split(']')[0].split('|');
    
        for (var i = 0; i < paramListId.length; i++){
            var liElement = document.getElementById(paramListId[i]).setAttribute("class","active");
        }
    }

}

function loadBrandSelectionsFromCookies(filter){
    
    var listId = "marca";
    
    if (filter.indexOf(listId) > -1){//TODO
        var paramListId = filter.split("[" + listId +":")[1].split(']')[0].split('|');
    
        for (var i = 0; i < paramListId.length; i++){
            var liElement = document.getElementById(paramListId[i]).setAttribute("class","active");
        }
    }

}

function loadCookieOneParameter(id, param, filter){
    
    if (filter.indexOf(param) > -1){
        var paramListId = filter.split("[" + param +":")[1].split(']')[0];
    
        var liElement = document.getElementById(id).setAttribute("class","active");
        
    }
    
}

/*********************************************************************/
/************************   DYNAMIC GO BACK   ************************/
/*********************************************************************/


//set the name and the url of the previous visited page
var parametersMap = getParameters();
    
    filter = parametersMap['filter'];

//In this case the page has been called by the menu
if(filter != undefined){
    setDynamicGoBack();
}

function setDynamicGoBack(){
    var previous_url = document.referrer;
    if(contains(previous_url,"sls.html") === true){
        $("#dynamic_link").html("Vai allo Smart Life precedente");
        $("#dynamic_link").attr("href","javascript:history.back()");
    }else if(contains(previous_url,"assistance_services.html") === true){
        $("#dynamic_link").html("Vai al servizio di assistenza precedente");
        $("#dynamic_link").attr("href","javascript:history.back()");
    }else { //set default link if 
        $("#dynamic_link").html("Vai a tutti i servizi");
        $("#dynamic_link").attr("href", "prodotti.html"); 
    }
}

//check if str contain sub_str
function contains(str,sub_str){
   return (str.indexOf(sub_str) > -1);
}


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

