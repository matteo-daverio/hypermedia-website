
//// the following 3 rows are shared in the js of each page with different parameters
//load the shared menu 
$("#header").load("shared-menu.html");
//load the shared footer
$("#footer").load("shared-footer.html");


//async ajax request
$("document").ready(function(){
    
    //select the right text in the menu
    $('#menu_prodotti').addClass('current');
   
    var parametersMap = getParameters();
    
    var id = parametersMap['id'];
    
    var categoria = parametersMap['categoria'];
    
    console.log(categoria);
    
    if(id === null || id === '' || categoria ===null || categoria === ''){
        console.log("id nulo!");
        return;
    }
     
    
    setDynamicLink(categoria);
    
    
    ajaxGallery(id);
    ajaxDescription(id);
    ajaxSpecificationsList(id);
    
    
    
});







/*********************************************************************/
/************************   AJAX REQUESTS   **************************/
/*********************************************************************/


/************************   AJAX GALLERY REQUESTS   **************************/

function ajaxGallery(id){
    
    $.ajax({
        method: "GET",
        //dataType: "json", //type of data
        crossDomain: true,
        url: "db/sql_device.php", //Relative or absolute path to file.php file
        data: {id: id, query:'gallery'},
        success: function(response) { 
            
            //parse the json and get an array where the index is the row and the .User is the name of the column
            var resultArray = $.parseJSON(response);
            
            var galleryImages = buildGallery(resultArray[0].alt,
                                             resultArray[0].frontImagePath,
                                             resultArray[0].sideImagePath, 
                                             resultArray[0].backImagePath); 
            
            $("#deviceGallery").append(galleryImages);
            
            //SERVE AD RICARICARE LO SLIDER NEL MOMENTO IN CUI SI RIACCEDE AD UNA PAGINA GIA VISTA!
            SEMICOLON.widget.loadFlexSlider();
        },
        error: function(request,error)
        {
            console.log(request+":"+error);
        }
    });
}



/************************   AJAX DESCRIPTION REQUESTS   **************************/


function ajaxDescription(id){
    
    $.ajax({
        method: "GET",
        //dataType: "json", //type of data
        crossDomain: true,
        url: "db/sql_device.php", //Relative or absolute path to file.php file
        data: {id: id, query:'description'},
        success: function(response) { 
            
            //parse the json and get an array where the index is the row and the .User is the name of the column
            var resultArray = $.parseJSON(response);
              
            //Device Name
            document.getElementById("deviceTitle").innerHTML = resultArray[0].nome;
            
            //The little square that says if the device is in promo or new
            var newPromoDiv = buildDivPromoNewTipo(resultArray[0].promo, resultArray[0].nuovo);
            $(".product-image").append(newPromoDiv);
    
            //Price
            var priceIns = buildPrezzo(resultArray[0].prezzo, resultArray[0].promo, resultArray[0].prezzoScontato);
    
    
            //Device Description
            var deviceDesc = buildDescription(resultArray[0].descrizione);
            $("#deviceDescription").append(deviceDesc);
            
            
            
        },
        error: function(request,error)
        {
            console.log(request+":"+error);
        }
    });
    
}




/*****************   AJAX SPECIFICATIONS LIST REQUESTS   ***********************/

function ajaxSpecificationsList(id){
    
    $.ajax({
        method: "GET",
        //dataType: "json", //type of data
        crossDomain: true,
        url: "db/sql_device.php", //Relative or absolute path to file.php file
        data: {id: id, query:'specification'},
        success: function(response) { 
            
            //parse the json and get an array where the index is the row and the .User is the name of the column
            var resultArray = $.parseJSON(response);
            
            for(var i = 0; i < resultArray.length; i++){
                
                
                //Specification list
                var specList = buildSpecList(resultArray[i].titolo, resultArray[i].dettaglio);
                document.getElementById("specificationsList").appendChild(specList);
            }
            
        },
        error: function(request,error)
        {
            console.log(request+":"+error);
        }
    });
    
}



/*********************************************************************/
/**************  HELPER FUNTIONS FOR AJAX REQUESTS   *****************/
/*********************************************************************/



