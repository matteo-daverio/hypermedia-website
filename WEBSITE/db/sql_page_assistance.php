<?php
    //set the include php class
    include "secure_db.php";
    //create the obj
    $db = new SecureDB();

    //call this fuction to enable debug in the class
    //$db -> enableDebug();
    //make the select

    $id = $db -> quote($_GET['Id']);

    $rows = $db -> select("SELECT * FROM page_assistance WHERE Id = " . $id);

    //handle it
    if($rows != false){
        echo json_encode($rows);    
    }else{
        echo "Error with the SELECT";
    }
?>