<?php
require '../db.php';
$post = json_decode(file_get_contents('php://input'), true);
$id = $post['year_id'] ?? null;
if (!is_numeric($id)) {
    http_response_code(400);
    echo json_encode(['success'=>false,'message'=>'Invalid input']);
    exit;
}
try {
    // ensure no semesters in this year
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM semester_tbl WHERE year_id = :id");
    $stmt->execute(['id'=>$id]);
    if ($stmt->fetchColumn() > 0) {
        echo json_encode(['success'=>false,'message'=>'Cannot delete year: semesters exist for this year.']);
        exit;
    }
    $stmt = $pdo->prepare("DELETE FROM year_tbl WHERE year_id = :id");
    $stmt->execute(['id'=>$id]);
    echo json_encode(['success'=>true,'message'=>'Year deleted']);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success'=>false,'message'=>$e->getMessage()]);
}
