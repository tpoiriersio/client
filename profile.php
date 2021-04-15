<?php
    require __DIR__ . '/vendor/autoload.php';
    use Twig\Environment;
    use Twig\Loader\FilesystemLoader;

    $loader = new FilesystemLoader(__DIR__ . '/templates');
    $twig = new Environment($loader);

    $user_id = '';

    if (isset($_GET['id'])) {
        $user_id = $_GET['id'];
        // On récupère le tableau de données JSON renvoyé par l'url
        $getuser = ("http://localhost:5000/users/" . $user_id);
    }

    $user = json_decode(file_get_contents($getuser), true);

    echo $twig->render('profile.tpl', [
        'titre_page' => 'Profil',
        'prenom' => 'John',
        'nom' => 'Doe',
        'role' => 'Citoyen',
        'pays' => 'France',
        'user' => $user
    ]);
    ?>
