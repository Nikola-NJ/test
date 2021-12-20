<?php
    require_once "db/dbconn.php";
    require_once "util.php";

    if(isset($_POST["title"],$_POST["pitanja"],$_POST["tip"]))
    {
        $title = trim($_POST["title"]);
        isset($_POST["desc"]) ? $desc = trim($_POST["desc"]) : $desc = "" ;

        $queryForma = sprintf("INSERT INTO forma (naziv , opis, status) VALUES ('%s','%s','1')",$title,$desc);
        $resultDB = DBConn::Insert($queryForma);
        $formaID = $resultDB["insert_id"];
        if($resultDB["success"] && $resultDB["rows"] == 1 && isset($formaID))
        {
            $answerID = 1;
            foreach($_POST["pitanja"] as $key=>$pitanje)
            {
                $queryQuestions = sprintf("INSERT INTO questions (pitanje,typeID,formaID) VALUES ('%s',%d,%d)",$pitanje,$_POST["tip"][$key],$formaID);
                $resultQ = DBConn::Insert($queryQuestions);
                $questionID= $resultQ["insert_id"];
                if($resultQ["success"] && $resultQ ["rows"] == 1)
                { 
                    

                    if($_POST["tip"][$key] == 2 || $_POST["tip"][$key] == 3 )
                    {
                        
                        if((isset($_POST["answers"]) || isset($_POST["answers1"])) && $answerID == 1 )
                        {
                            $answers= array_merge($_POST["answers"],$_POST["answers1"]);
                        
                            foreach($answers as $answer)
                            {
                                $queryA = sprintf("INSERT INTO answers (odgovor, questionsID) VALUES ('%s',%d)",$answer, $questionID);
                                $resultA = DBConn::Insert($queryA);
                                if(!$resultA["success"] || $resultA["rows"] != 1)
                                {
                                    exit("Doslo je do greske pokusajte ponovo");
                                }
                            }
                        }elseif(isset($_POST["answers".$answerID]))
                            {
                                $answs = $_POST["answers".$answerID];

                                foreach($answs as $ans){
                                    $queryA = sprintf("INSERT INTO answers (odgovor, questionsID) VALUES ('%s',%d)",$ans, $questionID);
                                    $resultA = DBConn::Insert($queryA);
                                    if(!$resultA["success"] || $resultA["rows"] != 1)
                                    {
                                        exit("Doslo je do greske pokusajte ponovo");
                                    } 
                                }
                            }
                            
                        
                            
                    }
                }
                $answerID++;
            }
            echo "Uspesno ste uneli formu!" ;
        }
    }
            /*
            $i=0;
            foreach($_POST["pitanja"] as $pitanje)
            { 
                $queryQuestions = sprintf("INSERT INTO questions (pitanje,typeID,formaID) VALUES ('%s',%d,%d)",$pitanje,$_POST["tip"][$i],$formaID);
               
                $resultQ = DBConn::Insert($queryQuestions);
                if($resultQ["success"] && $resultQ ["rows"] == 1)
                { 
                    $questionID= $resultQ["insert_id"];
                    
                    if($_POST["tip"][$i] != 1)
                    {
                        $i++;
                        $numOfQuestions = sizeof($_POST["pitanja"]);
                        
                        
                            if(isset($_POST["answers".$i]))
                            {
                                $answers = $_POST["answers".$i];
                                foreach($answers as $answer)
                                {
                                    $queryA = sprintf("INSERT INTO answers (odgovor, questionsID) VALUES ('%s',%d)",$answer, $questionID);
                                    $resultA = DBConn::Insert($queryA);
                                    if($resultA["success"] && $resultA["rows"] == 1)
                                    {

                                    }else{
                                        exit("Doslo je do greske pokusajte ponovo");
                                    }
                                }
                                
                            }
                        
                    }else{
                        $i++;
                    }
                }
                
                
            }
            */
        
        
    

?>