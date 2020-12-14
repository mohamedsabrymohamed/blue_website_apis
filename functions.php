<?php
include("config.php");
/////// PHPMailer //////////////
require_once 'PHPMailer/src/Exception.php';
require_once 'PHPMailer/src/PHPMailer.php';
require_once 'PHPMailer/src/SMTP.php';
//////////////////////////////////////////////functions/////////////////////////////////////////////////////

/////////////////////////////// login /////////////////////
function verify_user($conn,$username,$user_password)
{
    $user_data = retrieve_user_by_username($conn,$username);
    if($user_data)
    {
        $password_string = hash('SHA256',$user_password);
        $user_password = hash('SHA256',$user_data['salt'].$password_string);
        if($user_password == $user_data['password'])
        {
            return $user_data['id'];
        }
    }
    return false;
}

function retrieve_user_by_username($conn,$username)
{
    $sqli = "Select id,password,salt from users where username ='".$username."'";
    $result = mysqli_query($conn,$sqli);
    $result_data = mysqli_fetch_assoc($result);
    if($result_data['id'] and !empty($result_data['id']))
    {
        return $result_data;
    }
    return false;
}

function update_user_session($conn,$user_id,$session_id)
{
    $sqli = "update users 
					SET 
					session_id = '".$session_id."'
					WHERE  
					id ='".$user_id."'";

    $result = mysqli_query($conn,$sqli);

    if($result)
    {
        return true;
    }
    return false;
}
///////////////////////////////// Logout ////////////////////////
function logout($conn,$username)
{
    $sqli = "update users 
                            SET 
                            session_id = ''
                            WHERE  
                            username ='".$username."'";

    $result = mysqli_query($conn,$sqli);

    if($result)
    {
        return true;
    }
    return false;
}

///////////////////////////////// site settings ////////////////////////
function get_all_site_settings_params($conn)
{
    $sqli = "SELECT * from site_settings";
    $result = mysqli_query($conn,$sqli);
    $result_data = array();
    while($row = mysqli_fetch_assoc($result))
    {
        $params_data[$row['param_name']] = $row['param_value'];
    }
    return $params_data;
}


function update_site_settings($conn,$param_name,$param_value)
{
    $sqli = "update site_settings set param_value = '".$param_value."' where param_name = '".$param_name."'";
    $result = mysqli_query($conn,$sqli);
    if($result)
    {
        return json_encode(array('data_success'=>'1'));
    }else{
        return json_encode(array('data_success'=>'0'));
    }
}


function retrieve_email_address($conn)
    {
        $sqli = "SELECT * from  site_settings where param_name ='email_address'";
        $result = mysqli_query($conn,$sqli);
        $result_data = mysqli_fetch_assoc($result);
        if($result_data['id'] and !empty($result_data['id']))
        {
            return $result_data;
        }
        return false;
    }

/////////////////////////////// send email /////////////////////

function send_email($conn,$subject,$txt)
{
    $phpmailer = new \PHPMailer\PHPMailer\PHPMailer(true);

    $site_settings_data = retrieve_email_address($conn);

    try {
        $to = $site_settings_data['email_address'];
        $from= $site_settings_data['email_address'];

        //Server settings
        $phpmailer->SMTPDebug = \PHPMailer\PHPMailer\SMTP::DEBUG_SERVER;
        $phpmailer->isSMTP();
        $phpmailer->Host       = 'mail.insights-marketing.co.uk';
        $phpmailer->SMTPAuth   = true;
        $phpmailer->Username   = 'info@insights-marketing.co.uk';
        $phpmailer->Password   = '-{+bV;qL3_af';
        $phpmailer->SMTPSecure = \PHPMailer\PHPMailer\PHPMailer::ENCRYPTION_SMTPS;
        $phpmailer->Port       = 465;

        $phpmailer->addAddress($to);
        $phpmailer->setFrom($from);
        $phpmailer->Subject = $subject;
        $phpmailer->isHTML(true);
        $phpmailer->Body = $txt;

        $phpmailer->Send();

        echo json_encode(array('data_success'=>'1'));
    }catch (Exception $e) {
        echo json_encode(array('data_success'=>'0'));

    }

}


/////////////////////////////// all jobs ( titles ) /////////////////////
function get_all_jobs_title($conn)
{
    $sqli = "select id,job_title FROM careers";
    $result = mysqli_query($conn,$sqli);
    $result_data = array();
    while($row = mysqli_fetch_assoc($result))
    {
        $result_data[] = $row;
    }
    return $result_data;

}

/////////////////////////////// single job /////////////////////
function get_single_job($conn,$job_id)
{
    $sqli = "select id,job_title,job_desc,start_date,end_date FROM careers where id = ".$job_id;
    $result =  mysqli_query($conn,$sqli);
    $result_data = mysqli_fetch_assoc($result);
    if($result_data['id'] and !empty($result_data['id']))
    {
        return $result_data;
    }
    return false;
}
?>
