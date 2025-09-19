<?php
require '../db.php';
$post = json_decode(file_get_contents('php://input'), true);
$id = $post['stud_id'] ?? null;
$name = trim($post['name'] ?? '');
$program_id = $post['program_id'] ?? null;
$allowance = $post['allowance'] ?? null;

if (!is_numeric($id) || $name === '' || !is_numeric($program_id)) {
    http_response_code(400);
    echo json_encode(['success'=>false,'message'=>'Invalid input']);
    exit;
}
try {
    $sql = "UPDATE student_tbl SET name=:name, program_id=:program_id, allowance=:allowance WHERE stud_id=:id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['name'=>$name,'program_id'=>$program_id,'allowance'=>$allowance,'id'=>$id]);
    echo json_encode(['success'=>true,'message'=>'Student updated']);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success'=>false,'message'=>$e->getMessage()]);
}
