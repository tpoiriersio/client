<?php
    require __DIR__ . '/vendor/autoload.php';
    use Twig\Environment;
    use Twig\Loader\FilesystemLoader;

    $loader = new FilesystemLoader(__DIR__ . '/templates');
    $twig = new Environment($loader);

    // On récupère le tableau de données JSON renvoyé par l'url
    $getusersroute = "http://localhost:5000/users";
    $userslist = json_decode(file_get_contents($getusersroute), true);

    echo $twig->render('admin-users-list.tpl', [
        'titre_page' => 'Utilisateurs',
        'prenom' => 'John',
        'nom' => 'Doe',
        'role' => 'Citoyen',
        'pays' => 'France',
        'userslist' => $userslist
    ]);
    ?>
