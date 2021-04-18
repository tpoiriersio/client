<?php
    require __DIR__ . '/required/loader.php';

    // On récupère le tableau de données JSON renvoyé par l'url
    $getusersroute = "http://localhost:5000/users";
    $userslist = json_decode(file_get_contents($getusersroute), true);

    var_dump( $_SESSION['jwtToken']);

    echo $twig->render('admin-users-list.tpl', [
        'titre_page' => 'Utilisateurs',
        'isConnected' => $isConnected,
        'user' => $user,
        'userslist' => $userslist,
        'token' => $_SESSION['jwtToken']
    ]);
    ?>
