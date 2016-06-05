 <?php
//set the include php class
include "../db/secure_db.php";

//create the obj
$db = new SecureDB();

// Quote and escape form submitted values (security reason)
$name = $db -> quote($_POST['username']);
$email = $db -> quote($_POST['email']);

// Insert the values into the database
$result = $db -> query("INSERT INTO `users` (`name`,`email`) VALUES (" . $name . "," . $email . ")");

?>