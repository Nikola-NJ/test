<?php
require_once "db/dbconn.php";
require_once "util.php";

class bussinesLogic
{

    public function getForma()
    {
        $query="SELECT f.formaID as ID,f.naziv AS TITLE, f.opis as DESCRIPTION, f.status AS STATUS from Forma f
                WHERE status = 1";

        $resultDB = DBConn::Select($query);

        return $resultDB;
    }



    public function getQuestions($formaID)
    {
        $query = sprintf("SELECT q.questionsID, q.pitanje, q.typeID, at.tip,  q.formaID, f.naziv, a.odgovor, a.answerID FROM questions q
                         JOIN answertype at ON q.typeID = at.typeID
                         JOIN forma f ON q.formaID = f.formaID 
                         LEFT JOIN answers a ON q.questionsID = a.questionsID
                         WHERE q.formaID = '%s'",$formaID);
        
        
        $resultDB = DBConn::Select($query);

        return $resultDB;
    }


    public function Login()
    {
  
        if(isset($_POST["username"],$_POST["password"]))
        {
           
            $username = trim($_POST["username"]);
            $password = trim($_POST["password"]);

            $username = sprintf(" AND username = '%s'",$username);
            $password = sprintf(" AND password = '%s'",$password);

            $query = sprintf("SELECT userID, username, rola  FROM users  
                                WHERE 1=1 %s %s",$username , $password);
                                

            $resultDB = DBConn::Select($query);

            return $resultDB;
        }
    }

}











?>