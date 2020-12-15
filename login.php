<?php
session_start();
require_once 'functions.php';
$username = strtolower($_POST['username']);
$password = $_POST['password'];
$user_id = verify_user($conn,$username,$password);
if($user_id)
{
    $session_id = session_id();
    $_SESSION['user_id'] = $user_id;
    update_user_session($conn,$user_id,$session_id);
    echo json_encode(array('data_success'=>'1',
    'session_id'=>$session_id));
}else{
    echo json_encode(array('data_success'=>'0'));
}
