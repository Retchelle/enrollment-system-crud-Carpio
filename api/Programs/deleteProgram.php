<?php
require '../db.php';
$post = json_decode(file_get_contents('php://input'), true);
$id = $post['program_id'] ?? null;
if (!is_numeric($id)) {
    http_response_code(400);
    echo json_encode(['success'=>false,'message'=>'Invalid input']);
    exit;
}
try {
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM student_tbl WHERE program_id = :id");
    $stmt->execute(['id'=>$id]);
    if ($stmt->fetchColumn() > 0) {
        echo json_encode(['success'=>false,'message'=>'Cannot delete program: students are enrolled in it.']);
        exit;
    }
    $stmt = $pdo->prepare("DELETE FROM program_tbl WHERE program_id = :id");
    $stmt->execute(['id'=>$id]);
    echo json_encode(['success'=>true,'message'=>'Program deleted']);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success'=>false,'message'=>$e->getMessage()]);
}
