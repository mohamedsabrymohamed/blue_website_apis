<?php
require_once 'functions.php';

$data = array();
$data['job_title'] = $_POST['job_title'];
$data['job_desc'] = $_POST['job_desc'];
$data['cat_id'] = $_POST['cat_id'];
$data['start_date'] = $_POST['start_date'];
$data['end_date'] = $_POST['end_date'];
$data['created_by'] = @$_SESSION['user_id'];
$data['created_date'] = DATE('Y-m-d H:i:s');

$insert_data = add_new_career($conn, $data);
if ($insert_data) {
    echo json_encode(array('data_success' => '1'));
} else {
    echo json_encode(array('data_success' => '0'));
}

