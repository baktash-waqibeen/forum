<?php 
require ('config/config.php');


$check = ("SELECT * FROM utilisateurs");
$rows = mysqli_num_rows($check);
$myquery = mysqli_query($dbconnect,$check);

    while($rows = mysqli_fetch_assoc($check));{
        $id = $rows ['id'];
    }

?>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fourm - Members</title>
</head>
<body>
    
</body>
</html>


