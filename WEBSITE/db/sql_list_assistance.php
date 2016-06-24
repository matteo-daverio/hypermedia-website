<?php
    //set the include php class
    include "secure_db.php";
    //create the obj
    $db = new SecureDB();

    //call this fuction to enable debug in the class
    //$db -> enableDebug();
    //make the select

    $id = $db -> quote($_GET['Id']);

    $rows = $db -> select("SELECT * FROM assistance_services, assistance_services_title, assistance_services_subtitle, assistance_services_element WHERE assistance_services.Id=assistance_services_title.Service_id and assistance_services_title.Id=assistance_services_subtitle.Title_id and assistance_services_subtitle.Id=assistance_services_element.Subtitle_id and assistance_services.Id = " . $id  );
    
    
    //handle it
    if($rows != false){
        echo json_encode($rows);    
    }else{
        echo "Error with the SELECT";
    }
?>