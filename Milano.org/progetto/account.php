<html lang="it">
    
  <?php include "includes/head.php" ?>
    
    <body>
        <?php include "includes/header.php";?>
        
        <!-- Cronologia acquisti -->
        <section id="mu-featured-tours">
                <div class="container">
                        <div class="row">
                                <div class="col-md-12">
                                        <div class="mu-featured-tours-area">
                                            
                                                <h2>Cronologia acquisti</h2>
                                                <p class="mu-title-content">Qui di seguito potete trovare la lista di tutti i biglietti acquistati da questo account, ordinati in base alla data di acquisto</p>

                                                <div class="mu-featured-tours-content">
                                                        <div class="row">

                                                            <?php include "includes/stampa_acquisti.php";?>

                                                        </div>
                                                </div>

                                        </div>
                                </div>
                        </div>
                </div>
        </section>
        <!-- Cronologia acquisti -->
    </body>
    
    <?php include "includes/footer.php";?>
</html>
