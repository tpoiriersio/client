<?php
    require __DIR__ . '/required/loader.php';

    echo $twig->render('profile.tpl', [
        'titre_page' => 'Profil',
        'isConnected' => $isConnected,
        'user' => $user,
        'profile' => $profile
    ]);
    ?>
