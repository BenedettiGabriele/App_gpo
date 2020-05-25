<?php
//svuoto la sessione ed eseguo il logout
session_start();
$_SESSION = [];
session_unset();
session_destroy();

header("location: /PhpProject1/progetto/index.php");