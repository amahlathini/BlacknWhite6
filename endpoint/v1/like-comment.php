<?php
if (IS_LOGGED == false) {
    $data = array('status' => 400, 'error' => 'Not logged in');
    echo json_encode($data);
    exit();
}

if (!empty($_POST['id'])) {
    if (!is_numeric($_POST['id'])) {
        $data = array('status' => 400, 'error' => 'Invalid Comment ID');
        echo json_encode($data);
        exit();
    }
}else{
    $data = array('status' => 400, 'error' => 'Invalid Comment ID');
    echo json_encode($data);
    exit();
}

$comment_id = secure($_POST['id']);
$getComment = getComment($comment_id);
if (empty($getComment)) {
    $data = array('status' => 400, 'error' => 'Invalid Comment ID');
    echo json_encode($data);
    exit();
}

$data['status'] = 400;


$like = LikeComment([
    'url' => 'user/' . $music->user->username,
    'comment_user_id' => $getComment->user_id,
    'track_id' => $getComment->track_id,
    'user_id' => $user->id,
    'comment_id' => $comment_id
]);
if($like) {
    $songID = songData($getComment->track_id);
    RecordUserActivities('like_comment',array('comment_user_id' => $getComment->user_id,'track_user_id' => $songID->user_id, 'audio_id' => $songID->audio_id));
    $data['status'] = 200;
}

?>