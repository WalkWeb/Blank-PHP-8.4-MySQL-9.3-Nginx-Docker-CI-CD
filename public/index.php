<?php

require_once __DIR__ . '/../vendor/autoload.php';

use App\ExampleClass;

if ($_SERVER['REQUEST_URI'] === '/demo') {
    header('Content-Type: application/json; charset=utf-8');
    echo '{"message":"This is demo route", "path": "/demo"}';
} else {
    echo '<h1>' . ExampleClass::info() . '</h1>';
}
