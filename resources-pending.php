<?php
    require __DIR__ . '/vendor/autoload.php';
    use Twig\Environment;
    use Twig\Loader\FilesystemLoader;

    $loader = new FilesystemLoader(__DIR__ . '/templates');
    $twig = new Environment($loader);

    echo $twig->render('resources-pending.tpl', [
        'titre_page' => 'Ressources en attente',
        'prenom' => 'John',
        'nom' => 'Doe',
        'role' => 'Modérateur',
        'pays' => 'France'
    ]);
    ?>
