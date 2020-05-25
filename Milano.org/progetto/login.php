<html>
    <head>
        <?php include "includes/head.php";
        if(isset($_POST['act']))
        {
            if($_POST['act'] == 'Accedi')
            {
                //print "login";
                $mail = $_POST['mail'];
                $password = $_POST['password'];

                $query = "SELECT * FROM users WHERE mail = '$mail'";
                $ris = $db->query($query);
                //print $db->error;

                if($ris->num_rows == 1)
                {
                    $r = $ris->fetch_array();
                    if(password_verify($password, $r['password']))
                    {
                        $_SESSION['nome'] = $r['nome'];
                        $_SESSION['cognome'] = $r['cognome'];
                        $_SESSION['id_user'] = $r['id_user'];
                        $_SESSION['mail'] = $r['mail'];
                        
                        if(isset($_POST['ricordami'])) 
                        {
                            if($_POST['ricordami'] == 't')
                            {
                                setcookie('id_user', $_SESSION['id_user'], time()+86400*30);
                                //$a = $_COOKIE['id_user'];
                                //print $a;
                            }
                            else
                            {
                                setcookie('id_user', $_SESSION['id_user'], 86400*30);
                            }
                        }
                        else
                        {
                            setcookie('id_user', $_SESSION['id_user'], 86400*30);
                        }
                        header("location: index.php");
                    }
                    else
                    {
                        $error = 0;
                    }
                }
                else
                {
                    $error = 1;
                }
            }
            if($_POST['act'] == 'Registrati')
            {
                //print "registrazione";
                $mail = $_POST['mail'];
                $password = $_POST['password'];
                $password_r = $_POST['password_r'];
                
                if($password == $password_r)
                {
                    $c_query = "SELECT * FROM users WHERE mail = '$mail'";
                    $ris = $db->query($c_query);
                    if($ris->num_rows == 0)
                    {
                        $nome = $_POST['nome'];
                        $cognome = $_POST['cognome'];
                        
                        if($mail != "" && $password != "" && $nome != "" && $cognome != "")
                        {
                            $hash = password_hash($password, PASSWORD_BCRYPT);
                            
                            $query = "INSERT INTO users (nome, cognome, mail, password) VALUES ('$nome', '$cognome', '$mail', '$hash')";
                            $db->query($query);
                            
                            $message = 0;
                        }
                        else
                        {
                            $error_r = 2;
                        }
                    }
                    else
                    {
                        $error_r = 1;
                    }
                }
                else
                {
                    $error_r = 0;
                }
            }
        }
        if(isset($_COOKIE['id_user']))
        {
            //print "siii";
            $query = "SELECT * FROM users WHERE id_user = $_COOKIE[id_user]";
            $ris = $db->query($query)->fetch_array();
            $mail = $ris['mail'];
        }
    ?>
    <body id="body_login">
        <div style="width:100%;height:100%;background-color: rgba(0,0,0,0.6)">
        <div class="mu-logo-area"  style="padding:50px; margin-left:50px">
                <a class="mu-logo" href="index.php"><span>Milano.org</span></a>
        </div>
        <div class="login-html">
            <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Accedi</label>
            <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Registrati</label>
                <div class="login-form">
                    <form action="login.php" method="post">
                        <div class="sign-in-htm">
                            <div class="group">
                                <label for="user" class="label">E-mail</label>
                                <input id="user" type="text" class="input" name="mail" <?php if(isset($mail)) print "value = '". $mail ."'";?>>
                            </div>
                            <div class="group">
                                <label for="pass" class="label">Password</label>
                                <input id="pass" type="password" class="input" data-type="password" name="password">
                            </div>
                            <div class="group" style="color: whitesmoke">
                                Ricordami:<input style="width: 40px;" type="checkbox" name="ricordami" value="t"/>
                            </div>
                            <div class="group">
                                <input type="submit" class="button" value="Accedi" name="act">
                            </div>
                            <div class="group" style="color: whitesmoke">
                            <?php
                            if(isset($error))
                            {
                                if($error == 0)
                                    print "Password errata";
                                if($error == 1)
                                    print "Nessun account trovato";
                            }
                            ?>
                            </div>
                            <div class="hr"></div>
                        </div>
                    </form>
                    <form action="login.php" method="post">
                    <div class="sign-up-htm">
                        <div class="group">
                            <label for="user" class="label">Nome</label>
                            <input id="user" type="text" class="input" name="nome">
                        </div>
                        <div class="group">
                            <label for="user" class="label">Cognome</label>
                            <input id="user" type="text" class="input" name="cognome">
                        </div>                               
                        <div class="group">
                                <label for="pass" class="label">Email</label>
                                <input id="pass" type="text" class="input" name="mail">
                        </div>
                        <div class="group">
                            <label for="pass" class="label">Password</label>
                            <input id="pass" type="password" class="input" data-type="password" name="password">
                        </div>
                        <div class="group">
                                <label for="pass" class="label">Ripeti Password</label>
                                <input id="pass" type="password" class="input" data-type="password" name="password_r">
                        </div>
                        <br>
                        <div class="group">
                                <input type="submit" class="button" value="Registrati" name="act">
                        </div>
                        <div class="group" style="color: whitesmoke">
                            <?php
                            if(isset($message))
                            {
                               if($message == 0)
                                   print "Registrazione avvenuta con successo";
                            }
                            if(isset($error_r))
                            {
                               if($error_r == 0)
                                   print "Password non corrispondenti";
                               if($error_r == 1)
                                   print "Mail gia utilizzata";
                               if($error_r == 2)
                                   print "Alcuni campi mancanti";
                            }
                            ?>
                        </div>
                        <div class="hr"></div>
                    </div>
                </form>
            </div>
        </div>
        </div>
</body>
</html>
