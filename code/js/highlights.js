var DEBUG = true;

//// the following 3 rows are shared in the js of each page with different parameters
//load the shared menu 
$("#header").load("shared-menu.html");
//load the shared footer
$("#footer").load("shared-footer.html");




// position the footer in the end of the page
function placeFooter() {
    $('#footer').css({ 'margin-top': 0 });
    var windowH = $(window).height();
    var wrapperH = $('#header').height() + $('#page_title').height() + $('#content').height();
    if( windowH > wrapperH ) {
        $('#footer').css({ 'margin-top': ( windowH - wrapperH ) });        
    }
    //when page is complete select the current item of the menu
    $("document").ready(function(){ $('#menu_highlights').addClass('current');}); 
}

/************************   AJAX REQUESTS   **************************/
/*********************************************************************/

//path for phonegap that needs the real path and not the relative

var basePath;

if(DEBUG){
    basePath = '';
}else{
    basePath = 'http://timhypermedia.altervista.org/'
}


//async ajax request
$("document").ready(function() {
    var id = "highlights";
    $.ajax({
        method: "GET",
        //dataType: "text", //type of data
        crossDomain: true,
        url: basePath + "db/sql_highlights.php", //Relative or absolute path to file.php file
        data: {Id: id},
        success: function (response) { 
            
            //parse the json and get an array where the index is the row and the .User is the name of the column
            var resultArray = $.parseJSON(response);

            //Add the html for the page
            var description = [];
            var link = [];
            for (i = 0; i < resultArray.length ; i++){
                description.push(resultArray[i].Description);
                link.push(resultArray[i].Link);
            }
            
            buildPage(resultArray[0].Title, description, link);
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

function buildPage(title, description, link) {
    document.title = title;
    var titleElement = buildTitleElement(title);
    $("#highlights_title").append(titleElement);
    var pageElement = buildPageElement(description, link);
    $("#highlights_description").append(pageElement);
}

function buildTitleElement(title) {
    var titleElement = document.createElement("H1");
    titleElement.innerHTML = title;
    return titleElement;
}

function buildPageElement(description, link) {
    var pageElement = document.createElement("DIV");
    pageElement.appendChild(buildLeftSideElement(description.slice(0,5), link.slice(0,5)));
    pageElement.appendChild(buildRightSideElement(description.slice(5,10), link.slice(5,10)));
    return pageElement;
}

function buildLeftSideElement(description, link) {
    var leftDiv = document.createElement("DIV");
    leftDiv.setAttribute("class","col_half");
    
    leftDiv.appendChild(buildUL(description, link));
    return leftDiv;
}

function buildRightSideElement(description, link) {
    var rightDiv = document.createElement("DIV");
    rightDiv.setAttribute("class", "col_half col_last");
    
    rightDiv.appendChild(buildUL(description, link));
    return rightDiv;
}

function buildUL(description, link) {
    var ul = document.createElement("UL");
    ul.setAttribute("class","iconlist");
    
    for (i = 0; i < description.length ; i++){
        ul.appendChild(buildLI(description[i], link[i]));
        ul.appendChild(document.createElement("BR"));
    }
    
    return ul;
}

function buildLI(description, link) {
    var li = document.createElement("LI");
    var i = document.createElement("I");
    var a = document.createElement("A");
    
    i.setAttribute("class", "icon-play");
    a.setAttribute("href", "page.assistance.html?Id=" + link);
    a.innerHTML = description;
    
    li.appendChild(i);
    li.appendChild(a);
    
    return li;
}