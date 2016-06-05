
//// the following 3 rows are shared in the js of each page with different parameters
//load the shared menu 
$("#header").load("shared-menu.html");
//load the shared footer
$("#footer").load("shared-footer.html");

var categoria;

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
                     "outlet"              : "Outlet"
                   } 
    
    var parametersMap = getParameters();
    
    categoria = parametersMap['categoria'];//es: smartphone_telefoni
    
    var titleForThePage = titleMap[categoria];
    
    var filter = '';
    
    if( parametersMap['filter'] !== undefined){
        filter = decodeURI(parametersMap['filter']);
    }
    
    filter = filter.replace(/~/g, '=');
    
    setPageTitle(titleForThePage);
    
    ajaxGridProduct(phpFile, categoria, filter);
    
    ajaxFilterComponents(phpFile, categoria, filter);
    
    
});


function ajaxFilterComponents(phpFile, categoria, filter){
     //TODO
    ajaxBrandFilter(phpFile, categoria);
    ajaxBuyModeFilter(phpFile, categoria);
    ajaxShowOnlyFilter(phpFile, categoria);
    ajaxCategoryFilter(phpFile, categoria);
    
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
            
            //Add the html for each device that basically is a row
            for(i = 0; i < resultArray.length ; i++){
                addNewDevice(resultArray[i].id, resultArray[i].nome, resultArray[i].promo, resultArray[i].nuovo, resultArray[i].prezzo, resultArray[i].gridImagePath, categoria);
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
        data: {query: "brands", categoria: categoria },
        success: function(response) { 
            
            //parse the json and get an array where the index is the row and the .User is the name of the column
            var resultArray = $.parseJSON(response);
            
            //Add the html for each device that basically is a row
            for(i = 0; i < resultArray.length ; i++){
                addNewBrand(resultArray[i].marca, resultArray[i].numero);
            }
        
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
        data: {query: "buyMode", categoria: categoria },
        success: function(response) { 
            
            //parse the json and get an array where the index is the row and the .User is the name of the column
            var resultArray = $.parseJSON(response);
            
            //Add the html for each device that basically is a row
            
            addBuyMode(resultArray[0].compraloSubitoNumero, resultArray[0].aRateNumero, resultArray[0].aNoleggioNumero);
            
        
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
        data: {query: "showMode", categoria: categoria },
        success: function(response) { 
            
            //parse the json and get an array where the index is the row and the .User is the name of the column
            var resultArray = $.parseJSON(response);
            
            //Add the html for each device that basically is a row
            
            addShowMode(resultArray[0].novitaNumero, resultArray[0].promoNumero, resultArray[0].disponibileNumero);
            
        
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
  
    var aElement = document.createElement("A");
    
    //TODO
    aElement.setAttribute("href", "javascript:void(0)");
    
    aElement.innerHTML = nomeCategoria;
    
    liElement.appendChild(aElement);
    
    document.getElementById("specificCategory").appendChild(liElement);

}


function addShowMode(novitaNumero, promoNumero, disponibileNumero){
    
    if( novitaNumero > 0){
        helperAddShowMode("Novità", novitaNumero);
    }
    
    if( promoNumero > 0){
        helperAddShowMode("Promo", promoNumero);
    }
    
    if( disponibileNumero > 0){
        helperAddShowMode("Disponibile", disponibileNumero);
    }
}


function addBuyMode(compraloSubitoNumero, aRateNumero, aNoleggioNumero){

    if( compraloSubitoNumero > 0){
        helperAddBuyMode("Compralo Subito", compraloSubitoNumero);
    }
    
    if(aRateNumero > 0){
        helperAddBuyMode("A RATE", aRateNumero);
    } 
    
    if(aNoleggioNumero > 0){
        helperAddBuyMode("NOLEGGIO", aNoleggioNumero);
    }
}






function addNewBrand(marca, numero){
    
    var liElement = document.createElement("LI");
    liElement.setAttribute("onClick", "javascript:selectFilterRow(this)");
    
    
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



function addNewDevice(id, nome, promo, nuovo, prezzo, gridImagePath, categoria){
    var divElementMain = document.createElement("DIV"); 
    
    divElementMain.setAttribute("class","col-xs-12 col-sm-6 col-md-4");

    divElementMain.appendChild(buildDivElement(id, nome, promo, nuovo, prezzo, gridImagePath, categoria));
    
    $("#grid").append(divElementMain);
    
    console.log(divElementMain);
}

function buildDivElement(id, nome, promo, nuovo, prezzo, gridImagePath, categoria) {
    var divElement = document.createElement("DIV"); 
    divElement.setAttribute("class","single-product");
    
    divElement.appendChild(buildDivImage(id, nome, promo, nuovo, gridImagePath, categoria));
    divElement.appendChild(buildDivProductDsc(id, nome, prezzo, categoria));
    
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
function buildDivProductDsc(id, nome, prezzo, categoria) {
    var divElement = document.createElement("DIV");
    
    divElement.setAttribute("class","product-dsc");
    
    divElement.appendChild(buildNome(id, nome, categoria));
    divElement.appendChild(buildPrizeElement(prezzo));
    return divElement;
}



//helper function buildDivProductDsc

function buildNome(id,nome, categoria) {
    var pElement = document.createElement("P");
    var aElement = document.createElement("A");
    
    aElement.setAttribute("href","page.device.html?id=" + id + "&" + "categoria=" + categoria);
    aElement.innerHTML = nome;
    
    pElement.appendChild(aElement);
    
    return pElement;
}


//helper function buildDivProductDsc

function buildPrizeElement(prezzo) {
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

function collectOptions(nome, id){
    
    var query = ''
    
    var listOption = document.getElementById(id).children;
    
    var j = 0;
    
    for (var i = 0; i < listOption.length; i++ ){
        if(listOption[i].getAttribute("class") === 'active'){
            
            //Take the text of the only name of the brand
            var opzione = $(listOption[i].children[0]).clone().children().remove().end().text();
            
            if( j > 0){
                query += " OR " + nome + " ~ '" + opzione + "'" ;
            }else{
                query += nome + " ~ '" + opzione + "'";
            }   
            //Important for the OR counter
            j++;
        }
    }
    
    console.log(nome + " options collection");
    console.log(query);
    
    return query;
    
}

function collectOptions2(nome, id, index){
    
    var query = ''
    
    var i = parseInt(index);
    
    var listOption = document.getElementById(id).children;
    
    console.log(listOption.length);
    
    if(listOption[i].getAttribute("class") === 'active'){
        var opzione = $(listOption[i].children[0]).clone().children().remove().end().text();
        query += nome + " ~ '" + 1 + "'";
    }
    
    console.log(nome + " options collection");
    console.log(query);
    
    return query;
    
}

function justtext(element) {

    return element.children.remove().end().text();

}

/*********************************************************************/
/**************  FILTER  HELPER FUNCTIONS   *****************/
/*********************************************************************/

//CHANGE THE STYLE OF THE SELECTED PARaMETER
function selectFilterRow(element){
    if (element.getAttribute("class") === 'active'){
        element.removeAttribute("class");
        return;
    }
    element.setAttribute("class","active");
}

//CHECK THE FILTER STATUS AND BUILD THE QUERY TO SUBMIT
function submitQueryWithFilterOptions(){
    
    var queryMarca = collectOptions("marca", "brandListFilter");
    var queryCategoria = collectOptions("sottoCategoria", "specificCategory");
    
    //The extra parameter is for the index of the child to consider
    var queryCompraSubito = collectOptions2("compraSubito", "buyMode", "0");
    var queryARate = collectOptions2("aRate", "buyMode", "1");
    var queryNoleggio = collectOptions2("noleggio", "buyMode", "2");
    
    //Mostra Solo
    var queryNovita = collectOptions2("nuovo", "showMode", "0");
    var queryPromozione = collectOptions2("promo", "showMode", "1");
    
    
    var range = document.getElementById("amount").value;
    
    var queryPrezzo = queryPrezzoOption(range);
    
    //, queryPrezzo TODO
    var queryFilter = [queryMarca, queryCategoria, queryCompraSubito, queryARate,
                       queryNoleggio, queryNovita, queryPromozione];
    
    console.log(queryFilter);
    
    //Takes out the empty options
    var queryFilter = cleanFilterQuery(queryFilter);
    
    console.log(queryFilter);
    
    var query = addAndCondition(queryFilter);
    
    
    console.log("Risultato finale");
    
    console.log(query);
  
    //Encrypt here and decrypt php side
    
 //   query = rc4("password", query);
    
    console.log(query);
    
    window.location.href = "deviceByCategory.html?categoria=" + categoria + "&filter=" + query;
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

//HELPER FUNCTION TO REMOVE CONDITIONS THAT ARE NOT SPECIFIED 
function cleanFilterQuery(queryFilter){
    for(var i = 0; i < queryFilter.length; i++){
        if ( queryFilter[i] === ''){
             queryFilter.splice(i,1);
             i--;
        }
    }
    
    console.log(queryFilter);
    
    return queryFilter;
}

//HELPER FUNCTION TO BUILD THE PIECE OF QUERY ABOUT THE PRICE
function queryPrezzoOption(range){
    
    var minMax = range.split("-");
    
    var min = minMax[0].replace(/\s/g, '');
    var max = minMax[1].replace(/\s/g, '');
    
    var query = "CAST(prezzo as DECIMAL(10,2)) BETWEEN " + "'" + min + "'" + " AND " + "'" + max + "'";
    
    return query;
    
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

