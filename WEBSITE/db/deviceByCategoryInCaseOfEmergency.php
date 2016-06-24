 <?php
//set the include php class
include "secure_db.php";
//create the obj
$db = new SecureDB();
//call this fuction to enable debug in the class
//$db -> enableDebug();
//make the select

/*********************************************************************/
/************************   GET PARAMETERS   *************************/
/*********************************************************************/
$query = $db -> quote($_GET['query']);
$category = $db -> quote($_GET['categoria']);

$filter = '';
if(isset($_GET['filter']) && !empty($_GET['filter'])){
    $filter = $_GET['filter'];
  //  $filter = rc4("password", $filter);
}

if (strcmp($query, "'gridProducts'") == 0){
    if($filter === ''){
        $rows = $db -> select("SELECT * FROM device WHERE categoria= " . $category);
    }else{
        //Funziona.
       $rows = $db -> select("SELECT * FROM device WHERE categoria= " . $category . " AND " . $filter);
}
    
    //handle it
   if($rows != false){
        echo json_encode($rows);    
    }else{
        echo "Error with the SELECT";
    }
}



if (strcmp($query, "'brands'") == 0){

    $rows = $db -> select("SELECT marca, count(*) as numero FROM device WHERE categoria= " . $category . " GROUP BY marca");
    //handle it

    if($rows != false){
        echo json_encode($rows);    
    }else{
        echo "Error with the SELECT";
    }
}

if (strcmp($query, "'buyMode'") == 0){

    $rows = $db -> select("SELECT sum(compraSubito) as compraloSubitoNumero, sum(aRate) as aRateNumero, sum(noleggio) as aNoleggioNumero FROM device WHERE categoria= " . $category);
    //handle it

    if($rows != false){
        echo json_encode($rows);    
    }else{
        echo "Error with the SELECT";
    }
}



if (strcmp($query, "'showMode'") == 0){

    $rows = $db -> select("SELECT sum(nuovo) as novitaNumero, sum(promo) as promoNumero, sum(disponibile) as disponibileNumero FROM device WHERE categoria = " . $category);
    //handle it

    if($rows != false){
        echo json_encode($rows);    
    }else{
        echo "Error with the SELECT";
    }
}


if (strcmp($query, "'specificCategory'") == 0){

    $rows = $db -> select("SELECT distinct sottoCategoria as nomeCategoria FROM device WHERE categoria = " . $category);
    //handle it

    if($rows != false){
        echo json_encode($rows);    
    }else{
        echo "Error with the SELECT";
    }
}

?>

