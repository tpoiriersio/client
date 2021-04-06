<?php
    require __DIR__ . '/vendor/autoload.php';
    use Twig\Environment;
    use Twig\Loader\FilesystemLoader;

    $loader = new FilesystemLoader(__DIR__ . '/templates');
    $twig = new Environment($loader);

    echo $twig->render('resources-favorites.tpl', [
        'titre_page' => 'Ressources favorites',
        'prenom' => 'John',
        'nom' => 'Doe',
        'role' => 'Citoyen',
        'pays' => 'France'
    ]);
    ?>
