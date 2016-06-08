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

// handle the different category of requests
if (!empty($_GET['categoria'])){         //Called by the promotion page (promozione_sls.html)
    $categ = $db -> quote($_GET['categoria']);
    //retrive the main info of the service
    $rows = $db -> select("SELECT `id` , `titolo` , `promozione`, `des_offerta` , `des_img` FROM `sls` where categoria = " . $categ  );
}

else if($_GET['prom'] === "true"){  //Called by the promotion page (promozione_sls.html)
    $rows = $db -> select("SELECT `id` , `titolo` , `promozione` , `categoria` , `des_offerta` , `des_img` FROM `sls`  WHERE  promozione = '1' "); 
}

else if($_GET['faq'] === "true"){   //Called by the smart life service page (sls.html) to retrive the FAQ about that sls 
    $id = $db -> quote($_GET['id']); // note: default (with not id) it get the id = 0
    $rows = $db -> select("SELECT `faq_title` ,`faq_content` FROM `sls_faq` WHERE id_sls = " . $id );  
}

else if($_GET['devices'] === "true"){   //Called by the smart life service page (sls.html) to retrive the list of the devices
    $id = $db -> quote($_GET['id']); // note: default (with not id) it get the id = 0
    $rows = $db -> select("SELECT device.id , device.nome FROM device_sls JOIN device ON device_sls.id_device = device.id WHERE device_sls.id_sls =" . $id);
}
    
else{                              //Called by the smart life service page (sls.html) to retrive all the info of the service
    $id = $db -> quote($_GET['id']);
    $rows = $db -> select("SELECT `id`, `titolo` , `categoria`, `promozione`, `img_land`, `des_offerta` , `des_img`, `des_specifiche`, `act_act`, `act_img`, `act_device_correlati_nome`, `act_device_correlati_link`, `act_timricorda` FROM `sls` WHERE id = " . $id );   
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