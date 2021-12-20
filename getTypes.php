<?php
    require_once "db/dbconn.php";
    require_once "util.php";


    $query= sprintf("SELECT typeID as ID , tip as TYPE from answertype");

        $resultDB = DBConn::Select($query);
        
        echo json_encode($resultDB["data"]);

?>