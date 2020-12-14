<?php
require_once 'functions.php';

echo json_encode(get_all_jobs_title($conn));
