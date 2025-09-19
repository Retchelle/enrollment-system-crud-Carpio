<?php
require '../db.php';
$post = json_decode(file_get_contents('php://input'), true);
$id = $post['subject_id'] ?? null;
$name = trim($post['subject_name'] ?? '');
$sem_id = $post['sem_id'] ?? null;
if (!is_numeric($id) || $name === '' || !is_numeric($sem_id)) {
    http_response_code(400);
    echo json_encode(['success'=>false,'message'=>'Invalid input']);
    exit;
}
try {
    $stmt = $pdo->prepare("UPDATE subject_tbl SET subject_name=:name, sem_id=:sem WHERE subject_id=:id");
    $stmt->execute(['name'=>$name,'sem'=>$sem_id,'id'=>$id]);
    echo json_encode(['success'=>true,'message'=>'Subject updated']);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success'=>false,'message'=>$e->getMessage()]);
}
