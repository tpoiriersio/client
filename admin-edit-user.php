<?php
    require __DIR__ . '/required/loader.php';

    echo $twig->render('admin-edit-user.tpl', [
        'titre_page' => 'Modifier l\'utilisateur',
        'isConnected' => $isConnected,
        'user' => $user
    ]);
    ?>
