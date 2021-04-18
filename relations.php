<?php
    require __DIR__ . '/required/loader.php';

    echo $twig->render('relations.tpl', [
        'titre_page' => 'Relations',
        'isConnected' => $isConnected,
        'user' => $user,
        'profile' => $profile
    ]);
    ?>
