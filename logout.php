<?php
require_once 'functions.php';
$username = strtolower($_POST['username']);
$logout = logout($conn,$username);
if($logout)
{
    echo json_encode(array('data_success'=>'1'));
}else{
    echo json_encode(array('data_success'=>'0'));
}
