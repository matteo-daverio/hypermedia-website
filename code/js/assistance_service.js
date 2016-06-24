var DEBUG = false;
var windowHeight = $(window).height();
var windowWidth = $(window).width();
var epsilon = 0.1;

//path for phonegap that needs the real path and not the relative

var basePath;

if(DEBUG){
    basePath = '';
}else{
    basePath = 'http://timhypermedia.altervista.org/'
}



//set the name and the url of the previous visited page
setDynamicGoBack();
function setDynamicGoBack(){
    var previous_url = document.referrer;
    if (contains(previous_url,"assistance_services.html?Id=1") === true){
        $("#ass_goto").html("Vai a <b>Gestione Linea e Servizi</b>");
        $("#ass_goto").attr("href", "javascript:history.back()");
    }else if(contains(previous_url,"assistance_services.html?Id=2") === true){
        $("#ass_goto").html("Vai a <b>Controllo Costi e Pagamenti</b>");
        $("#ass_goto").attr("href","javascript:history.back()");
    }else if(contains(previous_url,"assistance_services.html?Id=3") === true){
        $("#ass_goto").html("Vai a <b>Supporto Tecnico e Configurazione</b>");
        $("#ass_goto").attr("href","javascript:history.back()");
    }else if(contains(previous_url,"assistance_services.html?Id=4") === true){
        $("#ass_goto").html("Vai a <b>Contenuti e Smart Life</b>");
        $("#ass_goto").attr("href","javascript:history.back()");
    }else if(contains(previous_url,"device.html") === true){
        $("#ass_goto").html("Vai al device precedente");
        $("#ass_goto").attr("href","javascript:history.back()");
    }else if(contains(previous_url,"menu.highlights.html") === true){
        $("#ass_goto").html("Vai a <b>Highlights</b>");
        $("#ass_goto").attr("href","javascript:history.back()");
    }else { //set default link if 
        $("#ass_goto").html("Vai alla <b>Pagina precedente</b>");
        $("#ass_goto").attr("href", "javascript:history.back()"); 
    }
}

//check if str contain sub_str
function contains(str,sub_str){
   return (str.indexOf(sub_str) > -1);
}


jQuery(window).resize(function () {
    if( 
        (Math.abs( (windowHeight - $(window).height()) / (windowHeight + $(window).height())) < epsilon &&
        Math.abs( (windowWidth - $(window).width()) / (windowWidth + $(window).width())) < epsilon ) && 
        Math.abs( (windowHeight - $(window).height()) / (windowHeight + $(window).height())) !== 0 &&
        Math.abs( (windowWidth - $(window).width()) / (windowWidth + $(window).width())) !== 0 
        ){
        return;
    }
    
    if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) 
       && windowWidth === $(window).width()){
        return;
    }else{
        windowWidth = $(window).width();
    }
    placeFooter();
});


// calculate the position of the footer
function placeFooter() {
    $('#footer').css({ 'margin-top': 0 });
    windowHeight = $(window).height();
    windowWidth = $(window).width();
    var windowH = $(window).height();
    var wrapperH = $('#header').height() + $('#page_title').height() + $('#content').height();
    if( windowH > wrapperH ) {
        $('#footer').css({ 'margin-top': ( windowH - wrapperH ) });        
    }
    //when page is complete select the current item of the menu
    $("document").ready(function(){ $('#menu_assistenza').addClass('current');}); 
}

/*********************************************************************/
/************************   AJAX REQUESTS   **************************/
/*********************************************************************/


//async ajax request
$("document").ready(function() {
    var id = $_GET('Id');
    $.ajax({
        method: "GET",
        //dataType: "text", //type of data
        crossDomain: true,
        url: basePath + "db/sql_page_assistance.php", //Relative or absolute path to file.php file
        data: {Id: id},
        success: function (response) { 
            //parse the json and get an array where the index is the row and the .User is the name of the column
            var resultArray = $.parseJSON(response);
            
            //Add the html for the page
            buildPage(resultArray[0].Title, resultArray[0].Description, resultArray[0].Link, resultArray[0].Img);
            placeFooter();
        },
        error: function(request,error) {
            console.log(request+":"+error);
        }
    });
});



/***************************************************************************/
/* helper functions to build highlights page*/
/***************************************************************************/

function buildPage(title, description, link, image) {
    document.title = title;
    var titleElement = buildTitleElement(title);
    $("#page_title").append(titleElement);
    var pageElement = buildPageElement(description);
    $("#page_content").append(pageElement);
    var linkElement = buildLinkElement(link);
    $("#page_link").append(linkElement);
    var imageElement = buildImageElement(image);
    $("#page_image").append(imageElement);
}

function buildTitleElement(title) {
    var titleElement = document.createElement("H1");
    titleElement.innerHTML = title;
    return titleElement;
}

function buildPageElement(description) {
    var pageElement = document.createElement("DIV");
    pageElement.innerHTML = description;
    return pageElement;
}

function buildLinkElement(link) {
    var linkElement = document.createElement("DIV");
    linkElement.setAttribute("style", "padding-left:20px;");
    console.log(link);
    if (link==='0') {
        linkElement.innerHTML = "Nessun dispositivo";
    } else {
        var to = document.createElement("A");
        to.setAttribute("href", link);
        to.innerHTML = "Vai ai dispositivi";
        linkElement.appendChild(to);
    }  
    return linkElement;
}

function buildImageElement(image) {
    var imageElement = document.createElement("IMG");
    imageElement.setAttribute("src", "images/assistenza/" + image + ".png");
    imageElement.setAttribute("alt", image);
    imageElement.setAttribute("class", "img-rounded");
    return imageElement;
}


/***************************************************************************/
/* helper functions to read get parameters*/
/***************************************************************************/

function $_GET(param) {
	var vars = {};
	window.location.href.replace( location.hash, '' ).replace( 
		/[?&]+([^=&]+)=?([^&]*)?/gi, // regexp
		function( m, key, value ) { // callback
			vars[key] = value !== undefined ? value : '';
		}
	);

	if ( param ) {
		return vars[param] ? vars[param] : null;	
	}
	return vars;
}