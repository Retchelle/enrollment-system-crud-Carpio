<?php
require '../db.php';
try {
    $stmt = $pdo->query("SELECT l.load_id, l.stud_id, s.name as student_name, l.subject_id, sub.subject_name
                         FROM student_load l
                         LEFT JOIN student_tbl s ON l.stud_id = s.stud_id
                         LEFT JOIN subject_tbl sub ON l.subject_id = sub.subject_id
                         ORDER BY l.load_id");
    echo json_encode(['success'=>true,'data'=>$stmt->fetchAll()]);
} catch (Exception $e) {
    echo json_encode(['success'=>false,'message'=>$e->getMessage()]);
}
