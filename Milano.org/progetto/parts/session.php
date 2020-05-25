<?php

session_start();
//print session_id();

if(!isset($_SESSION['sessione']))
{
    $_SESSION['sessione'] = True;
    //print "sessioneee";
}
else
{
    //print "non attiva";
}