<?php
require '../db.php';
$post = json_decode(file_get_contents('php://input'), true);
$id = $post['sem_id'] ?? null;
$name = trim($post['sem_name'] ?? '');
$year_id = $post['year_id'] ?? null;
if (!is_numeric($id) || $name === '' || !is_numeric($year_id)) {
    http_response_code(400);
    echo json_encode(['success'=>false,'message'=>'Invalid input']);
    exit;
}
try {
    $stmt = $pdo->prepare("UPDATE semester_tbl SET sem_name=:name, year_id=:year WHERE sem_id=:id");
    $stmt->execute(['name'=>$name,'year'=>$year_id,'id'=>$id]);
    echo json_encode(['success'=>true,'message'=>'Semester updated']);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success'=>false,'message'=>$e->getMessage()]);
}
