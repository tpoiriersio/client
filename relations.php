<?php
require __DIR__ . '/required/loader.php';

// Empêche le visiteur non connecté d'aller sur son propre profil, mais peut toujours voir celui des autres
if ($isConnected == false && $profile == '') {
    echo("Accès non autorisé");
    header('Location: home.php');
}
else {
    echo $twig->render('relations.tpl', [
        'titre_page' => 'Relations',
        'isConnected' => $isConnected,
        'user' => $user,
        'profile' => $profile
    ]);
}

?>
