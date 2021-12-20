<?php
//dbconn.php
require_once("util.php");

class DBConn
{   
    private static $conn;

    public static function Select($query)
    {
        self::openConnection();

        $resultDB = self::$conn->query($query);
        
        $result["success"] = self::$conn->errno ? false : true;
        $result["error"]["code"] = self::$conn->errno; 
        $result["error"]["message"] = self::$conn->error;
        $result["rows"] = self::$conn->affected_rows;


        if(!self::$conn->errno)
        {
            while($row = $resultDB->fetch_assoc())
            {
                $result["data"][] = $row;
            }

        }

        self::closeConnection();

        return $result;
    }


    public static function Update($query)
    {
        self::openConnection();

        $resultDB = self::$conn->query($query);
        
        $result["success"] = self::$conn->errno ? false : true;
        $result["error"]["code"] = self::$conn->errno; 
        $result["error"]["message"] = self::$conn->error;
        $result["rows"] = self::$conn->affected_rows;

        self::closeConnection();

        return $result;
    }


    public static function Insert($query)
    {
        self::openConnection();

        $resultDB = self::$conn->query($query);
        
        $result["success"] = self::$conn->errno ? false : true;
        $result["error"]["code"] = self::$conn->errno; 
        $result["error"]["message"] = self::$conn->error;
        $result["rows"] = self::$conn->affected_rows;
        $result["insert_id"] = -1;

        if(!self::$conn->errno)
        {
            
            $result["insert_id"] = self::$conn->insert_id;
            
        }

        self::closeConnection();

        return $result;
    }



    private static function openConnection()
    {
        self::$conn = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
    }

    private static function closeConnection()
    {
        self::$conn->close();
    }



}




?>