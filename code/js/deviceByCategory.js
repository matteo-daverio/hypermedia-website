//// the following 3 rows are shared in the js of each page with different parameters
//load the shared menu 
$("#header").load("shared-menu.html");
//load the shared footer
$("#footer").load("shared-footer.html");

//Define the dynamic environment in which we are working
var categoria;

//when the filter is created at each activable row is added an incremental id to haldle the retrive fase
var idNumberFilterListMarca = 0;
var idNumberFilterListCategoria = 0;
var idNumberFilterListAcquisto = 0;
var idNumberFilterListMostraSolo = 0;


/*********************************************************************/
/******************   AJAX REQUESTS DISPATCHER   *********************/
/*********************************************************************/

//async ajax request
$("document").ready(function(){

    
//select the right text in the menu
$('#menu_prodotti').addClass('current');
    
    var phpFile = "db/deviceByCategory.php";
    
    var titleMap = { "smartphone_telefoni" : "Smartphone e Telefoni" ,
                     "tablet_computer"     : "Tablet e Computer",
                     "modem_networking"    : "Modem e Networking",
                     "tv_smart_living"     : "Tv e Smart Living",
                     "outlet"              : "Outlet",
                     "all_devices"          : "Promozioni"
                   } 
    
    var parametersMap = getParameters();
    
    categoria = parametersMap['categoria'];//es: smartphone_telefoni
    
    var titleForThePage = titleMap[categoria];
    
    var filter = '';
    
    if( parametersMap['filter'] !== undefined){
        filter = decodeURI(parametersMap['filter']);
    }
    
    setPageTitle(titleForThePage);
    
    ajaxGridProduct(phpFile, categoria, filter);
    
    ajaxFilterComponents(phpFile, categoria);
    
    loadCookieInfoOrderingPreferences("orderingForm");
});

//Helper function to dispatch all the ajax calls for the Filter's Components
function ajaxFilterComponents(phpFile, categoria){
     //TODO
    ajaxBrandFilter(phpFile, categoria);
    ajaxBuyModeFilter(phpFile, categoria);
    ajaxShowOnlyFilter(phpFile, categoria);
    ajaxCategoryFilter(phpFile, categoria);
    ajaxMaxPriceFilter(phpFile, categoria);
    
}

/*********************************************************************/
/************************   AJAX REQUESTS   **************************/
/*********************************************************************/


/*****************   AJAX GRID PRODUCT REQUESTS   ********************/

function ajaxGridProduct(phpFile, categoria, filter){
    
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
            }
            
            //Add the html for each device that basically is a row
            for(i = 0; i < resultArray.length ; i++){
                addNewDevice(resultArray[i].id, resultArray[i].nome, resultArray[i].promo, resultArray[i].nuovo, resultArray[i].prezzo, resultArray[i].prezzoScontato, resultArray[i].gridImagePath, categoria);
            }
        
        },
        error: function(request,error)
        {
            console.log(request+":"+error);
        }
    });
}


function ajaxBrandFilter(phpFile, categoria){
    
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
            
        loadCookieInfo('brandListFilter');
        
        },
        error: function(request,error)
        {
            console.log(request+":"+error);
        }
    });
    
    
}




function ajaxBuyModeFilter(phpFile, categoria){
    
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
            addBuyMode(resultArray[0].compraloSubitoNumero, resultArray[0].aRateNumero, resultArray[0].aNoleggioNumero);
            
            loadCookieInfo('buyMode');
        },
        error: function(request,error)
        {
            console.log(request+":"+error);
        }
    });
    
}


function ajaxShowOnlyFilter(phpFile, categoria){
    
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
            addShowMode(resultArray[0].novitaNumero, resultArray[0].promoNumero);
            
            loadCookieInfo('showMode');
        },
        error: function(request,error)
        {
            console.log(request+":"+error);
        }
    });
    
}


function ajaxCategoryFilter(phpFile, categoria){
    
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
                var child = document.getElementById("specificCategoryDiv");
                document.getElementById("fatherFilterElements").removeChild(child);
                return;
            }
            
            for(i = 0; i < resultArray.length ; i++){
                addNewCategory(resultArray[i].nomeCategoria);
            }
            
            loadCookieInfo('specificCategory');
        
        },
        error: function(request,error)
        {
            console.log(request+":"+error);
        }
    });
}


function ajaxMaxPriceFilter(phpFile, categoria){
    
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
            
            setSliderCookie();
            
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
    liElement.setAttribute("id", idNumberFilterListCategoria);
    idNumberFilterListCategoria++;
    
  
    var aElement = document.createElement("A");
    
    //TODO
    aElement.setAttribute("href", "javascript:void(0)");
    
    aElement.innerHTML = nomeCategoria;
    
    liElement.appendChild(aElement);
    
    document.getElementById("specificCategory").appendChild(liElement);

}


function addShowMode(novitaNumero, promoNumero){
    
    helperAddShowMode("Novità", novitaNumero);
    
    helperAddShowMode("Promo", promoNumero);

}


function addBuyMode(compraloSubitoNumero, aRateNumero, aNoleggioNumero){

    
        
    helperAddBuyMode("Compralo Subito", compraloSubitoNumero);
    
    helperAddBuyMode("A RATE", aRateNumero);
      
    helperAddBuyMode("NOLEGGIO", aNoleggioNumero);
    
}


