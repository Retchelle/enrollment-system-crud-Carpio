<?php
require '../db.php';
$post = json_decode(file_get_contents('php://input'), true);
$load_id = $post['load_id'] ?? null;
if (!is_numeric($load_id)) {
    http_response_code(400);
    echo json_encode(['success'=>false,'message'=>'Invalid input']);
    exit;
}
try {
    $stmt = $pdo->prepare("DELETE FROM student_load WHERE load_id = :id");
    $stmt->execute(['id'=>$load_id]);
    echo json_encode(['success'=>true,'message'=>'Enrollment removed']);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success'=>false,'message'=>$e->getMessage()]);
}
