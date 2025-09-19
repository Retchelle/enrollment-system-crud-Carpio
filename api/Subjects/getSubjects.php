<?php
require '../db.php';
try {
    $stmt = $pdo->query("SELECT sub.subject_id, sub.subject_name, sub.sem_id, s.sem_name, s.year_id
                         FROM subject_tbl sub
                         LEFT JOIN semester_tbl s ON sub.sem_id = s.sem_id
                         ORDER BY sub.subject_id");
    echo json_encode(['success'=>true,'data'=>$stmt->fetchAll()]);
} catch (Exception $e) {
    echo json_encode(['success'=>false,'message'=>$e->getMessage()]);
}
