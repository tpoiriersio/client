<?php
    require __DIR__ . '/required/loader.php';

    echo $twig->render('resources-pending.tpl', [
        'titre_page' => 'Ressources en attente',
        'isConnected' => $isConnected,
        'user' => $user
    ]);
    ?>
