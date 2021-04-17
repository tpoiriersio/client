<?php

if (isset($_GET['token'])) {
    $jwtToken = $_GET['token'];
    $token = json_decode($jwtToken, true);
    session_start();
    if (!isset($_SESSION['jwtToken']) && !isset($_SESSION['token'])) {
        $_SESSION['jwtToken'] = $jwtToken;
        $_SESSION['token'] = $token;
    }
    echo "Connexion réussie";
    header('Location: home.php');
}
else {
    header('Location: ./');
    echo "Erreur de connexion";
}

?>