<?php
require_once 'functions.php';

$success =0;
if($data)
{
    $success = update_site_settings($conn,'email_address',$_POST['email_address']);
    $success = update_site_settings($conn,'phone_number_1',$_POST['phone_number_1']);
    $success = update_site_settings($conn,'phone_number_2',$_POST['phone_number_2']);
    $success = update_site_settings($conn,'phone_number_3',$_POST['phone_number_3']);
    $success = update_site_settings($conn,'address',$_POST['address']);
    $success = update_site_settings($conn,'facebook_link',$_POST['facebook_link']);
    $success = update_site_settings($conn,'twitter_link',$_POST['twitter_link']);
    $success = update_site_settings($conn,'linkedin_link',$_POST['linkedin_link']);
    $success = update_site_settings($conn,'youtube_link',$_POST['youtube_link']);
}

if($success)
{
    echo json_encode(array('data_success'=>'1'));
}else{
    echo json_encode(array('data_success'=>'0'));
}
