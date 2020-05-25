<?php

$id_museo = $museo['id_museo'];
$nome = $museo['nome'];
$descrizione = $museo['descrizione'];
$costo = $museo['costo'];

$apertura = $museo['apertura'];
$chiusura = $museo['chiusura'];
$immagine = $museo['immagine'];

print
"<div class='col-md-4'>
    <div class='mu-featured-tours-single'>
        <img src='assets/images/$immagine' alt='img'>
        <div class='mu-featured-tours-single-info'>
            <h3>$nome</h3>
            <h4>Apertura: $apertura-$chiusura</h4>
            <span class='mu-price-tag'>prezzo: $costo €</span>
            <a href='info_museo.php?id=$id_museo' class='mu-book-now-btn'>Compra</a>
        </div>
    </div>
</div>";