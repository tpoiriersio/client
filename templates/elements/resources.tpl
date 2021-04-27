<div class="container resource-card">
        <div class="card placementPublication">
            <div class="card-header">
                <a href="profile.php?id={{ ressource.idauteur }}">
                    <h5>
                        <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle me-2">
                        <input type="hidden" class="idressource" value="{{ ressource.idressource }}">
                        <!-- ici on récupére l'id de l'auteur dans une variale hidden pour une requête ajax ensuite -->
                        <input type="hidden" class="idauteur" value="{{ ressource.idauteur }}">
                        <input type="hidden" class="idtype" value="{{ ressource.idtypres }}">
                        <input type="hidden" class="idcat" value="{{ ressource.idcatres }}">
                        <strong class="nomAuteur-{{ ressource.idauteur }}">AUTEUR</strong>
                    </h5>
                </a>
            </div>
            <div class="card-body">
                <a href="resource-details.php?id={{ ressource.idressource }}">
                    <h5 class="card-title res-title">{{ ressource.titreressource }}</h5>
                </a>
                <div class="type-res-{{ ressource.idtypres }}"></div>
                <div class="mb-3 cat-res-{{ ressource.idcatres }}"></div>
                <!--<p class="card-text">{{ ressource.messageressource }}</p>-->
                <!-- Afficher ces actions si la ressource est validée / visible publiquement -->
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#like"/></svg>
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#comment"/></svg>
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#share"/></svg>
                <!-- Afficher ces actions si la ressource appartient à l'utilisateur connecté ou pour admin / modo -->
                    {% if ressource.idauteur == user.utilisateur.iduser
                    or user.utilisateur.issuperadmin
                    or user.utilisateur.isadmin
                    %}
                <a href="resources-edit?idres={{ ressource.idressource }}" title="Éditer" class="bouton-ressource">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                        <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
                    </svg>
                </a>
                <a href="#" id="{{ ressource.idressource }}" title="Supprimer définitivement" class="bouton-ressource btn-delete">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                    </svg>
                </a>
                    {% endif %}
            </div>
        </div>
</div>

<script>
$( document ).ready(function() {

    // -- Affichage du nom et prénom de l'auteur de la ressource --
    //on parcourt pour chaque élément ayant la classe id auteur, on récupére son ID puis on fait une recherche de l'utilisateur qui l'a crée
    var collection = $(".idauteur");
    collection.each(function () {
        var id = $(this).val();
        $.ajax({
            url: 'http://localhost:5000/users/' + id,
            type: 'GET',
            dataType: 'json',
            success: function (json) {
                $('.nomAuteur-'+id).html(json.utilisateur.nomuser + ' ' + json.utilisateur.prenomuser);
            }
        });
    });

    // -- Affichage du type --
    var typecollection = $(".idtype");
    typecollection.each(function () {
        var id = $(this).val();
        $.ajax({
            url: 'http://localhost:5000/restyp/' + id,
            type: 'GET',
            dataType: 'json',
            success: function (json) {
                $('.type-res-'+id).html(json.ressourceType.libelletypres);
            }
        });
    });

    // -- Affichage de la catégorie --
    var catcollection = $(".idcat");
    catcollection.each(function () {
        var id = $(this).val();
        $.ajax({
            url: 'http://localhost:5000/rescat/' + id,
            type: 'GET',
            dataType: 'json',
            success: function (json) {
                $('.cat-res-'+id).html(json.ressourceCategory.libellecatres);
            }
        });
    });

});
</script>


