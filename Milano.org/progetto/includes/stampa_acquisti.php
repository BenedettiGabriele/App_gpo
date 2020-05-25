<?php

$id_user = $_SESSION['id_user'];
$query = "SELECT * FROM tickets WHERE id_user = $id_user";
$ris = $db->query($query);

if($ris->num_rows == 0)
{
    print "Al momento nessun acquisto è stato eseguito da questo account.";
}
else
{
    $acquisti = $ris;

    foreach($acquisti as $acquisto)
    {
        include "includes/acquisto.php";
    }
}

