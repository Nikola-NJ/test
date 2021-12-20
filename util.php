<?php
    //db params
    defined("DB_SERVER") ? "" : define("DB_SERVER","localhost");
    defined("DB_USERNAME") ? "" : define("DB_USERNAME","root");
    defined("DB_PASSWORD") ? "" : define("DB_PASSWORD","srecko31.");
    defined("DB_NAME") ? "" : define("DB_NAME","forma");

    //role
    defined("USER_ROLE_ADMIN") ? "" : define("USER_ROLE_ADMIN","1");
    defined("USER_ROLE_MEMBER") ? "" : define("USER_ROLE_MEMBER","2");



    //input type
    defined("Short_Answer") ? "" : define("Short_Answer","1");
    defined("Multiple_Choice") ? "" : define("Multiple_Choice","2");
    defined("One_Answer") ? "" : define("One_Answer","3");


?>