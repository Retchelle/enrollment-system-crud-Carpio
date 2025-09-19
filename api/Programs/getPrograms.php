<?php
require '../db.php';
try {
    $stmt = $pdo->query("SELECT p.program_id, p.program_name, p.ins_id, i.ins_name
                         FROM program_tbl p
                         LEFT JOIN institute_tbl i ON p.ins_id = i.ins_id
                         ORDER BY p.program_id");
    echo json_encode(['success'=>true,'data'=>$stmt->fetchAll()]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success'=>false,'message'=>$e->getMessage()]);
}
