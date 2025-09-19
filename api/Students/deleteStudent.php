<?php
require '../db.php';
$post = json_decode(file_get_contents('php://input'), true);
$id = $post['stud_id'] ?? null;
if (!is_numeric($id)) {
    http_response_code(400);
    echo json_encode(['success'=>false,'message'=>'Invalid input']);
    exit;
}
try {
    // ensure no enrollments prevent deletion? We will delete student_load rows first, or reject if present (choose reject)
    $stmt = $pdo->prepare("SELECT COUNT(*) as cnt FROM student_load WHERE stud_id = :id");
    $stmt->execute(['id'=>$id]);
    $count = $stmt->fetchColumn();
    if ($count > 0) {
        echo json_encode(['success'=>false,'message'=>'Cannot delete: student has enrollments']);
        exit;
    }
    $stmt = $pdo->prepare("DELETE FROM student_tbl WHERE stud_id = :id");
    $stmt->execute(['id'=>$id]);
    echo json_encode(['success'=>true,'message'=>'Student deleted']);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success'=>false,'message'=>$e->getMessage()]);
}
