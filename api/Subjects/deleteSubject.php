<?php
require '../db.php';
$post = json_decode(file_get_contents('php://input'), true);
$id = $post['subject_id'] ?? null;
if (!is_numeric($id)) {
    http_response_code(400);
    echo json_encode(['success'=>false,'message'=>'Invalid input']);
    exit;
}
try {
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM student_load WHERE subject_id = :id");
    $stmt->execute(['id'=>$id]);
    if ($stmt->fetchColumn() > 0) {
        echo json_encode(['success'=>false,'message'=>'Cannot delete subject: students are enrolled']);
        exit;
    }
    $stmt = $pdo->prepare("DELETE FROM subject_tbl WHERE subject_id = :id");
    $stmt->execute(['id'=>$id]);
    echo json_encode(['success'=>true,'message'=>'Subject deleted']);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success'=>false,'message'=>$e->getMessage()]);
}
