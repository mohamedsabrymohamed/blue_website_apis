<?php
/**
 * Created by PhpStorm.
 * User: DEV-02-EG
 * Date: 12/15/2020
 * Time: 12:09 PM
 */
require_once 'functions.php';

$data = array();
$data['category_name'] = $_POST['category_name'];
$insert_data = add_new_category($conn, $data);
if ($insert_data) {
    echo json_encode(array('data_success' => '1'));
} else {
    echo json_encode(array('data_success' => '0'));
}