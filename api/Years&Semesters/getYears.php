<?php
require '../db.php';
try {
    $stmt = $pdo->query("SELECT * FROM year_tbl ORDER BY year_id");
    echo json_encode(['success'=>true,'data'=>$stmt->fetchAll()]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success'=>false,'message'=>$e->getMessage()]);
}
