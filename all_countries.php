<?php
/**
 * Created by PhpStorm.
 * User: DEV-02-EG
 * Date: 12/15/2020
 * Time: 12:20 PM
 */
require_once 'functions.php';

echo json_encode(get_all_countries($conn));
