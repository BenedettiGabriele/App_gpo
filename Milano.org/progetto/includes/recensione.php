<?php

$nome = $recensione['nome'];
$museo = $recensione['museo'];
$testo = $recensione['recensione'];

print"
<li>
    <i class='fa fa-quote-left mu-client-quote' aria-hidden='true'></i>
    <p>$testo</p>
    <h5 class='mu-rt-name'>$nome</h5>
    <span class='mu-rt-title'>$museo</span>
</li>";
