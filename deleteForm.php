<?php
require_once "db/dbconn.php";
require_once "util.php";

if(isset($_GET["id"]))
{
    $id = trim($_GET["id"]);

    $query = sprintf("UPDATE forma SET status = 0 WHERE formaID = %d",$id);
    $resultDB = DBConn::Update($query);
    
    header("Location: http://localhost/Form/index.php");
    die();

}









?>