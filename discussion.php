<?php
date_default_timezone_set('Europe/Paris');
include 'comments.inc.php';
include_once('dbh.inc.php');
include_once ('config/config.php');

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
    <link rel="stylesheet" href="css/main.css">
    <title>Comment- section</title>
</head>

<body id="mainone">
    <header>
        <p >Be the first to give your idea!  Here this subjects you cant discuss about it</p>
        <p>Do you like programming? If yes, why?</p>
    </header>
    <?php

    setComments($conn);
    deleteComments($conn);
    ?>
    <?php if(isset($_GET['error'])) : ?>
        <div class="error">
            <?= $_GET['error'] ?>
        </div>
    <?php endif; ?>
    <?php foreach (getComments($conn) as $comment) : 
        $reaction = $conn->prepare('SELECT * FROM reaction WHERE message_id = ? AND content_type = ?');
        $reaction->execute([$comment['cid'], 'like']);
        $like = $reaction->fetch(PDO::FETCH_ASSOC);
        $reaction->execute([$comment['cid'], 'dislike']);
        $dislike = $reaction->fetch(PDO::FETCH_ASSOC);
        $countReaction = $conn->prepare('SELECT COUNT(*) as count FROM reaction WHERE message_id = ? AND content_type = ? ');
        $countReaction->execute([$comment['cid'], 'like']);
        $likeCount = $countReaction->fetch(PDO::FETCH_ASSOC);
        $countReaction->execute([$comment['cid'], 'dislike']);
        $dislikeCount = $countReaction->fetch(PDO::FETCH_ASSOC);
        
        ?>
        <div class='comment-box'>
            <p class="p-for-comment">
            <?= nl2br($comment['message']) ?>
            </p>
            <div class="button-comment">
                <a href="editComment.php?cid=<?= $comment['cid'] ?>" class="button"> Edit</a>
                <a href="discussion.php?cid=<?= $comment['cid'] ?>&commentDelete=1&id=<?= $_GET['id'] ?>" class="button"> Delete</a>
                <?php if(empty($like)) : ?>
                    <a href="like_dislike.php?id=<?= $_GET['id'] ?>&cid=<?= $comment['cid'] ?>&type=like" class="button"> 👍 (<?= $likeCount['count'] ?>) </a>
                <?php else : ?>
                    <a href="like_dislike.php?id=<?= $_GET['id'] ?>&cid=<?= $comment['cid'] ?>&type=unlike" class="button"> 👍  (<?= $likeCount['count'] ?>) </a>
                <?php endif; ?>
                <?php if(empty($dislike)) : ?>
                    <a href="like_dislike.php?id=<?= $_GET['id'] ?>&cid=<?= $comment['cid'] ?>&type=dislike" class="button">👎 (<?= $dislikeCount['count'] ?>)</a>
                <?php else : ?>
                    <a href="like_dislike.php?id=<?= $_GET['id'] ?>&cid=<?= $comment['cid'] ?>&type=undislike" class="button">👎 (<?= $dislikeCount['count'] ?>)</a>
                <?php endif; ?>
            </div>
            <div>
                <?php foreach (getReply($conn, $comment['cid']) as $value) :
                    ?>
                    <div><?= $value['content'] ?></div>
                <?php endforeach; ?>
                    <p class=".p-for-reply">
                <form action="reply.php?cid=<?= $comment['cid'] ?>" method="post">
                    <textarea class="okay" name="replymsg"></textarea>
                    <button class="reply-for-msg" type="submit">Reply</button>
                </form>

            </div>
        </div>
    <?php endforeach; ?>
    <form method='POST' action="discussion.php?id=<?= $_GET['id'] ?>">
        <input type='hidden' name='uid' value='Anonymous'>
        <input type='hidden' name='date' value="<?= date('Y-m-d H:i:s') ?>">
        <textarea class="please" name='message'></textarea> <br>
        <button type='submit' value="1" class="for-comment" name='commentSubmit'>Comment</button>
    </form>
    <<?php 
        // include ('like_dislike.php')
     ?>
</body>

</html>




    