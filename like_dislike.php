<?php
include 'dbh.inc.php';
$type = $_GET['type'];
if(in_array($type, ['unlike', 'undislike']))
{
    $type = str_replace('un', '', $type);
    $prepare = $conn->prepare('DELETE FROM reaction WHERE content_type = ? AND message_id = ? AND user_id = ?');
    $prepare->execute([$type, $_GET['cid'], $_SESSION['id']]);
}
else
{
    $prepare = $conn->prepare('INSERT INTO reaction(content_type, message_id, user_id) value(?, ?, ?)');
        $prepare->execute([$type, $_GET['cid'], $_SESSION['id']]);
}

header('location: discussion.php?id=' . $_GET['id'])

?>

