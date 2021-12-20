<?php
require_once "db/dbconn.php";
require_once "util.php";

if(ISSET($_GET["id"]))
{
    $id = $_GET["id"];


    $query = sprintf(" SELECT
                            q.questionsID,
                            q.pitanje,
                            at.tip,
                            a.odgovor,
                            ui.input,
                            u.username as Username,
                            uu.username as Username2
                            
                        FROM
                            questions q
                            left JOIN answertype at ON q.typeID = at.typeID
                            left JOIN answers a ON q.questionsID = a.questionsID 
                            left JOIN userinput ui ON q.questionsID = ui.questionsID
                            left join users u on ui.userID = u.userID
                            left join useranswers us on a.answerID = us.answerID
                            left join users uu on us.userID = uu.userID
                        WHERE
                            q.formaID = '%s'", $id);


    $resultDB = DBConn::Select($query);

    
    foreach($resultDB["data"] as $res => $r){
        $resultDB["data"][$res]['Username'] = $resultDB["data"][$res]['Username'] ?? $r['Username2'];
        $resultDB["data"][$res]['odgovor'] = $resultDB["data"][$res]['odgovor'] ?? $r['input'];
    }
    

    $response = $resultDB["data"];


    if(!ISSET($response))
    {
        $response = array();
    }

    echo json_encode($response);
    
}








?>