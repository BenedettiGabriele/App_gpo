<?php

if(isset($_SESSION['sessione']))
{
    if(isset($_SESSION['mail']))
    {
        $mail = $_SESSION['mail'];
        $logout = True;
    }
}
?>

<header id="mu-hero">
        <div class="container">
                <div class="mu-hero-area">
                        <div class="mu-hero-top">
                                <div class="mu-logo-area">
                                        <a class="mu-logo" href="index.php"><span>Milano.org</span></a>
                                </div>
                                <div class="mu-hero-top-info">
                                        <ul>
                                                <li>
                                                        <i class="fa fa-envelope" aria-hidden="true"></i>
                                                        <span><?php if(isset($mail)) print "<a href='account.php'>$mail -Account</a>"; else print "Accesso non effettuato";?></span>
                                                </li>
                                                <li>
                                                        <div class="mu-telephone">
                                                            <?php
                                                            if(isset($logout))
                                                                print "<a href='parts/logout.php'>Logout</a>";
                                                            else
                                                                print "<a href='login.php'>Login</a>";
                                                            ?>
                                                        </div>
                                                </li>
                                        </ul>

                                </div>
                        </div>
                        <div class="mu-hero-featured-area">
                                <div class="mu-hero-featured-content">
                                        <h2>Benvenuti in Milano.org</h2>
                                        <h1>IL MIGLIOR SITO PER ACQUISTO DI BIGLIETTI</h1>
                                        <p>Questo sito permette di consultare informazioni relative ai principali musei di Milano. Inoltre è disponibili acquistare dei biglietti relativi a questi musei.</p>
                                </div>
                        </div>
                </div>
        </div>
</header>

