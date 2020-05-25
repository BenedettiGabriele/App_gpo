<?php

$query = "SELECT * FROM musei WHERE attivo = 't'";
$ris = $db->query($query);

if($ris->num_rows == 0)
{
    print "Al momento nessun museo ha aderito a questa associazione.";
}
else
{
    $musei = $ris;

    foreach($musei as $museo)
    {
        include "includes/museo.php";
    }
}
