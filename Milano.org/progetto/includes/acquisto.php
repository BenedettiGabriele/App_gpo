<?php

$data = $acquisto['data_acquisto'];
$convalidato = $acquisto['data_acquisto'];
$id_museo = $acquisto['id_museo'];

$query_m = "SELECT nome, costo FROM musei WHERE id_museo = $id_museo";
$ris = $db->query($query_m);
$info_museo = $ris->fetch_array();
$museo = $info_museo['nome'];
$costo = $info_museo['costo'];

print
"<div class='col-md-4'>
    <div class='mu-featured-tours-single'>
        <div class='mu-featured-tours-single-info'>
            <h3>Museo: $museo</h3>
            <h4>Data: $data</h4>
            <span class='mu-price-tag'>prezzo: $costo €</span>
            <a href='info_museo.php?id=$id_museo' class='mu-book-now-btn'>Compra di nuovo</a>
        </div>
    </div>
</div>";