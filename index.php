<?php
if(session_id() === "")
{
    session_start();
}

require_once "classes/bussinesLogic.php";

$forma = new bussinesLogic();
$forms = $forma->getForma();

if(isset($_SESSION["user"]))
{
    $user = unserialize($_SESSION["user"]);
}else{
    //redirect to login
}


if($user[0]["rola"] == 1)
{
    require_once "nav.php";
      /*  echo"<a href='addForm.php'><img src='img/add.png' alt='add_img' width='50' height='50'>Dodaj novu formu</a>";*/
}

?>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <title>Document</title>
</head>
<body>

    <div id="container">
     
<?php
        if($forms["success"] && $forms["rows"] > 0)
        {
            
            foreach($forms["data"] as $form)
            {
                echo "<div class='col'>";
                if($user[0]["rola"] == 1)
                {
                    printf("<a class='kocka' href='submitform.php?id=%s'>
                            <div>
                                <h2>%s</h2>
                                <h4>%s</h4>
                            </div></a>
                            <div class='deleteForm'>
                                <a href='deleteForm.php?id=%s'><ion-icon class='circle' name='close-circle-outline'></ion-icon></a>
                            </div>
                            " 
                        ,$form["ID"],$form["TITLE"], $form["DESCRIPTION"],$form["ID"]);
                }else{

                    printf("<a class='kocka' href='submitform.php?id=%s'>
                                <div>
                                    <h2>%s</h2>
                                    <h4>%s</h4>
                                </div></a>"
                                
                            ,$form["ID"],$form["TITLE"], $form["DESCRIPTION"]);
                }
                echo "</div>";
                        
            }

        }else{
            echo "Trenutno ne postoje forme koje mozete da popunite";
        }

?>

    </div>
</body>
</html>