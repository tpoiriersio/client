<?php
    require __DIR__ . '/vendor/autoload.php';
    use Twig\Environment;
    use Twig\Loader\FilesystemLoader;

    $loader = new FilesystemLoader(__DIR__ . '/templates');
    $twig = new Environment($loader);

    echo $twig->render('admin-edit-user.tpl', [
        'titre_page' => 'Modifier l\'utilisateur',
        'prenom' => 'John',
        'nom' => 'Doe',
        'role' => 'Administrateur',
        'pays' => 'France',
        'email' => 'johndoe@gmail.com'
    ]);
    ?>
