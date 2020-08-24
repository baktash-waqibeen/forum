<?php
date_default_timezone_set('Europe/Paris');
include 'comments.inc.php';

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/main.css">
    <title>edit- section</title>
</head>

<body>
    <header>
         <?php include_once('dbh.inc.php'); ?>
    </header>
    <?php
    $cid = $_GET['cid'];
    $request = $conn->prepare("SELECT * FROM comments WHERE cid = ?");
    $request->execute([$cid]);
    $message = $request->fetch(PDO::FETCH_ASSOC);
    editComments($conn);
    ?>

    <form method='POST' action="editcomment.php?cid=<?= $cid ?>">
        <input type="hidden" name="tid" value="<?= $message['tid'] ?>">
        <textarea class="textarea-of-edit"name='message'><?= $message['message'] ?></textarea> <br>
        <button class="button-for-edit" type='submit' name='commentSubmit'>Edit Your Comment</button>
    </form>
</body>

</html>