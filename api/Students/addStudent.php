<?php
require '../db.php';

// Decode JSON input
$post = json_decode(file_get_contents('php://input'), true);

// Fix variable names
$stud_id = intval($post['stud_id'] ?? 0); // you were using $data instead of $post
$name = trim($post['name'] ?? '');
$program_id = $post['program_id'] ?? null;
$allowance = $post['allowance'] ?? 0;

// Validate input
if ($name === '' || !is_numeric($program_id)) {
    http_response_code(400);
    echo json_encode(['success'=>false,'message'=>'Invalid input']);
    exit;
}

try {
    $sql = "INSERT INTO student_tbl (stud_id, name, program_id, allowance) VALUES (:stud_id, :name, :program_id, :allowance)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        'stud_id' => $stud_id,
        'name' => $name,
        'program_id' => $program_id,
        'allowance' => $allowance
    ]);

    echo json_encode(['success'=>true, 'message'=>'Student added', 'data'=>['id'=>$pdo->lastInsertId()]]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success'=>false,'message'=>$e->getMessage()]);
}
