<?php

require_once "db/dbconn.php";
require_once "util.php";

$query = sprintf("SELECT formaID as id, naziv as value from forma");

$resultDB = DBConn::Select($query);

$response = $resultDB["data"];

if(!isset($response))
{
    $response = array();
}
    
echo json_encode($response);





?>