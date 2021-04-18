
<div class="col-md-2 order-1 left-sidebar bg-dark">
    <div class="d-flex flex-column p-3 text-white sticky-top">
        <a href="home.php" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
            {{ include('elements/logo-svg.tpl') }}
        </a>
        <hr>
        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
                <a href="home.php" class="nav-link active">
                    <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"/></svg>
                    Accueil
                </a>
            </li>
            <li>
                <a href="#" class="nav-link text-white">
                    <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"/></svg>
                    Explorer
                </a>
            </li>
            <li>
                <a href="messages.php" class="nav-link text-white">
                    <svg class="bi me-2" width="16" height="16"><use xlink:href="#chat-quote-fill"/></svg>
                    Messages
                </a>
            </li>
            <li>
                <a href="profile.php" class="nav-link text-white">
                    <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"/></svg>
                    Profil
                </a>
            </li>
        </ul>
        <hr>
        <div class="dropdown">
            <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle me-2">
                <strong>{% if isConnected == true %} {{ user.utilisateur.prenomuser }} {% else %} Visiteur {% endif %} </strong>
            </a>
            <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                {% if isConnected == true %}
                <li><a class="dropdown-item" href="resources-new">Nouvelle ressource</a></li>
                <li><a class="dropdown-item" href="profile.php">Profil</a></li>
                <!-- AJOUTER IF EN FONCTION DU GROUPE AFFICHER ADMINISTRATION OU NON -->
                <li><a class="dropdown-item" href="admin.php">Administration</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="logout.php">Se déconnecter</a></li>
                {% else %}
                <li><a class="dropdown-item" href="index.php">Se connecter ou s'inscrire</a></li>
                {% endif %}
            </ul>
        </div>
    </div>
</div>