function addNewBrand(marca, numero){
    
    var liElement = document.createElement("LI");
    liElement.setAttribute("onClick", "javascript:selectFilterRow(this)");
    liElement.setAttribute("id", idNumberFilterListMarca);
    idNumberFilterListMarca++;
    
    var aElement = document.createElement("A");
    
    //TODO
    aElement.setAttribute("href", "javascript:void(0)");
    aElement.innerHTML = marca;
    
    var spanElement = document.createElement("SPAN");
    spanElement.setAttribute("class", "floatright");
    spanElement.innerHTML = numero;
    
    aElement.appendChild(spanElement);
    
    liElement.appendChild(aElement);
    
    document.getElementById("brandListFilter").appendChild(liElement);
    
}



function addNewDevice(id, nome, promo, nuovo, prezzo, prezzoScontato, gridImagePath, categoria){
    var divElementMain = document.createElement("DIV"); 
    
    divElementMain.setAttribute("class","col-xs-12 col-sm-6 col-md-4");

    divElementMain.appendChild(buildDivElement(id, nome, promo, nuovo, prezzo, prezzoScontato, gridImagePath, categoria));
    
    $("#grid").append(divElementMain);
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
    
    aElement.setAttribute("href", "page.device.html?id=" + id + "&" + "categoria=" + categoria);
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
    
    aElement.setAttribute("href","page.device.html?id=" + id + "&" + "categoria=" + categoria);
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
    liElement.setAttribute("id", idNumberFilterListMostraSolo);
    idNumberFilterListMostraSolo++;
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
    liElement.setAttribute("id", idNumberFilterListAcquisto);   
    idNumberFilterListAcquisto++;
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
                query += ";" + opzione;
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
        
        removeFromCookie(where, element.getAttribute("id"));
        return;
    }
    element.setAttribute("class","active");
    addToCookie(where, element.getAttribute("id"));
}

//CHECK THE FILTER STATUS AND BUILD THE QUERY TO SUBMIT
function submitQueryWithFilterOptions(){
    
    //Salva i valori dello slider in un cookie ad hoc
    var minMax = getMinMaxValueSlider();
    setCookie(categoria + "_prezzo", minMax[0] + "-" + minMax[1], 1);
    
    
    var queryMarca = collectOptions("marca", "brandListFilter");
    var queryCategoria = collectOptions("sottoCategoria", "specificCategory");
    
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
    
    window.location.href = "deviceByCategory.html?categoria=" + categoria + "&filter=" + query;
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
    
    var query = "[prezzo:" + min + ";" + max + "]";
    
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

//Remove a preference from the cookie!
function removeFromCookie(where, id){
        var currentCookie = getCookie(categoria);
    
        var substring1 = "|"+ where + ":" + id+"|";
        var substring2 = "|"+ where + ":" + id;
        var substring3 = where + ":" + id + "|";
        var substring4 = where + ":" + id;
        
        
        if(currentCookie.indexOf(substring1) > -1){
            currentCookie = currentCookie.replace(substring1, '|');
        }else if (currentCookie.indexOf(substring2) > -1){
            currentCookie = currentCookie.replace(substring2, '');
        }else if (currentCookie.indexOf(substring3) > -1){
            currentCookie = currentCookie.replace(substring3, '');
        }else if (currentCookie.indexOf(substring4) > -1){
            currentCookie = currentCookie.replace(substring4, '');
        }
    
        setCookie(categoria,currentCookie,1);
}

//Add a new preference to cookie!
function addToCookie(where, id){
        var currentCookie = getCookie(categoria);
        if (currentCookie.length == 0){
           currentCookie = where + ":" + id; 
        }else{
            currentCookie = currentCookie + '|' + where + ":" + id;
        }
        
        setCookie(categoria,currentCookie,1);
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

//Set to active the preferences on the filter (except for the price)
function loadCookieInfo(fatherId){
    
    var arrayIndexChildActive = getActiveIndexInCookieForThisFatherId(fatherId);
    
    var fatherElement = document.getElementById(fatherId);
    
    var arrayChildren = fatherElement.children;
    
    for ( var i = 0; i < arrayIndexChildActive.length; i++){
        var index = arrayIndexChildActive[i];
        arrayChildren[index].setAttribute("class","active");
    }
    
}

//restore the position of the slider
function setSliderCookie(){
    var cookie = getCookie(categoria + "_prezzo");
    if(cookie === ''){
        return;
    }

    cookie = cookie.split("-");
    $( "#amount" ).val( "" + cookie[0] + " - " + cookie[1]);
    $("#slider-range").slider("values", [cookie[0],cookie[1]]);
}

function addSafeOrderingPreferencesToCookies(element){
    var formElement = document.getElementById("orderingForm");
    var selectedOption = formElement.selectedIndex;
    
    for (var i = 0; i < formElement.children.length; i++){
        removeFromCookie('orderingForm',i);
    }
    
    addToCookie('orderingForm',selectedOption);
    
}

function loadCookieInfoOrderingPreferences(idOrderingForm){
    var arrayIndexChildActive = getActiveIndexInCookieForThisFatherId(idOrderingForm);
    
    var selectElement = document.getElementById(idOrderingForm);
    //Per come aggiungo questa informazione ai coockies ho la certezza che io abbia una sola opzione per la checkbox
    
    indexSelected = arrayIndexChildActive[0];
    
    if(indexSelected === undefined){
        return;
    }
    
    $("#" + idOrderingForm + ' option')[indexSelected].selected = true;;
    
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

