 <?php
header('Access-Control-Allow-Origin: *');
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

$where = "WHERE categoria= " . $category;

if (strcmp($category, "'all_devices'") == 0){
    $where = performQueryall_devices($where, $category);
}

if(isset($_GET['filter']) && !empty($_GET['filter'])){
    $filter = $_GET['filter'];
    
    //Qui andiamo ad elaborare le informazioni del filter
    $filter = buildQuery($_GET['filter'], $db);
}

if (strcmp($query, "'gridProducts'") == 0){
    if($filter === ''){
        //In our web site in the default case the products are shown in "nuovo" ordine
        
        $rows = $db -> select("SELECT * FROM device " . $where . " ORDER BY nuovo DESC");
        
         //handle it
        if($rows != false){
            echo json_encode($rows);   
            return;
        }else{
            echo "Error with the SELECT";
            return;
        }
        
    }else{
        
        $finalQuery = "SELECT * FROM device ". $where . $filter;
 
        $result = $db -> query($finalQuery);  
        while($row = mysqli_fetch_assoc($result))
            $test[] = $row; 
        echo json_encode($test);


    }
}



if (strcmp($query, "'brands'") == 0){
    
        $rows = $db -> select("SELECT marca, count(*) as numero FROM device " . $where . " GROUP BY marca");
        
        //handle it
        if($rows != false){
            echo json_encode($rows);    
        }else{
            echo "Error with the SELECT";
        }
    
}

if (strcmp($query, "'maxPrice'") == 0){
    
        $rows = $db -> select("SELECT max(prezzo) as prezzoMax FROM device " . $where);
        
        //handle it
        if($rows != false){
            echo json_encode($rows);    
        }else{
            echo "Error with the SELECT";
        }
    
}


if (strcmp($query, "'buyMode'") == 0){
    
        $rows = $db -> select("SELECT sum(compraSubito) as compraloSubitoNumero, sum(aRate) as aRateNumero, sum(noleggio) as aNoleggioNumero FROM device " . $where);
    //handle it

        if($rows != false){
            echo json_encode($rows);    
        }else{
            echo "Error with the SELECT";
        }
}



if (strcmp($query, "'showMode'") == 0){
    
        $rows = $db -> select("SELECT sum(nuovo) as novitaNumero, sum(promo) as promoNumero FROM device " . $where);
        
        //handle it
        if($rows != false){
            echo json_encode($rows);    
        }else{
            echo "Error with the SELECT";
        }
}


if (strcmp($query, "'specificCategory'") == 0){
    
        $rows = $db -> select("SELECT distinct sottoCategoria as nomeCategoria FROM device " . $where);
        
        //handle it
        if($rows != false){
            echo json_encode($rows);    
        }else{
            echo "Error with the SELECT";
        }
}

function performQueryall_devices($where, $categoria){
    
     if (strcmp($categoria, "'all_devices'") == 0){
        return "WHERE categoria IN ('smartphone_telefoni', 'tablet_computer', 'tv_smart_living', 'modem_networking', 'outlet') AND promo = 1";
    }
}



/* data la lista filter del tipo [op1:var1;var2],[op2:varx;vary],........ applica estrazione e pulizia per ottenere una sotto query
del tipo op1 = 'var1' OR op1 = 'var2' AND op2 = 'varx' OR op2 = 'vary' ..... */
function buildQuery($filter, $db){
    
    
    $query = '';
    
    $marca = '';
    $sottoCategoria = '';
    $acquisto = '';
    $mostraSolo = '';
    $prezzo = '';
    $orderingPreference = '';
    
    $arrayOptions = preg_split("/,/", $filter);
  
    for ($i = 0; $i < count($arrayOptions); $i++) {
        
        $option = preg_split("/:/", $arrayOptions[$i]);
        
        $left = preg_split("/\[/", $option[0])[1];
        
        $right = preg_split("/\]/", $option[1])[0];
        
        $rightArray = preg_split("/\|/", $right);
        
        if (checkLeft($left)){
            
             switch ($left) {
                 case "prezzo":
                     $prezzo = buildSafePriceSubQuery($left, $rightArray, $db);
                     break;
                case "marca":
                     $marca = buildSafeSubQuery($left, $rightArray, $db);
                     break;
                case "promo":
                     $mostraSolo = helperOrConditionSameBoxAndNotListOfOptions($mostraSolo, $left, $rightArray[0], $db);
                     break;
                case "nuovo":
                     $mostraSolo = helperOrConditionSameBoxAndNotListOfOptions($mostraSolo, $left, $rightArray[0], $db);
                     break;
                case "disponibile":
                     $mostraSolo = helperOrConditionSameBoxAndNotListOfOptions($mostraSolo, $left, $rightArray[0], $db);
                     break;
                case "aRate":
                     $acquisto = helperOrConditionSameBoxAndNotListOfOptions($acquisto, $left, $rightArray[0], $db);
                     break;
                case "noleggio":
                     $acquisto = helperOrConditionSameBoxAndNotListOfOptions($acquisto, $left, $rightArray[0], $db);
                     break;
                case "compraSubito":
                     $acquisto = helperOrConditionSameBoxAndNotListOfOptions($acquisto, $left, $rightArray[0], $db);
                     break;
                case "sottoCategoria":
                     $sottoCategoria = buildSafeSubQuery($left, $rightArray, $db);
                     break;
                case "orderingPreference":
                     $orderingPreference = buildSafeOrderingPreferencesSubQuery($left, $rightArray, $db);
                     break;
            
             }   
        }
    } 
    
    $arraySubQuery = [$category, $marca, $sottoCategoria, $acquisto, $mostraSolo, $prezzo];
    
    $arraySubQueryClean = cleanFromEmptyOptions($arraySubQuery);
    
    $query = putConditionsInAnd($arraySubQueryClean);

    
    if(strcmp($orderingPreference, "") != 0){
        $query = $query . $orderingPreference;
    }
    
    return $query;
}


