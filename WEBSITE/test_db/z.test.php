<?php
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "my_db";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

if( $_GET["id"]) {
     echo $_GET["id"];
}else{
    echo "Non ho ricevuto niente";
}



echo "Connected successfully";



$sql = "SELECT * FROM user WHERE iduser = ". $_GET["id"];
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "id: " . $row["iduser"]. " - Name: " . $row["Firstname"]. " " . $row["Lastname"]. "<br>";
    }
} else {
    echo "0 results";
}
$conn->close();
?>
