<?php
include("config.php");
/////// PHPMailer //////////////
require_once 'PHPMailer/src/Exception.php';
require_once 'PHPMailer/src/PHPMailer.php';
require_once 'PHPMailer/src/SMTP.php';
//////////////////////////////////////////////functions/////////////////////////////////////////////////////

/////////////////////////////// build insert query /////////////////////

function build_insert_query(array $data, $conn, $table)
{
    $query_string = "";
    if (count($data) > 0) {
        $key_string = "";
        $value_string = "";
        $i = 0;
        foreach ($data as $key => $value) {
            $i++;
            if ($i != 1) {
                $key_string .= ", ";
                $value_string .= ", ";
            }
            $key_string .= "`" . $key . "`";
            if (!isset($value)) {
                $value_string .= "NULL";
            } else {
                $value_string .= "'" . mysqli_real_escape_string($conn, $value) . "'";
            }
        }
        $query_string = "INSERT INTO `" . $table . "` (" . $key_string . ") VALUES(" . $value_string . ")";
    }
    return $query_string;
}

/////////////////////////////// Insert /////////////////////

function insert(array $data, $conn, $table)
{
    $insert_query = build_insert_query($data, $conn, $table);
    if ($insert_query and !empty($insert_query)) {
        mysqli_query($conn, $insert_query);
        return true;
    }
    return false;

}

/////////////////////////////// build update query /////////////////////

function build_update_query($data, $where, $conn, $table)
{
    $i = 0;
    $query_string = "";
    foreach ($data as $key => $value) {
        $i++;
        if ($i != 1) {
            $query_string .= ", ";
        }
        $query_string .= "`" . $key . "`='" . mysqli_real_escape_string($conn, $value) . "'";
    }
    $query_string = "UPDATE `" . $table . "` SET " . $query_string . " where " . $where;
    return $query_string;
}

/////////////////////////////// Update /////////////////////

function update(array $data, $where, $conn, $table)
{
    $update_query = build_update_query($data, $where, $conn, $table);
    if ($update_query and !empty($update_query)) {
        mysqli_query($conn, $update_query);
        return true;
    }
    return false;
}

/////////////////////////////// login /////////////////////
function verify_user($conn, $username, $user_password)
{
    $user_data = retrieve_user_by_username($conn, $username);
    if ($user_data) {
        $password_string = hash('SHA256', $user_password);
        $user_password = hash('SHA256', $user_data['salt'] . $password_string);
        if ($user_password == $user_data['password']) {
            return $user_data['id'];
        }
    }
    return false;
}

function retrieve_user_by_username($conn, $username)
{
    $sqli = "Select id,password,salt from users where username ='" . $username . "'";
    $result = mysqli_query($conn, $sqli);
    $result_data = mysqli_fetch_assoc($result);
    if ($result_data['id'] and !empty($result_data['id'])) {
        return $result_data;
    }
    return false;
}

function update_user_session($conn, $user_id, $session_id)
{
    $sqli = "update users 
					SET 
					session_id = '" . $session_id . "'
					WHERE  
					id ='" . $user_id . "'";

    $result = mysqli_query($conn, $sqli);

    if ($result) {
        return true;
    }
    return false;
}

///////////////////////////////// Logout ////////////////////////
function logout($conn, $username)
{
    $sqli = "update users 
                            SET 
                            session_id = ''
                            WHERE  
                            username ='" . $username . "'";

    $result = mysqli_query($conn, $sqli);

    if ($result) {
        return true;
    }
    return false;
}

///////////////////////////////// site settings ////////////////////////
function get_all_site_settings_params($conn)
{
    $sqli = "SELECT * from site_settings";
    $result = mysqli_query($conn, $sqli);
    $result_data = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $params_data[$row['param_name']] = $row['param_value'];
    }
    return $params_data;
}


function update_site_settings($conn, $param_name, $param_value)
{
    $sqli = "update site_settings set param_value = '" . $param_value . "' where param_name = '" . $param_name . "'";

    $result = mysqli_query($conn, $sqli);
    if ($result) {
        return json_encode(array('data_success' => '1'));
    } else {
        return json_encode(array('data_success' => '0'));
    }
}


function retrieve_email_address($conn)
{
    $sqli = "SELECT * from  site_settings where param_name ='email_address'";
    $result = mysqli_query($conn, $sqli);
    $result_data = mysqli_fetch_assoc($result);
    if ($result_data['id'] and !empty($result_data['id'])) {
        return $result_data['param_value'];
    }
    return false;
}

/////////////////////////////// send email /////////////////////