function putConditionsInAnd($arraySubQuery){
    
    $query = '';
    
    for ($i = 0; $i < count($arraySubQuery); $i++) {
        
        if ($i == 0){
            $query = ' AND (' . $arraySubQuery[$i] . ')';
        }else{
            $query = $query . " AND " . '(' .$arraySubQuery[$i] . ")";
        }
    
    }
    
    return $query;
}

function cleanFromEmptyOptions($arraySubQuery){
    
    $arrayClean = [];
    
    for ($i = 0; $i < count($arraySubQuery); $i++) {
        if(strcmp($arraySubQuery[$i], "") != 0){
            array_push($arrayClean, $arraySubQuery[$i]);
        }
    }
    
    
    return $arrayClean;
}

function helperOrConditionSameBoxAndNotListOfOptions($queryContainer, $left, $option, $db){
    
    //safe insert
    $option = $db -> quote($option);
    if(strcmp($queryContainer, "") == 0){
        $queryContainer = $left . "=" . $option;
    }else{
        $queryContainer = $queryContainer . " OR " . $left . "=" . $option;
    }
    
    return $queryContainer;
    
}


function buildSafeOrderingPreferencesSubQuery($left, $rightArray, $db){
    $subQuery = '';
    //0 is the new product..look at the index positions of the checkbox ordered by
    if (strcmp($rightArray[0], "0") == 0){
        $subQuery = ' ORDER BY nuovo DESC';
        return $subQuery;
    }else if (strcmp($rightArray[0], "1") == 0){ //1 is the most sold
        $subQuery = ' ORDER BY promo DESC';
        return $subQuery;
    } else if (strcmp($rightArray[0], "2") == 0){ //1 is the most sold
        $subQuery = ' ORDER BY piuVenduto DESC';
        return $subQuery;
    }else{
        return $subQuery;
    }
}

//Data una tupla del tipo [prezzo:min;max] questo metodo filtra il contenuto e li mette in OR e forma una sottoquery 
function buildSafePriceSubQuery($left, $rightArray, $db){
    $subQuery = '(prezzo BETWEEN ' . $db -> quote($rightArray[0]) . " AND " . $db -> quote($rightArray[1]). ") OR ( promo = ". "'1'" . ' AND prezzoScontato BETWEEN ' . $db -> quote($rightArray[0]) . " AND " . $db -> quote($rightArray[1]) . ")";
    return $subQuery;
}



//Data una tupla del tipo [$left:var1;var2...varn] questo metodo filtra il contenuto e li mette in OR e forma una sottoquery 
function buildSafeSubQuery($left, $rightArray, $db){
    
    $subQuery = '';
    
    
    for ($i = 0; $i < count($rightArray); $i++) {
        //safe insert
        $option = $db -> quote($rightArray[$i]);
        if($i == 0){
            $subQuery = $left . "=" . $option;
        }else{
            $subQuery = $subQuery . " OR " . $left . "=" . $option;
        }
    }
    
    return $subQuery;
}

//Controlla se il $left [$left:....] è uno di quelli noti al sistema

function checkLeft($left){
    
    $filterOption = ['marca','sottoCategoria','compraSubito','aRate','noleggio','nuovo','promo', 'disponibile', 'prezzo','orderingPreference'];
    
    if (in_array($left, $filterOption)) {
        return true;
    }
    
 return false;
    
}

?>

