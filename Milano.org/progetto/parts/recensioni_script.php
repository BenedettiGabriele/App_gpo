<?php

require_once 'dbConnect.php';

if(isset($_POST['nome']) && isset($_POST['mail']) && isset($_POST['museo']) && isset($_POST['recensione']))
{
    $nome = $_POST['nome'];
    $mail = $_POST['mail'];
    $museo = $_POST['museo'];
    $recensione = $_POST['recensione'];
    
    $query = "INSERT INTO recensioni (mail, nome, museo, recensione) VALUES ('$mail', '$nome', '$museo', '$recensione')";
    $db->query($query);

    //NON FUNZIONANTE A CAUSA DELLA MANCANZA DI UN SERVER PER SPEDIRE MAIL
    //Destinatario
    $to = $mail;
    //Oggetto
    $subject = 'Recensione';
    // Message
    $message = "
    <html>
    <head>
      <title>Recensione</title>
    </head>
    <body>
      <h1>Ciao $nome</h1>
      <p>Grazie per aver lasciato una recensione sul nostro sito <a href='http://127.0.0.1/PhpProject1/progetto/index.php'>Milano.org</a></p>
    </body>
    </html>
    ";
    //Header per mail html
    $headers[] = 'MIME-Version: 1.0';
    $headers[] = 'Content-type: text/html; charset=iso-8859-1';
    //Altri header
    $headers[] = "To: $nome <$mail>";
    $headers[] = 'From: Milano.org';
    //Spedisco mail
    mail($to, $subject, $message, implode("\r\n", $headers));
}

header("Location: /PhpProject1/progetto/index.php");