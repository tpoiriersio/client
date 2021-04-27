<?php
require __DIR__ . '/required/loader.php';

$resId = $_GET['id'];
$getres = "http://localhost:5000/res/" . $resId;
$ressource = json_decode(file_get_contents($getres), true);

if (isset ($_SESSION['jwtToken'])) {
    // Utilisateurs
    $getusersroute = "http://localhost:5000/users";
    $userslist = json_decode(file_get_contents($getusersroute), true);
    // Types de relations
    $getreltyperoute = "http://localhost:5000/reltyp";
    $reltypelist = json_decode(file_get_contents($getreltyperoute), true);
    // Personnes en relation avec soi
    $getrelroute = "http://localhost:5000/rel/" . $user['utilisateur']['iduser'];
    $rellist = json_decode(file_get_contents($getrelroute), true);

    echo $twig->render('resource-details.tpl', [
        'titre_page' => 'Détails de la ressource',
        'isConnected' => $isConnected,
        'user' => $user,
        'ressource' => $ressource,
        'userslist' => $userslist,
        'reltypelist' => $reltypelist,
        'rellist' => $rellist,
        'token' => $_SESSION['jwtToken'],
    ]);
}
else {
    echo $twig->render('resource-details.tpl', [
        'titre_page' => 'Détails de la ressource',
        'isConnected' => $isConnected,
        'user' => $user,
        'ressource' => $ressource
    ]);
}

?>
