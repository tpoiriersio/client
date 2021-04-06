<?php
    require __DIR__ . '/vendor/autoload.php';
    use Twig\Environment;
    use Twig\Loader\FilesystemLoader;

    $loader = new FilesystemLoader(__DIR__ . '/templates');
    $twig = new Environment($loader);

    echo $twig->render('relations.tpl', [
        'titre_page' => 'Relations',
        'prenom' => 'John',
        'nom' => 'Doe',
        'role' => 'Citoyen',
        'pays' => 'France'
    ]);
    ?>
