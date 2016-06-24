 <?php
//set the include php class
include "../db/secure_db.php";
//create the obj
$db = new SecureDB();

//make the select
$rows = $db -> select("SELECT `User` FROM `user` ");
    
//handle it
if($rows != false){
    if (count($rows)> 0) {
       foreach ($rows as &$row) {
            echo "user: " . $row["User"] . "<br>";
        }
     } else {
        echo "No results";
     }    
}else{
    echo "Error with the SELECT";
}

?>