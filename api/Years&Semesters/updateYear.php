<?php
require '../db.php';
$post = json_decode(file_get_contents('php://input'), true);
$id = $post['year_id'] ?? null;
$from = intval($post['year_from'] ?? 0);
$to = intval($post['year_to'] ?? 0);
if (!is_numeric($id) || $from <= 0 || $to <= $from) {
    http_response_code(400);
    echo json_encode(['success'=>false,'message'=>'Invalid input']);
    exit;
}
try {
    $stmt = $pdo->prepare("UPDATE year_tbl SET year_from=:from, year_to=:to WHERE year_id=:id");
    $stmt->execute(['from'=>$from,'to'=>$to,'id'=>$id]);
    echo json_encode(['success'=>true,'message'=>'Year updated']);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success'=>false,'message'=>$e->getMessage()]);
}
