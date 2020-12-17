<?php
require_once 'functions.php';


$email = $_POST['uEmail'];
$subject = 'Newsletter Form';
$txt = " Email: ".$email;

send_email($conn,$subject,$txt);

?>
