 <?php
/**
*   Php to handle the query to the db about the smartlife service
**/

//set the include php class
include "secure_db.php";
//create the obj
$db = new SecureDB();

//call this fuction to enable debug in the class
//$db -> enableDebug();

// handle the different type of requests
if (!empty($_GET['type'])){         //Called by the promotion page (promozione_sls.html)
    $type = $db -> quote($_GET['type']);
    //retrive the main info of the service
    $rows = $db -> select("SELECT `id` , `titolo` , `promozione`, `des_offerta` , `des_img` FROM `sls` where tipo = " . $type  );
}

else if($_GET['prom'] === "true"){  //Called by the promotion page (promozione_sls.html)
$rows = $db -> select("SELECT `id` , `titolo` , `promozione` , `tipo` , `des_offerta` , `des_img` FROM `sls`  WHERE  promozione = '1' "); 
}
else if($_GET['faq'] === "true"){   //Called by the smart life service page (sls.html) to retrive the FAQ about that sls 
    $id = $db -> quote($_GET['id']); // note: default (with not id) it get the id = 0
    $rows = $db -> select("SELECT `faq_title` ,`faq_content` FROM `sls_faq` WHERE id_sls = " . $id );  
    
}else{                              //Called by the smart life service page (sls.html) to retrive all the info of the service
    $id = $db -> quote($_GET['id']);
    $rows = $db -> select("SELECT `id`, `titolo` , `promozione`, `img_land`, `des_offerta` , `des_img`, `des_specifiche`, `act_act`,`act_img`,`act_timricorda` FROM `sls` WHERE id = " . $id );   
}

//uncomment for debug 
//var_dump($rows);
    
//handle the reply
if($rows != false){
    //return in a json format
    echo json_encode($rows);    
}else{
    echo "Error with the SELECT";
}
?>