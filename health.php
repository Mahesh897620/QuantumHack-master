<?php
// Simple health check endpoint for Railway deployment
http_response_code(200);
header('Content-Type: application/json');
echo json_encode(['status' => 'ok', 'service' => 'Medical Response System']);
