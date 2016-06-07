//// the following 3 rows are shared in the js of each page with different parameters
//load the shared menu 
$("#header").load("shared-menu.html");
//load the shared footer
$("#footer").load("shared-footer.html");
//when page is complete select the current item of the menu
$("document").ready(function(){ $('#menu_assistenza').addClass('current');}); 


//async ajax request
$("document").ready(function() {
    var id = $_GET('Id');
    $.ajax({
        method: "GET",
        //dataType: "text", //type of data
        crossDomain: true,
        url: "db/sql_page_assistance.php", //Relative or absolute path to file.php file
        data: {Id: id},
        success: function (response) { 
            //parse the json and get an array where the index is the row and the .User is the name of the column
            var resultArray = $.parseJSON(response);
            
            //Add the html for the page
            buildPage(resultArray[0].Title, resultArray[0].Description, resultArray[0].Link, resultArray[0].Img);
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