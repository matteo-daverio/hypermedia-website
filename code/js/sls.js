
//// the following 3 rows are shared in the js of each page with different parameters
//load the shared menu 
$("#header").load("shared-menu.html");
//load the shared footer
$("#footer").load("shared-footer.html");
//when page is complete select the current item of the menu
$("document").ready(function(){ $('#menu_smartlife').addClass('current');}); 


//set the name and the url of the previous visited page
setDynamicGoBack();
function setDynamicGoBack(){
    var previous_url = document.referrer;
    if (contains(previous_url,"sls_list.html?categoria=tv_entertainment") === true){
        $("#sls_goto").html("Vai ai servizi <b>Tv & Entertainment</b>");
        $("#sls_goto").attr("href", "javascript:history.back()");
    }else if(contains(previous_url,"sls_list.html?categoria=salute_benessere") === true){
        $("#sls_goto").html("Vai ai servizi <b>Salute e benessere</b>");
        $("#sls_goto").attr("href","javascript:history.back()");
    }else if(contains(previous_url,"sls_list.html?categoria=casa_famiglia") === true){
        $("#sls_goto").html("Vai ai servizi <b>Casa e famiglia</b>");
        $("#sls_goto").attr("href","javascript:history.back()");
    }else if(contains(previous_url,"sls_list.html?categoria=servizi_persona") === true){
        $("#sls_goto").html("Vai ai servizi <b>Servizi alla persona</b>");
        $("#sls_goto").attr("href","javascript:history.back()");
    }else if(contains(previous_url,"promozione_sls.html") === true){
        $("#sls_goto").html("Vai al device in promozione");
        $("#sls_goto").attr("href","javascript:history.back()");
    }else if(contains(previous_url,"device.html") === true){
        $("#sls_goto").html("Vai al device precedente");
        $("#sls_goto").attr("href","javascript:history.back()");
    }else { //set default link if 
        $("#sls_goto").html("Vai a tutti i servizi");
        $("#sls_goto").attr("href", "menu.sls.html"); 
    }
}

//check if str contain sub_str
function contains(str,sub_str){
   return (str.indexOf(sub_str) > -1);
}

//allow to change the class of the manu in the smart life service menu
var selector = '.nav li';
$(selector).on('click', function(){
    $(selector).removeClass('active');
    $(this).addClass('active');
});


//async ajax request
$("document").ready(function(){
    //retrive the html par
    var parametersMap = getParameters();
    var id = parametersMap['id'];
    //exit if no par
    if(id === null || id === ""){
        console.log("sls: no id!");
        return;
    }
    //get the main info of the service
    $.ajax({
        method: "GET",
        //dataType: "json", //type of data
        crossDomain: true,
        url: "db/sql_sls.php", //Relative or absolute path to file.php file
        data: {id:id},
        success: function(response) {
            //parse the json and get an array
            var res = $.parseJSON(response);
            fillPage(res[0].titolo,res[0].categoria, res[0].img_land);
            fillDescriptionFields(res[0].des_offerta,res[0].des_img, res[0].des_specifiche,res[0].promozione);
            fillActivationFields(res[0].act_act, res[0].act_img, res[0].act_timricorda,res[0].promozione);
            setLinkDeviceWithIntermediatePage(res[0].act_device_correlati_nome, res[0].act_device_correlati_link);
        },
        error: function(request,error){
            console.log(request+":"+error);
        }
    });
    //get the list of devices for the activation
    $.ajax({
        method: "GET",
        //dataType: "json", //type of data
        crossDomain: true,
        url: "db/sql_sls.php", //Relative or absolute path to file.php file
        data: {id:id , devices:true},
        success: function(response) {
            //parse the json and get an array
            var arrayRes = $.parseJSON(response);
            generateLinksForDevices(arrayRes);
        },
        error: function(request,error){
            console.log(request+":"+error);
        }
    });
    //get the faq about the services
    $.ajax({
        method: "GET",
        //dataType: "json", //type of data
        crossDomain: true,
        url: "db/sql_sls.php", //Relative or absolute path to file.php file
        data: {id:id , faq:true},
        success: function(response) {
            //parse the json and get an array
            var arrayRes = $.parseJSON(response);
            handleResultFaq(arrayRes);
            //reload the toogles to apply the js effects
			SEMICOLON.widget.toggles();
        },
        error: function(request,error){
            console.log(request+":"+error);
        }
    });
});

