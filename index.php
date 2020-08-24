<?php
require('config/config.php');
session_start();
// if (@$_SESSION['username']) {
//     echo "welcome.$_SESSION[username]";
// }

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/main.css">
    <title>Forum - Homepage</title>
</head>

<body>
    <header>
        <?php
        include('header.php');

        ?>
    </header>
    <section id="center-of-page">
        <div class="container">
            <h1>Hey! <br /> DO YOU WANT </h1>
        </div>
        <a id="contact-main-page" href="connexion.php">Connect!</a>
    </section>

</body>

</html>
<?php
?>