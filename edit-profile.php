<?php
    require __DIR__ . '/required/loader.php';

    echo $twig->render('edit-profile.tpl', [
        'titre_page' => 'Éditer mon profil',
        'isConnected' => $isConnected,
        'user' => $user,
        'profile' => $profile
    ]);
    ?>
