<?php
require_once 'functions.php';

echo json_encode(get_all_site_settings_params($conn));
