<?php
    require __DIR__ . '/required/loader.php';

    // On récupère la liste des ressources vérifiées
    //$getResourcesIsVerified = "http://localhost:5000/ressources/isVerified";
    //$resourcesList = json_decode(file_get_contents($getResourcesIsVerified), true);

    echo $twig->render('home.tpl', [
        'titre_page' => 'Home',
        'isConnected' => $isConnected,
        'user' => $user
    ]);
    ?>
