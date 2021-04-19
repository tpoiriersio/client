<div class="container">
    <div id="profile-navbar" class="row justify-content-center">
        <div class="col-md-6 mb-2 mt-2">
            <a href="resources-pending.php" class="profile-navlink {% if titre_page == "Ressources en attente" %} active {% endif %} ">Ressources en attente</a>
        </div>
        {% if user.utilisateur.issuperadmin == true or user.utilisateur.isadmin == true %}
        <div class="col-md-6 mb-2 mt-2">
            <a href="admin-users-list.php" class="profile-navlink {% if titre_page == "Utilisateurs" %} active {% endif %}">Liste des utilisateurs</a>
        </div>
        {% endif %}
    </div>
</div>
