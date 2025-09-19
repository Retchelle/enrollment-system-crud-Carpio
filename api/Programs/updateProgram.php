<?php
require '../db.php';
$post = json_decode(file_get_contents('php://input'), true);
$id = $post['program_id'] ?? null;
$name = trim($post['program_name'] ?? '');
$ins_id = $post['ins_id'] ?? null;
if (!is_numeric($id) || $name === '' || !is_numeric($ins_id)) {
    http_response_code(400);
    echo json_encode(['success'=>false,'message'=>'Invalid input']);
    exit;
}
try {
    $stmt = $pdo->prepare("UPDATE program_tbl SET program_name=:name, ins_id=:ins WHERE program_id=:id");
    $stmt->execute(['name'=>$name,'ins'=>$ins_id,'id'=>$id]);
    echo json_encode(['success'=>true,'message'=>'Program updated']);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success'=>false,'message'=>$e->getMessage()]);
}
