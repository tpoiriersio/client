<?php
    require __DIR__ . '/required/loader.php';

    echo $twig->render('resources-favorites.tpl', [
        'titre_page' => 'Ressources favorites',
        'isConnected' => $isConnected,
        'user' => $user,
        'profile' => $profile
    ]);
    ?>
