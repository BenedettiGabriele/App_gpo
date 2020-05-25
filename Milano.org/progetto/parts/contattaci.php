<?php

require_once 'dbConnect.php';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
	
	$mail = $_POST["email"];
	$messaggio = $_POST["messaggio"];

	// Check that data was sent to the mailer.
	if ($mail=="" || $messaggio=="")
        {
            //Rispondo in modo negativo
            http_response_code(400);
            echo "Problema nel trasmettere il messaggio, riprovare";
            exit;
	}


	if (True)
	{
            //rispondo in modo positivo
            http_response_code(200);
            echo "Grazie! Il tuo messaggio è stato spedito!";
	}
	else
	{
            //risposta a 500= errore nel server
            http_response_code(500);
            echo "Problema nel trasmettere il messaggio, riprovare";
	}

}
?>
