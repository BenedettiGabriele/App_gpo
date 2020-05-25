<?php

$query = "SELECT * FROM recensioni ORDER BY id_recensione DESC";
$ris = $db->query($query);

if($ris->num_rows == 0)
{
    print "Scrivi tu la prima recensione!";
}
else
{
    $recensioni = $ris;
    
    $num_rec = 5;   //numero di recensioni da stampare

    foreach($recensioni as $recensione)
    {
        include "includes/recensione.php";
        
        $num_rec--;
        if($num_rec == 0)
            break;
    }
}
