<?php
require '../db.php';
try {
    $stmt = $pdo->query("SELECT s.stud_id, s.name, s.program_id, p.program_name, s.allowance
                         FROM student_tbl s
                         LEFT JOIN program_tbl p ON s.program_id = p.program_id
                         ORDER BY s.stud_id");
    $data = $stmt->fetchAll();
    echo json_encode(['success'=>true,'data'=>$data]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success'=>false,'message'=>$e->getMessage()]);
}
