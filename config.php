<?php
$servername = "localhost";
$username = "root";
//$dbpass = "123456";
$dbpass = "";
$dbname = "blue_api";
$conn = new mysqli($servername, $username, $dbpass, $dbname);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
} else {
    mysqli_set_charset($conn, "utf8");
}

?>
