<?php

function setComments($conn)
{
    if (isset($_POST['commentSubmit'])) {
        $uid = $_SESSION['id'];
        $tid = $_GET['id'];
        $date = $_POST['date'];
        $message = $_POST['message'];
        $sql = "INSERT INTO comments (uid, date, message, tid) VALUES ('$uid', '$date', '$message', '$tid')";
        $conn->query($sql);
        header('location: discussion.php?id=' . $tid);
    }
}
function getReply($conn, $id)
{
    $request = 'SELECT * FROM reply WHERE cid = ?';
    $prepare = $conn->prepare($request);
    $prepare->execute([$id]);
    return $prepare->fetchAll(PDO::FETCH_ASSOC);

}
function getComments($conn)
{
    $sql = "SELECT * FROM comments WHERE tid = ?";
    $result = $conn->prepare($sql);
    $result->execute([$_GET['id']]);
    return $result->fetchAll(PDO::FETCH_ASSOC);  
}


function editComments($base)
{
    if (isset($_POST['commentSubmit'])) {
        $cid = $_GET['cid'];
        $message = $_POST['message'];
        $sql = "UPDATE comments SET message='$message' WHERE cid=$cid";
        $base->query($sql);
        header('location:discussion.php?id=' . $_POST['tid']);
    }
}


function deleteComments($conn)
{
    if (isset($_GET['commentDelete'])) {
        $cid = $_GET['cid'];
        $sql = "DELETE FROM comments WHERE cid = ?";
        $prepare = $conn->prepare($sql);
        $prepare->execute([$cid]);
        header('location:discussion.php?id=' . $_GET['id']);
    }
}
