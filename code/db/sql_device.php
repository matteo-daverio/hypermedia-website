 <?php
//set the include php class
include "secure_db.php";
//create the obj
$db = new SecureDB();
//call this fuction to enable debug in the class
//$db -> enableDebug();
//make the select

$id = $db -> quote($_GET['id']);
$kindOfQuery = $db -> quote($_GET['query']);



/***************************************************************/
/*************  Load Gallery query *****************************/
/***************************************************************/

if($_GET['query'] === 'gallery'){
    $rows = $db -> select("SELECT * FROM immaginiDevice WHERE id = " . $id);
    //handle it

    if($rows != false){
        echo json_encode($rows);   
    }else{
        echo "Error with the SELECT";
    }    
    
    return;
}

/***************************************************************/
/*************  Load Gallery query *****************************/
/***************************************************************/

if($_GET['query'] === 'description'){
    $rows = $db -> select("SELECT nome, promo, nuovo, prezzo, prezzoScontato, descrizione FROM device WHERE id = " . $id);
    //handle it

    if($rows != false){
        echo json_encode($rows);    
    }else{
        echo "Error with the SELECT";
    }
    
    return;
}

/***************************************************************/
/*************  Load Specification query *****************************/
/***************************************************************/

if($_GET['query'] === 'specification'){
    $rows = $db -> select("SELECT * FROM specificheDevice WHERE id = " . $id);
    //handle it

    if($rows != false){
        echo json_encode($rows);    
    }else{
        echo "Error with the SELECT";
    } 
    return;
}

/***************************************************************/
/*************  Load Sls query *****************************/
/***************************************************************/

if($_GET['query'] === 'sls'){
    
    $finalQuery = "SELECT sls.id, sls.titolo FROM device_sls RIGHT JOIN sls ON device_sls.id_sls = sls.id WHERE sls.id =" . $id;
        $result = $db -> query($finalQuery);  
        while($row = mysqli_fetch_assoc($result))
            $test[] = $row; 
        echo json_encode($test);
}

?>