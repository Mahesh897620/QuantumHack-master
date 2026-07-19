<?php
/* Medical Response System for Smart City */
$db_host = getenv('DB_HOST') ?: '34.229.136.128';
$db_user = getenv('DB_USER') ?: 'root';
$db_pass = getenv('DB_PASS') ?: 'p4ssw0rd';
$db_name = getenv('DB_NAME') ?: 'system';

$mysqli = new mysqli($db_host, $db_user, $db_pass, $db_name);

if ($mysqli -> connect_error) {
  echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
  exit();
} 
