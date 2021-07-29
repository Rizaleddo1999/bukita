<?php
if (!session_id()) session_start();

//memeriksa apakah sudah pernah menjalan init.php, jika belum panggil
require_once '../app/init.php';

//membuat objek dengan nama $app dari class App
$app = new App;
