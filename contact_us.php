<?php
require_once 'functions.php';

$first_name = $_POST['uname'];
$last_name = $_POST['last_name'];
$email = $_POST['email'];
$contact_subject = $_POST['subject'];
$body = $_POST['body'];
$subject = 'Contact Us Form';
$txt = "First Name: ".$first_name."<br> Last Name: ".$last_name."<br> Email: ".$email."<br> Subject: ".$contact_subject."<br> Body: ".$body;


send_email($conn,$subject,$txt);

?>
