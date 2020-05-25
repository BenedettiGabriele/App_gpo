<?php

$nome = "musei";
$host = "127.0.0.1";
$user = "root";
$pass = "";

if(isset($db))
{
    unset($db);
}

$db = new MySQLi($host, $user, $pass, $nome);

if($db->connect_errno)
{
    print "Errore" . $db->connect_error;
    exit();
}

$db->query("SET NAMES 'utf-8'");