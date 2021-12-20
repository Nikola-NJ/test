<?php
if(session_id() === "")
{
    session_start();
}
require_once "classes/bussinesLogic.php";

$forma = new bussinesLogic();
$resultDB = $forma->Login();

if(isset($resultDB))
{
    if($resultDB["success"] && $resultDB["rows"] == 1)
    {   
        $_SESSION["user"] = serialize($resultDB["data"]);
        header("Location:index.php");
        exit;
    }
}

?>

<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
        <title>Document</title>
    </head>
    <body>
        <div>
            <form action="login.php" method="POST">
                <div>
                    <div>
                        <div>Username</div>
                        <div><input type="text" name="username"></div>
                    </div>

                    <div>
                        <div>Password</div>
                        <div><input type="password" name="password"></div>
                    </div>

                    <div>
                        <div><input type="reset" name="reset" value = "Reset">
                        <input type="submit" name="submit" value = "Submit"></div>
                    </div>

                </div>
            </form>


        </div>
    </body>
    </html>