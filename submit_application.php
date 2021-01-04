<?php
/**
 * Created by PhpStorm.
 * User: DEV-02-EG
 * Date: 12/15/2020
 * Time: 1:27 PM
 */

require_once 'functions.php';

$data = array();
$data['full_name'] = $_POST['fullName'];
$data['date_of_birth'] = $_POST['birthDate'];
$data['email'] = $_POST['appEmail'];
$data['phone'] = $_POST['appPhoneNumber'];
$data['country_id'] = $_POST['appCountry'];
$data['address'] = $_POST['appAddress'];
$data['linkedin_link'] = $_POST['appLinkedIn'];
$data['behance_link'] = $_POST['appBehance'];
$data['comment'] = $_POST['appMessage'];
$data['job_id'] = $_POST['id'];

if (!empty($_FILES['appUploadCV'])) {
    $resume = file_upload("appUploadCV", "resume");
    if ($resume) {
        $data['resume'] = $resume;
    }
}
if (!empty($_FILES['appPortofolio'])) {
    $portofolio = file_upload("appPortofolio", "portofolio");
    if ($portofolio) {
        $data['portofolio'] = $portofolio;
    }
}

$insert_data = submit_application($conn, $data);
if ($insert_data) {
    echo json_encode(array('data_success' => '1'));
} else {
    echo json_encode(array('data_success' => '0'));
}