/**************  HELPER FUNTIONS FOR GALLERY   *****************/

function buildGallery(alt, frontImagePath, sideImagePath, backImagePath){
    
    var divElement = document.createElement("DIV");
                                                    
    divElement.setAttribute("class", "slider-wrap");
    divElement.setAttribute("data-lightbox", "gallery");
    
    console.log(frontImagePath);
    console.log(sideImagePath);
    console.log(backImagePath);
    
    var Slider1 = buildSlide(alt, frontImagePath);
    divElement.appendChild(Slider1);
    
    if (sideImagePath !== null){
        var Slider2 = buildSlide(alt, sideImagePath);
        divElement.appendChild(Slider2);
    }
    
    if (backImagePath !== null){
        var Slider3 = buildSlide(alt, backImagePath);
        divElement.appendChild(Slider3);           
    }
    
    
    
    return divElement;
    
}                                               

function buildSlide(nome, imagePath) {
    var divElement = document.createElement("DIV");
    
    divElement.setAttribute("class", "slide");
    divElement.setAttribute("data-thumb", imagePath);
    
    var aElement = document.createElement("A");
    
    aElement.setAttribute("href", imagePath);
    aElement.setAttribute("data-lightbox", "gallery-item");
    aElement.setAttribute("title", nome);
    
    var imgElement = document.createElement("IMG");
    
    imgElement.setAttribute("src", imagePath);
    imgElement.setAttribute("alt", nome);
    
    aElement.appendChild(imgElement);
    
    divElement.appendChild(aElement);
    
    return divElement;
}








/**************  HELPER FUNTIONS FOR DESCRIPTION   *****************/


function buildDivPromoNewTipo(promo,nuovo) {
    
    if(promo === '1'){
        var divElement = document.createElement("DIV");
        
        divElement.setAttribute("class","sale-flash");
        divElement.innerHTML = "Promo";

        return divElement;
        
    }else if(nuovo === '1'){
        var divElement = document.createElement("DIV");
        
        divElement.setAttribute("class","sale-flash");
        divElement.innerHTML = "Nuovo";
        
        return divElement;
    }
}


function buildPrezzo(prezzo, promo, prezzoScontato) {
    
    var divElement = document.getElementById("divPrezzo");
    
    if ( promo === '1'){
        var delElement = document.createElement("DEL");
        delElement.innerHTML = prezzo + "&euro;" + "&nbsp; " + "&nbsp;";
        divElement.appendChild(delElement);
        
        var prezzoIns = document.createElement("INS");
        prezzoIns.innerHTML = prezzoScontato + "&euro;";
    
        divElement.appendChild(prezzoIns);
    }else{
        var prezzoIns = document.createElement("INS");
        prezzoIns.innerHTML = prezzo + "&euro;";
    
        divElement.appendChild(prezzoIns);  
    }    
    
}


function buildDescription(descrizione){
    var descrizioneP = document.createElement("P");
    descrizioneP.innerHTML = descrizione;
    
    return descrizioneP;
}



/**************  HELPER FUNTIONS FOR SPECIFICATION LIST   *****************/

function buildSpecList(titolo, dettaglio){
        
    var liElement = document.createElement("LI");
    
    liElement.innerHTML = '<i class="icon-caret-right"></i>' + titolo + " " + dettaglio;
    
    return liElement;
}


/***************  Dynamic Link   ***************/

function setDynamicLink(categoria){
    
    var titleMap = { "smartphone_telefoni" : "Smartphone e Telefoni" ,
                     "tablet_computer"     : "Tablet e Computer",
                     "modem_networking"    : "Modem e Networking",
                     "tv_smart_living"     : "Tv e Smart Living",
                     "outlet"              : "Outlet"
                   } 
    
    var linkElement = document.getElementById("VaiALink");
    
    linkElement.setAttribute("href", "deviceByCategory.html?categoria=" + categoria);
    
    linkElement.innerHTML = "Vai a " + titleMap[categoria];
    
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
    
    console.log(parametersMap);
    
    return parametersMap;
}