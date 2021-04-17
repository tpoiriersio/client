<?php

session_start();

if (session_status() != PHP_SESSION_NONE) {
    unset($_SESSION['jwtToken']);
    unset($_SESSION['token']);
    session_unset();
    session_destroy();
    header('Location: ./');
}
else {
    header('Location: home.php');
}

