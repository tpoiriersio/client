<?php
    require __DIR__ . '/vendor/autoload.php';
    use Twig\Environment;
    use Twig\Loader\FilesystemLoader;

    $loader = new FilesystemLoader(__DIR__ . '/templates');
    $twig = new Environment($loader);

    echo $twig->render('edit-profile.tpl', [
        'titre_page' => 'Éditer mon profil',
        'prenom' => 'John',
        'nom' => 'Doe',
        'role' => 'Citoyen',
        'pays' => 'France',
        'email' => 'johndoe@gmail.com'
    ]);
    ?>
