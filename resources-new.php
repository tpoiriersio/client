<?php
    require __DIR__ . '/required/loader.php';

    echo $twig->render('resources-new.tpl', [
        'titre_page' => 'Nouvelle ressource',
        'isConnected' => $isConnected,
        'user' => $user
    ]);
    ?>
