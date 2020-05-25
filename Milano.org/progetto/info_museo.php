<html>
    <?php 
    
    include "includes/head.php"; 
    
    if(isset($_GET['id']))
        $id_museo = $_GET['id'];
    else
        $id_museo = $_POST['id'];
    $query = "SELECT * FROM musei WHERE id_museo = $id_museo";
    $museo = $db->query($query);
    $museo = $museo->fetch_array();
    
    $nome = $museo['nome'];
    $descrizione = $museo['descrizione'];
    $costo = $museo['costo'];
    $apertura = $museo['apertura'];
    $chiusura = $museo['chiusura'];
    $immagine = $museo['immagine'];
    
    if(isset($_POST['act']))
    {
        if(isset($_SESSION['id_user']))
        {
            $codice_carta = $_POST['codice_carta'];
            $cvv = $_POST['cvv'];
            $data = $_POST['data_scadenza'];
            
            if(strlen($codice_carta) == 16 || strlen($codice_carta) == 13)
            {
                if(strlen($cvv) == 3)
                {
                    if(strlen($data) == 7)
                    {
                        $id_user = $_SESSION['id_user'];
                        //genero codice casuale
                        $caratteri = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
                        $codice = '';
                        for ($i = 0; $i < 5; $i++) {
                            $codice .= $caratteri[rand(0, strlen($caratteri) - 1)];
                        }
                        $data = date("Y-m-d");
                        $query_i = "INSERT INTO tickets (id_user, id_museo, codice, data_acquisto, convalidato) VALUES ($id_user, $id_museo, '$codice', '$data', 'f')";
                        $db->query($query_i);
                        $messaggio = 0;
                    }
                    else
                        $messaggio = 3;
                }
                else
                    $messaggio = 2;
            }
            else
                $messaggio = 1;
        }
        else
            header("location: http://127.0.0.1/PhpProject1/progetto/login.php");
    }
    ?>
    <body>
        <?php include "includes/header.php";
        
        print
        "<section id='mu-featured-tours'>
            <div class='container'>
                <div class='row'>
                    <div class='col-md-12'>
                        <div class='mu-featured-tours-area'>
                            <h2>$nome</h2>
                            <p class='mu-title-content'>$descrizione</p>

                            <div class='mu-featured-tours-content'>
                                <div class='row'>                 
                                    <div class='col-md-4'>
                                        <div class='mu-featured-tours-single'>
                                            <img src='assets/images/$immagine' alt='img'>
                                            <div class='mu-featured-tours-single-info'>
                                                <h3>Apertura: $apertura-$chiusura</h4>
                                                <span>prezzo: $costo €</span>             
                                            </div>
                                        </div>
                                    </div>                                                                   
                                    <form action='info_museo.php' method='post' class='mu-contact-form' style='margin-left:10%; float:left; width:50%'>
                                    <br>
                                        <input hidden name='id' value='$id_museo'></input>
                                        <h2> Pagamento </h2><br>
                                        <div class='form-group'>                
                                            <input type='text' class='form-control' placeholder='Codice_carta' name='codice_carta' required>
                                        </div>
                                        <div>
                                            <div class='form-group' style='width:48%;float:left'>                
                                                    <input type='password' class='form-control' placeholder='Cvv' name='cvv' required>
                                            </div>             

                                            <div class='form-group' style='width:48%;float:left;margin-left:4%'>                
                                                <input type='text' class='form-control' placeholder='Data Scadenza' id='subject' name='data_scadenza' required>
                                            </div>
                                        </div>
                                        <button name='act' value='acquista' type='submit' class='mu-send-msg-btn'><span>Acquista</span></button>
                                        <div class='form-group' style='width:48%;float:left;margin-left:4%'>";
                                        if(isset($messaggio))
                                        {
                                            if($messaggio == 0)
                                                print "Biglietto acquistato, codice: $codice";
                                            if($messaggio == 1)
                                                print "Il codice della carta deve essere di 13 o 16 cifre";
                                            if($messaggio == 2)
                                                print "Il cvv deve essere di 3 cifre";
                                            if($messaggio == 3)
                                                print "Data di scadenza inserita in modo errato";
                                        }
print "                                 </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>";
        
        include 'includes/footer.php';
        
        ?>
    </body>
</html>

