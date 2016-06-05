<?php
    //set the include php class
    include "secure_db.php";
    //create the obj
    $db = new SecureDB();

    //call this fuction to enable debug in the class
    //$db -> enableDebug();
    //make the select

    $rows = $db -> select("SELECT * FROM highlights");

    //handle it
    if($rows != false){
        echo json_encode($rows);    
    }else{
        echo "Error with the SELECT";
    }
?>