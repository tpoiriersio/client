<?php
    require __DIR__ . '/required/loader.php';

    echo $twig->render('resources-user.tpl', [
        'titre_page' => 'Ressources publiées',
        'isConnected' => $isConnected,
        'user' => $user,
        'profile' => $profile
    ]);
    ?>
