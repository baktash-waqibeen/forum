<?php
include_once ('dbh.inc.php');
include_once ('comment.php');

if(!isset($_SESSION['login']))
{
    header('Location: index.php');
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@1,900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css/main.css">
    <title>Forum - Topics</title>
</head>

<body id="topics-background">
    <header>
        <?php
        include_once('header.php');
        $query = $conn->query('SELECT * FROM topics');
        $topics = $query->fetchAll(PDO::FETCH_ASSOC);

        ?>
    </header>

    <div class="subject-of-topic-page">
        <h1>Here is two topic you can talk about it</h1>
    </div>
    <div class="questions-part">
        <?php foreach($topics as $topic) : ?>
        <div class="test">
            <div>
                <a href="discussion.php?id=<?= $topic['id']  ?>" >
                    <?= $topic['nom']  ?>
                </a>
            </div>
        </div><br>
        <?php endforeach ?>
    </div>

</body>

</html>