function send_email($conn, $subject, $txt)
{
    $phpmailer = new \PHPMailer\PHPMailer\PHPMailer(true);
    $site_settings_data = retrieve_email_address($conn);
    $email_address = $site_settings_data;

    try {
        $to = $email_address;
        $from = $email_address;

        //Server settings
        $phpmailer->SMTPDebug = \PHPMailer\PHPMailer\SMTP::DEBUG_SERVER;
        $phpmailer->isSMTP();
        $phpmailer->Host = 'blueholding.co.uk';
        $phpmailer->SMTPAuth = true;
        $phpmailer->Username = 'info@blueholding.co.uk';
        $phpmailer->Password = 'w_@a,$7y;8Hv';
        $phpmailer->SMTPSecure = \PHPMailer\PHPMailer\PHPMailer::ENCRYPTION_SMTPS;
        $phpmailer->Port = 465;

        $phpmailer->addAddress($to);
        $phpmailer->setFrom($from);
        $phpmailer->Subject = $subject;
        $phpmailer->isHTML(true);
        $phpmailer->Body = $txt;

        $phpmailer->Send();

        echo json_encode(array('data_success' => '1'));
    } catch (Exception $e) {
        echo json_encode(array('data_success' => '0'));

    }


    if (mail($email_address, $subject, $txt)) {
        echo json_encode(array('data_success' => '1'));
    } else {
        echo json_encode(array('data_success' => '0'));
    }

}


/////////////////////////////// all jobs ( titles ) /////////////////////
function get_all_jobs_title($conn)
{
    $sqli = "select id,job_title FROM careers";
    $result = mysqli_query($conn, $sqli);
    $result_data = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $result_data[] = $row;
    }
    return $result_data;

}

/////////////////////////////// single job /////////////////////
function get_single_job($conn, $job_id)
{
    $sqli = "select id,job_title,job_desc,start_date,end_date,cat_id FROM careers where id = " . $job_id;
    $result = mysqli_query($conn, $sqli);
    $result_data = mysqli_fetch_assoc($result);
    if ($result_data['id'] and !empty($result_data['id'])) {
        return $result_data;
    }
    return false;
}

/////////////////////////////// all careers /////////////////////
function get_all_careers($conn)
{
    $sqli = "select c.id,c.job_title,c.job_desc,c.start_date,c.end_date,cat.category_name,u.username,c.created_date 
            FROM careers as c , career_categories as cat, users as u
            where c.cat_id = cat.id
            and 
            c.created_by = u.id
            ";

    $result = mysqli_query($conn, $sqli);
    $result_data = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $result_data[] = $row;
    }
    return $result_data;

}

/////////////////////////////// add new career /////////////////////

function add_new_career($conn, $data)
{
    $table = 'careers';
    $insert = insert($data, $conn, $table);
    if ($insert) {
        return true;
    } else {
        return false;
    }
}


function update_career($conn, $data, $where)
{
    $table = 'careers';
    $update = update($data, $where, $conn, $table);
    if ($update) {
        return true;
    } else {
        return false;
    }
}

/////////////////////////////// all categories /////////////////////

function get_all_categories($conn)
{
    $sqli = "select * FROM career_categories ";
    $result = mysqli_query($conn, $sqli);
    $result_data = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $result_data[] = $row;
    }
    return $result_data;

}

/////////////////////////////// add new category /////////////////////

function add_new_category($conn, $data)
{
    $table = 'career_categories';
    $insert = insert($data, $conn, $table);
    if ($insert) {
        return true;
    } else {
        return false;
    }
}

/////////////////////////////// all countries /////////////////////

function get_all_countries($conn)
{
    $sqli = "select id,country_name FROM countries";
    $result = mysqli_query($conn, $sqli);
    $result_data = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $result_data[] = $row;
    }
    return $result_data;

}

/////////////////////////  file upload /////////////////////////////
function file_upload($file, $folder)
{
    $fileName = $_FILES[$file]["name"];
    $fileSize = $_FILES[$file]["size"] / 1024;
    $fileType = $_FILES[$file]["type"];
    $fileTmpName = $_FILES[$file]["tmp_name"];

    if ($fileType == "application/msword" || $fileType == "application/pdf" || $fileType = "application/vnd.openxmlformats-officedocument.wordprocessing") {
        if ($fileSize <= 5120) {

            //New file name
            $random = rand(1111, 9999);
            $newFileName = $random . $fileName;

            //File upload path
            $uploadPath = "uploads/" . $folder . "/" . $newFileName;

            //function for upload file
            if (move_uploaded_file($fileTmpName, $uploadPath)) {
                return $newFileName;
            }
        } else {
            echo json_encode("Maximum upload file size limit is 5 Mb");
        }
    } else {
        echo json_encode("You can only upload a Word doc or pdf file.");
    }
    return false;
}

///////////////////////// submit applications //////////////////////
function submit_application($conn, $data)
{
    $table = 'applications';
    $insert = insert($data, $conn, $table);
    if ($insert) {
        return true;
    } else {
        return false;
    }
}



/////////////////////////////// all applications /////////////////////
function get_all_applications($conn)
{
    $sqli = "SELECT app.full_name,app.`date_of_birth`,app.email,app.phone,contr.country_name,app.address,app.linkedin_link,app.behance_link,concat('https://blueholding.co.uk/blue_website_apis/uploads/resume/',app.resume) as resume,concat('https://blueholding.co.uk/blue_website_apis/uploads/portofolio/',app.`portofolio`) as portofolio,app.comment,c.job_title
                FROM `applications`  app, careers as c , countries as contr
                WHERE 
                app.country_id = contr.id
                AND
                app.job_id = c.id
                ";

    $result = mysqli_query($conn, $sqli);
    $result_data = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $result_data[] = $row;
    }
    return $result_data;

}


?>
