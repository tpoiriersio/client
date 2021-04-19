<?php
    require __DIR__ . '/required/loader.php';

// Empêche le visiteur non connecté d'aller sur son propre profil, mais peut toujours voir celui des autres
if ($isConnected == false) {
    echo("Accès non autorisé");
    header('Location: home.php');
}
    echo $twig->render('resources-user.tpl', [
        'titre_page' => 'Ressources publiées',
        'isConnected' => $isConnected,
        'user' => $user,
        'profile' => $profile
    ]);
    ?>
