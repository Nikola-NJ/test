<?php
    require_once "db/dbconn.php";
    require_once "util.php";
var_dump($_REQUEST);
die();
    
    if(isset($_POST["userID"],$_POST["submit"]))
    {
        $userID = $_REQUEST["userID"];
        
        foreach($_REQUEST as $key=>$data)
        {
            $explode = explode("_",$key);
            $type = $explode[0];

            $exp = explode("_",$data);    

            $success = true;
            if($type == "text")
            {
                $query= sprintf("INSERT INTO userinput (input, questionsID, userID) VALUES ('%s',%d, %d)",$data,$explode[1],$userID);
                $resultDB = DBConn::Insert($query);
                if(!$resultDB["success"] || $resultDB["rows"] != 1 )
                {
                    $success = false;
                }
            }else if($type == "checkbox")
            {
                $query= sprintf("INSERT INTO useranswers (userID, answerID) VALUES ('%s',%d)",$userID,$explode[2]);
                $resultDB = DBConn::Insert($query);
                if(!$resultDB["success"] || $resultDB["rows"] != 1 )
                {
                    $success = false;
                }
            }else if ($type == "radio")
            {
                $query= sprintf("INSERT INTO useranswers (userID, answerID) VALUES ('%s',%d)",$userID,$exp[1]);
                $resultDB = DBConn::Insert($query);
                if(!$resultDB["success"] || $resultDB["rows"] != 1 )
                {
                    $success = false;
                }
            }
            
        }

            if($success)
            {
                echo "Uspesno ste popunili formu!";
            }else{
                echo "Doslo je do greske pokusajte ponovo da popunite formu!";
            }
    }





?>