<?php
require_once 'functions.php';

if($_GET['id'] && !empty($_GET['id']))
{
    echo json_encode(get_single_job($conn,$_GET['id']));
}else{
    echo json_encode('Please provide job id');
}