function fillPage(titolo,categoria,pathImg){
    //load the shared js with common function
    $.getScript('js/sls_shared.js', function()
    {
        //change the title in the page based on the category
        $("#sls_context_title").text(getTitlePageFromCategory(categoria,true));
    });
    $("#sls_product_title").html(titolo);
    $("#sls_img").attr("src", pathImg);
}

function fillDescriptionFields(des_offerta,des_img,des_specifiche,promozione){
    if(promozione === "1"){
        $("#sls_des_promo").show();
    }
    $("#sls_des_offerta").html(des_offerta);
    $("#sls_des_img").attr("src", des_img);
    $("#sls_des_specifiche").html(des_specifiche);
}


function fillActivationFields(act_act,act_img,act_timricorda,promozione){
    if(promozione === "1"){
        $("#sls_act_promo").show();
    }
    $("#sls_act_act").html(act_act);
    $("#sls_act_img").attr("src", act_img);
    $("#sls_act_ricorda").html(act_timricorda);
}

//if the device for this service are a group , there is a link to an intermediate page
function setLinkDeviceWithIntermediatePage(act_device_correlati_nome,act_device_correlati_link){
    if(act_device_correlati_nome != null || act_device_correlati_link != null){
        //hide the default message
        $("#sls_no_device").hide();
        
        //<br><a href="url">&#10095; Tutti gli iPhone</a>
        var linkIntemedio = document.createElement("A");
        linkIntemedio.setAttribute("href",act_device_correlati_link);
        linkIntemedio.innerHTML = act_device_correlati_nome;
         $("#sls_list_devices").append(linkIntemedio);
    }
}

//for each device correlated to this service generate a link in the activation section
function generateLinksForDevices(arrayRes){
    if ( arrayRes.length > 0){
        //hide the default message
        $("#sls_no_device").hide();
    }
    //for each item add to the container
    for (i = 0; i < arrayRes.length; i++) {
        $("#sls_list_devices").append(document.createElement("BR"));
        $("#sls_list_devices").append(buildLinkDevice(arrayRes[i].nome,arrayRes[i].id));
    }
}


//build the link obj of the single device for this smart life service
function buildLinkDevice(nome,id){
    console.log(nome); //TODO remove
    console.log(id);
    var linkSingleDevice = document.createElement("A");
    linkSingleDevice.setAttribute("href","page.device.html?id=" + id);
    linkSingleDevice.innerHTML =  "&#10095; " + nome;
    return linkSingleDevice; 
}


//for each row generate an obj and add it to the main list
function handleResultFaq(arrayRes){
    //for each item add to the container
    for (i = 0; i < arrayRes.length; i++) {
        $("#sls_faq").append(buildFaq(arrayRes[i].faq_title,arrayRes[i].faq_content));
    }
}

function buildFaq(faq_title, faq_content) {
    
    var iElement = document.createElement("i");
    iElement.setAttribute("class", "toggle-closed icon-comments-alt");
    
    var iElement2 = document.createElement("i");
    iElement2.setAttribute("class", "toggle-open icon-comments-alt");
    
    var divElementTitle = document.createElement("DIV");
    divElementTitle.setAttribute("class", "togglet");
    divElementTitle.innerHTML=faq_title; //before appendChild ! or it delete them
    divElementTitle.appendChild(iElement);
    divElementTitle.appendChild(iElement2);
    
    var divElementContent = document.createElement("DIV");
    divElementContent.setAttribute("class", "togglec");
    divElementContent.innerHTML=faq_content;

    var divElement = document.createElement("DIV");
    divElement.setAttribute("class", "toggle faq faq-authors faq-miscellaneous");
    divElement.appendChild(divElementTitle);
    divElement.appendChild(divElementContent);

    return divElement;
}


/*
example of a dynamic item FAQ
<div class="toggle faq faq-authors faq-miscellaneous">
    <div class="togglet">
        <i class="toggle-closed icon-comments-alt"></i>
        <i class="toggle-open icon-comments-alt"></i>
        Helpful Resources for Authors
    </div>
    <div class="togglec">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda, dolorum, vero ipsum molestiae minima odio quo voluptate illum excepturi quam cum voluptates doloribus quae nisi tempore necessitatibus dolores ducimus enim libero eaque explicabo suscipit animi at quaerat aliquid ex expedita perspiciatis? Saepe, aperiam, nam unde quas beatae vero vitae nulla.
    </div>
</div>
*/



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