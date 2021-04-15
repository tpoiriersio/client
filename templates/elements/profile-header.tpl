<div class="container colorwhite">
    <div id="profile-header" class="row justify-content-start">
        <div class="col-md-2">
            <img src="assets/media/upload/images/palpatine_glasses.jpg" class="header-avatar">
        </div>
        <div class="col-md-2 col-name">
            <p class="name"><b>{{ user.utilisateur.prenomuser }} {{ user.utilisateur.nomuser }}</b><br></p>
            <p>
                {% if user.utilisateur.issuperadmin == true %}
                Super Administrateur
                {% elseif user.utilisateur.isadmin == true %}
                Administrateur
                {% elseif user.utilisateur.ismoderateur == true %}
                Modérateur
                {% else %}
                Citoyen
                {% endif %}
                <br></p>
            <p>{{ user.utilisateur.paysuser }}<br></p>
        </div>
    </div>

    <div id="profile-navbar" class="row justify-content-center">
        <div class="col-md-2 mb-2 mt-2">
            <a href="resources-user.php" class="profile-navlink {% if titre_page == "Ressources publiées" %} active {% endif %} ">Publications</a>
        </div>
        <div class="col-md-2 mb-2 mt-2">
            <a href="resources-favorites.php" class="profile-navlink {% if titre_page == "Ressources favorites" %} active {% endif %}">Favoris</a>
        </div>
        <div class="col-md-2 mb-2 mt-2">
            <a href="relations.php" class="profile-navlink {% if titre_page == "Relations" %} active {% endif %}">Relations</a>
        </div>
        <!-- Si on se trouve sur notre propre page de profil, afficher ce bouton. Sur le profil de quelqu'un d'autre, le masquer. -->
        <div class="col-md-2 mb-2 mt-2">
            <a href="edit-profile.php" class="profile-navlink {% if titre_page == "Éditer mon profil" %} active {% endif %}">Éditer mon profil</a>
        </div>
    </div>
</div>
