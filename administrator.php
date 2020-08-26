<?php
// includ('config/config.php');
    session_start();
    if(empty($_SESSION['id']) || $_SESSION['permission'] != "1"){
        header('Location: index.php');
    }
    if(isset($_POST['click'])){
        include("config/config.php");
        $insert="INSERT INTO topics (nom,description,rang_min ) VALUES ('".$_POST['name']."','".$_POST['description']."',".$_POST['rang'].")";
        mysqli_query($dbconnect,$insert);
        header('Location:topic.php');
    }  

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <title>Forum - Adminisrator</title>
</head>
<body id="admin">
    <div class="adminpage">
    <h1>This page is for administrators</h1><br>
    <h1></h1>
    
    
    <form class="fordesi"  method="post" action="administrator.php">
        <input placeholder="Name" class="inputinput" type="text" name="name"> <br><br>
        <input placeholder="Description" class="inputinput" type="text" name="description"> <br><br>
        <input placeholder="Rang" class="inputinput" type="number" name="rang"> <br><br>
        <button  name="click">Create</button>
    </form>
    </div>
    


    
</body>
</html>
