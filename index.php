<?php
    require __DIR__ . '/vendor/autoload.php';
    use Twig\Environment;
    use Twig\Loader\FilesystemLoader;

    $loader = new FilesystemLoader(__DIR__ . '/templates');
    $twig = new Environment($loader);

    // On appel la connexion pour voir si les informations envoyées sont identiques au retour
    //$getconnexion = "http://localhost:5000/users/connexion";
    
    echo $twig->render('index.tpl', [
        'titre_page' => 'Home',
        'prenom' => 'John',
        'nom' => 'Doe'
    ]);
    ?>
