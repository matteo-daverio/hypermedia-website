/**
*  shared function for all the page of smart life services
*/


//get the title of the page base on the category 
//long : if true add "Smart Life" at start of the string
function getTitlePageFromCategory(categ,long){
    var tit = "";
    if(long){
     tit = "Smart Life - ";
    }
    if(categ === "tv_entertainment"){
        tit += "Tv & Entertainment";    //TODO check if don't need special char
    }else if(categ === "salute_benessere"){
        tit += "Salute & Benessere";
    }else if(categ === "casa_famiglia"){
        tit += "Casa e Famiglia";
    }else if(categ === "servizi_persona"){
        tit += "Servizi alla persona";
    }else
        tit += "Categoria non esistente."
    return tit;
}


//receive the parameter from the caller and do an asyn ajax get request with par type
function asyncAjaxRequestSls(categ){
    //async ajax request
    $("document").ready(function(){
        $.ajax({
            method: "GET",
            //dataType: "json", //type of data
            crossDomain: true,
            url: "db/sql_sls.php", //Relative or absolute path to file.php file
            data: {categoria:categ},
            success: function(response) {
                //parse the json and get an array
                var arrayRes = $.parseJSON(response);
                handleResult(arrayRes);
            },
            error: function(request,error)
            {
                console.log(request+":"+error);
            }
        });
    });
}

//promotion request
function asyncAjaxRequestSlsPromotion(){
    //async ajax request
    $("document").ready(function(){
        $.ajax({
            method: "GET",
            //dataType: "json", //type of data
            crossDomain: true,
            url: "db/sql_sls.php", //Relative or absolute path to file.php file
            data: {prom:true},
            success: function(response) {
                //parse the json and get an array
                var arrayRes = $.parseJSON(response);
                handleResult(arrayRes);
            },
            error: function(request,error)
            {
                console.log(request+":"+error);
            }
        });
    });
}


//for each row generate an obj and add it to the main list
function handleResult(arrayRes){
    //for each item add to the container
    for (i = 0; i < arrayRes.length; i++) {
        console.log(arrayRes[i].promozione);
        //TODO if not all service is define check here and set button "disabled" 
        var newItem = createItem(arrayRes[i].id,arrayRes[i].titolo,arrayRes[i].promozione, arrayRes[i].des_offerta,arrayRes[i].des_img);
        console.log(newItem);
        $("#sls_list").append(newItem);
    }
}


//create the main div
function createItem(id,title,promozione,desciption,img){
    var divElement = document.createElement("DIV"); 
    divElement.setAttribute("class","product clearfix");
    divElement.appendChild(addDivImg(id,title,img,promozione));
    divElement.appendChild(addDivProduct(id,title,desciption));
    
    return divElement;
}


//create the div with the img
function addDivImg(id,title,img,promozione){
        
    var imgElement = document.createElement("IMG"); 
    imgElement.setAttribute("src",img);
    imgElement.setAttribute("class","img-rounded");
    imgElement.setAttribute("alt",title);
    
    var aElement = document.createElement("A");
    aElement.setAttribute("href","sls.html?id=" + id );
    aElement.appendChild(imgElement);
    
    var divElement = document.createElement("DIV"); 
    divElement.setAttribute("class","product-image");
    divElement.appendChild(aElement);
    
    //if the element if in promotion
    if(promozione === "1"){
        var divPromoElement = document.createElement("DIV");
        divPromoElement.setAttribute("class","sale-flash");
        divPromoElement.innerHTML = "Promo";
        
        divElement.appendChild(divPromoElement);
    }
    
    return divElement;
}

//create the div with the info of the product
function addDivProduct(id,title,desciption){
    
    var h3Element = document.createElement("H3"); 
    h3Element.setAttribute("class","product-title" );
    h3Element.innerHTML = title;
    
    var pElement = document.createElement("P");
    pElement.innerHTML = desciption;
    
    var buttonElement = document.createElement("BUTTON");
    buttonElement.setAttribute("class","btn btn-primary btn-lg" );
    //buttonElement.setAttribute("disabled","");
    buttonElement.innerHTML = "Scopri";
    
    var aElement = document.createElement("A");
    aElement.setAttribute("href","sls.html?id=" + id  );
    aElement.appendChild(buttonElement);
                    
    var divElement = document.createElement("DIV"); 
    divElement.setAttribute("class","product-desc text-center");
    divElement.appendChild(h3Element);
    divElement.appendChild(pElement);
    divElement.appendChild(aElement);
    
    return divElement;
}



/*
EXAMPLE of the built item

<div class="product clearfix">
    <div class="product-image">
        <div class ="sale-flash">Promo</div>
        <a href="sls.html"><img src="images/smartLifeServices/salute_benessere.jpg" alt="TIM Vision">
        </a>
    </div>
    <div class="product-desc text-center">
        <h3 class="product-title">Sony Smartband FE (STATIC)</h3>
        <p>Un innovativo braccialetto da polso in grado di registrare automaticamente le tue attività fisiche, sociali e di intrattenimento 
        </p>
        <a href="sls.html?id=0"><button type="button" class="btn btn-primary btn-lg">Scopri id=0</button></a>
    </div>
</div>

*/
       