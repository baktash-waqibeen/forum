<?php
session_start();
$cid = $_GET['cid'];

$request = "SELECT * FROM comments WHERE cid =?";
$pdo = new PDO('mysql:host=localhost;port=3306;dbname=forum',"root","");
$comment =  $pdo->prepare($request);
$comment->execute([$cid]);
$comment = $comment->fetch(PDO::FETCH_ASSOC);

if(!empty($_POST['replymsg']))
{
    $requestinsert = "INSERT INTO reply(content, uid, cid, time) VALUE (?, ?, ?, NOW())";
    $excute= $pdo->prepare($requestinsert);
    $excute->execute([$_POST['replymsg'], (int)$_SESSION['id'], (int)$cid]);
    header('location: discussion.php?id=' . $comment['tid']);
}
else
{
    header('location: discussion.php?id=' . $comment['tid'] . '&error=no message');
}

