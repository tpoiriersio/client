<?php
    require __DIR__ . '/required/loader.php';

    echo $twig->render('admin.tpl', [
        'titre_page' => 'Espace administrateur',
        'isConnected' => $isConnected,
        'user' => $user
    ]);
    ?>
