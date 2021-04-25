
<div class="col-md-2 order-1 left-sidebar bg-dark ">
    <div class="d-flex flex-column p-3 text-white sticky-top">
        <a href="home.php" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
            {{ include('elements/logo-svg.tpl') }}
        </a>
        <hr>
        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand d-lg-none toggler">Menu</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                <ul class="nav nav-pills navbar-nav nav-fill flex-column mb-auto">
                    <li class="nav-item">
                        <a href="home.php" class="nav-link text-white {% if titre_page == 'Home'%} active {% endif %}">
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
                        <a href="users-list.php" class="nav-link text-white {% if titre_page == 'Utilisateurs inscrits'%} active {% endif %}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
                                <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                <path fill-rule="evenodd" d="M5.216 14A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216z"/>
                                <path d="M4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
                            </svg>
                            Utilisateurs
                        </a>
                    </li>
                    {% if isConnected == true %}
                    <li class="nav-item">
                        <a href="messages.php" class="nav-link text-white {% if titre_page == 'Messages'%} active {% endif %}">
                            <svg class="bi me-2" width="16" height="16"><use xlink:href="#chat-quote-fill"/></svg>
                            Messages
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="profile.php" class="nav-link text-white {% if titre_page == 'Profil'%} active {% endif %}">
                            <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"/></svg>
                            Profil
                        </a>
                    </li>
                    {% endif %}
                </ul>
            </div>
        </nav>
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
                {% if user.utilisateur.issuperadmin == true or user.utilisateur.isadmin == true or user.utilisateur.ismoderateur == true %}
                <li><a class="dropdown-item" href="admin.php">Administration</a></li>
                {% endif %}
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="logout.php">Se déconnecter</a></li>
                {% else %}
                <li><a class="dropdown-item" href="index.php">Se connecter ou s'inscrire</a></li>
                {% endif %}
            </ul>
        </div>
    </div>
</div>
