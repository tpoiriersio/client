<?php
require __DIR__ . '/required/loader.php';

if ($user['utilisateur']['issuperadmin'] == false && $user['utilisateur']['isadmin'] == false && $user['utilisateur']['ismoderateur'] == false)
{
    echo("Accès non autorisé");
    header('Location: home.php');
}
else {
    echo $twig->render('resources-cat-new.tpl', [
        'titre_page' => 'Nouvelle catégorie',
        'isConnected' => $isConnected,
        'user' => $user
    ]);
}

?>
