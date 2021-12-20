<?php
    require_once "nav.php";
?>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>Document</title>
    <script>
        $(document).ready(function(){

            var req = "getForms.php";

            $.getJSON(req,function(result){
                $("#forma").append("<option value='-1'>------</option>");

                $.each(result, function(i, field){     

                    $("#forma").append('<option value=' + field.id + '>' + field.value + '</option>');

                });
            });

            $("#forma").change(function(){
                resetDeptValues();

                if($(this).val() != -1)
                {
                    var url = "getFormsDetails.php?id=" + $(this).val();

                    $.getJSON(url,function(result){

                        var firstRow = "<tr> <th>QuestionsID</th> <th>Question</th> <th>Type</th> <th>Answer</th> <th>Username</th> </tr>";
                        $("#data").append(firstRow); 

                        $.each(result, function(i,field){
                            
                            var row = "<tr> <td>" + field.questionsID + "</td> <td>" + field.pitanje + " </td> <td>" + field.tip + " </td> <td> " + field.odgovor+ " </td> <td> " + field.Username + " </td> </tr>" 
                              
                            $("#data").append(row);   

                        });
                    
                    });
                }
            });



            function resetDeptValues()
            {
               $("#data").html(" ");   
            }


        });
    </script>
</head>
<body>
    <form action="#" >
        <div>
            <div>Forma Response</div>
            <div>
                <select id="forma">

                </select>
            </div>
        </div>
    </form>
    <table id = "data">
        
    </table>
</body>
</html>