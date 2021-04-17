<?php
    require __DIR__ . '/vendor/autoload.php';
    use Twig\Environment;
    use Twig\Loader\FilesystemLoader;

    $loader = new FilesystemLoader(__DIR__ . '/templates');
    $twig = new Environment($loader);

    // On récupère la liste des ressources vérifiées
    //$getResourcesIsVerified = "http://localhost:5000/ressources/isVerified";
    //$resourcesList = json_decode(file_get_contents($getResourcesIsVerified), true);

    echo $twig->render('home.tpl', [
        'titre_page' => 'Home',
        'prenom' => 'John',
        'nom' => 'Doe'
    ]);
    ?>
