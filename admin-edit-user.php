<?php
    require __DIR__ . '/required/loader.php';

    $getusersroute = "http://localhost:5000/users";
    $userslist = json_decode(file_get_contents($getusersroute), true);

    var_dump( $_SESSION['jwtToken']);

    echo $twig->render('admin-edit-user.tpl', [
        'titre_page' => 'Modifier l\'utilisateur',
        'isConnected' => $isConnected,
        'user' => $user,
        'token' => $_SESSION['jwtToken']
    ]);
    ?>
