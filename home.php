<?php
require __DIR__ . '/required/loader.php';

// On récupère la liste des ressources vérifiées
$getResourcesIsVerified = "http://localhost:5000/res/Verified";
$resourcesList = json_decode(file_get_contents($getResourcesIsVerified), true);

if (isset ($_SESSION['jwtToken'])) {
    echo $twig->render('home.tpl', [
        'titre_page' => 'Home',
        'isConnected' => $isConnected,
        'user' => $user,
        'reslist' => $resourcesList,
        'token' => $_SESSION['jwtToken']
    ]);
}
else {
    echo $twig->render('home.tpl', [
        'titre_page' => 'Home',
        'isConnected' => $isConnected,
        'user' => $user,
        'reslist' => $resourcesList,
    ]);
}
?>
