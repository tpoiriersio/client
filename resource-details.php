<?php
require __DIR__ . '/required/loader.php';

$resId = $_GET['id'];
$getres = "http://localhost:5000/res/" . $resId;
$ressource = json_decode(file_get_contents($getres), true);

if (isset ($_SESSION['jwtToken'])) {
    echo $twig->render('resource-details.tpl', [
        'titre_page' => 'Détails de la ressource',
        'isConnected' => $isConnected,
        'user' => $user,
        'token' => $_SESSION['jwtToken'],
        'ressource' => $ressource
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
