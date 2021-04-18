<?php
    require __DIR__ . '/required/loader.php';

    echo $twig->render('messages.tpl', [
        'titre_page' => 'Messages',
        'isConnected' => $isConnected,
        'user' => $user
    ]);
    ?>
