<?php
include_once ('dbh.inc.php');

$sql1 = "SELECT * FROM `comments`";

$result = $conn->query($sql1);
$result = $result->fetchAll();

   for($i=0; $i<count($result); $i++) {
       $c_id = $result[$i][0];
       $c_comment = $result[$i][4];
       $c_date = $result[$i][3];


//       echo '
//       <div class="comments" style="position:relative; margin:auto; width:25%;">
//          <div>ID# ' . $c_id . '</div>
//          <div style="font-weight:bold;">' . $c_date . '</div>
//          <div>' . $c_comment . '<br><br></div>
//       </div>
//       ';
 }
//       $sql2 = "SELECT * FROM comments WHERE r_to = $c_id";
//       $result2 = $dbconnect->query($sql2);
//
//          while($row2 = $result2->fetch_assoc()) {
//              $r_id = $row2['id'];
//              $r_name = $row2['name'];
//              $r_comment = $row2['comment'];
//              $r_to = $row2['r_to'];
//              echo '
//              <div class="comments" style="position:relative; margin:auto; width:25%; padding-left:80px;">
//                 <div>ID# '.$r_id.'</div>
//                 <div style="font-weight:bold;">'.$r_name.' replied to '.$c_name.'</div>
//                 <div>'.$r_comment.'<br><br></div>
//              </div>
//              ';
       
          //} end of 1st while loop that captures comments.


   //} end of 1st while loop that captures comments.

    




// REPLY COMMENT---------------------------- 

        // require("dbh.inc.php");
        // $stmt=$conn->prepare("SELECT post_id, user, topic, post, time FROM post_tb ORDER BY time DESC");
        //     $stmt->execute();
        //     $result = $stmt->get_result();
        //     $num_of_rows = $result->num_rows;
        //     if ($num_of_rows > 0){
        //         while ($row = $result->fetch_assoc()){
        //             $post_id = $row['post_id'];
        //             $user = $row['user'];
        //             $topic = $row['topic'];
        //             $post = $row['post'];
        //             $time = $row['time'];
        //             $time = date('M dS, Y g:i A', strtotime($time));
        //             echo '<div>
        //                     <div>
        //                         <h5><strong>'.$user.'</strong></h5><h6>'.$time.'</h6>
        //                         <h5><strong>'.ucfirst($topic).'</strong></h5>
        //                         <p data-id="'.$post_id.'">'.$post.'</p>
        //                     </div>      
        //                     <div>
        //                         <button type="button" class="btn btn-primary rep" id="but_rep" data-id="'.$post_id.'">Reply</button>
        //                     </div>
        //                     <form id="comment_reply" data-id="'.$post_id.'" method="post" action="">
        //                         <input type="text" class="hidden" value="'.$post_id.'" id="post_id">
        //                         <input type="text" class="hidden" value="'.$user.'" id="user">
        //                         <textarea class="form-control" rows="3" name="post_rep" id="post_rep"></textarea>
        //                         <button type="submit" class="btn btn-primary" id="post_rep_sub">Submit</button>
        //                     </form>
        //                 <div/>';
        //             }
        //         }
