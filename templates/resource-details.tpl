{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-3 order-md-2">

    <div class="container">
        <div class="card placementPublication">
            <div class="card-header">
                <a href="profile.php?id={{ ressource.ressource.idauteur }}">
                    <h5>
                        <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle me-2">
                        <input type="hidden" class="idressource" value="{{ ressource.ressource.idressource }}">
                        <!-- ici on récupére l'id de l'auteur dans une variale hidden pour une requête ajax ensuite -->
                        <input type="hidden" class="idauteur" value="{{ ressource.ressource.idauteur }}">
                        <input type="hidden" class="idtype" value="{{ ressource.ressource.idtypres }}">
                        <input type="hidden" class="idcat" value="{{ ressource.ressource.idcatres }}">
                        <strong class="nomAuteur-{{ ressource.ressource.idauteur }}">AUTEUR</strong>
                    </h5>
                </a>
            </div>
            <div class="card-body">
                <h5 class="card-title">{{ ressource.ressource.titreressource }}</h5>
                <div class="type-res-{{ ressource.ressource.idtypres }}"></div>
                <div class="cat-res-{{ ressource.ressource.idcatres }}"></div>

                <p class="card-text duree-res">Durée : {{ ressource.ressource.dureeressource }} minutes </p>
                <hr>
                <p class="card-text">{{ ressource.ressource.messageressource }}</p>
                <hr>
                {% if ressource.ressource.isverified == true %}
                <!-- Afficher ces actions si la ressource est validée / visible publiquement -->
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#like"/></svg>
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#comment"/></svg>
                <a title="Inviter à participer" class="btn-invite">
                    <svg class="bi me-2" width="16" height="16"><use xlink:href="#share"/></svg>
                </a>
                {% endif %}
                {% if ressource.ressource.idauteur == user.utilisateur.iduser
                or user.utilisateur.issuperadmin
                or user.utilisateur.isadmin
                %}
                <!-- Afficher ces actions si la ressource appartient à l'utilisateur connecté ou pour admin / modo -->
                <a href="resources-edit?idres={{ ressource.ressource.idressource }}" title="Éditer" class="bouton-ressource">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                        <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
                    </svg>
                </a>
                <a href="#" id="{{ ressource.ressource.idressource }}" title="Supprimer définitivement" class="bouton-ressource btn-delete">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                    </svg>
                </a>
                {% endif %}
            </div>
        </div>
    </div>

    <div class="container d-flex justify-content-center mt-100 mb-100">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Commentaires récents</h4>
                    </div>
                    <div class="comment-widgets m-b-20">
                        <div class="d-flex flex-row comment-row ">
                            <div class="p-2"><span class="round"><img src="https://i.imgur.com/tT8rjKC.jpg" alt="user" width="50"></span></div>
                            <div class="comment-text active w-100">
                                <h5>Jonty Andrews</h5>
                                <div class="comment-footer"> <span class="date">March 13, 2020</span> <span class="label label-success">Approved</span> <span class="action-icons active"> <a href="#" data-abc="true"><i class="fa fa-pencil"></i></a> <a href="#" data-abc="true"><i class="fa fa-rotate-right text-success"></i></a> <a href="#" data-abc="true"><i class="fa fa-heart text-danger"></i></a> </span> </div>
                                <p class="m-b-5 m-t-10">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="bg-light p-2">
        <div class="d-flex flex-row align-items-start"><img class="rounded-circle" src="https://i.imgur.com/RpzrMR2.jpg" width="40">
            <textarea class="form-control ml-1 shadow-none textarea" id="valueCommentaire"></textarea>
        </div>
        <div class="mt-2 text-right">
            <button class="btn btn-primary btn-sm shadow-none" id="addCommentaire" type="button">Ajouter un commentaire</button>
        </div>
    </div>
</div>

<div id="relation-window" class="container-fluid">
    <input id="reluserid" type="hidden" value="" class="valueUser">
    <input id="relownid" type="hidden" value="" class="valueUser">
    <div class="container">
        <div class="card placementPublication relation-card">
            <div class="card-header">
                <h5>Choisir une relation à inviter</h5>
                <div id="close-relation-window">
                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                    </svg>
                </div>
            </div>
            <div class="card-body">
                <select name="TypRel" class="form-control mb-2" id="selectTypRel">
                    <option value="">Choisissez une personne</option>
                    {% for key, utilisateur in userslist.utilisateurs %}
                    {% set inrelation = false %}
                    {% for relation in rellist.relations %}
                    {% if utilisateur.iduser in relation %}
                    <option value="{{ utilisateur.iduser }}">{{ utilisateur.prenomuser }} {{ utilisateur.nomuser }}
                        {% for relation in rellist.relations %}
                        {% if relation.iduser == utilisateur.iduser %}
                         ({{ relation.libelletyprel }})
                        {% endif %}
                        {% endfor %}</option>
                    {% endif %}
                    {% endfor %}
                    {% endfor %}
                </select>
                <button type="button" class="btn btn-primary" id="register">Valider</button>

            </div>
        </div>
    </div>
</div>


<script>
    $( document ).ready(function() {

        var token = $("#token").val();
        var tokenParse = JSON.parse(token);

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

        // -- Afficher fenêtre relations --
        $(".btn-invite").click(function() {
            var userId = $(this).children(".valueUser").val();
            var myId = $(this).children(".valueSelf").val();
            $( "#relation-window" ).show();
            $( "#reluserid").val(userId) ;
            $( "#relownid").val(myId) ;
        });

        // -- Fermer la fenêtre relations --
        $("#close-relation-window").click(function() {
            $( "#relation-window" ).hide();
        });

        // -- Ajout de commentaire -- 
        $("#addCommentaire").click(function() {
            var contenu = $("#valueCommentaire").val();
            var idUser = $(".idauteur").val();
            var idRessource = $(".idressource").val();
           
            $.ajax({
                data: {
                    "contenu ": contenu
                },
                type : 'POST',
                url : 'http://localhost:5000/res/comm/' +idRessource,
                dataType : 'json',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Authorization", 'Bearer '+ tokenParse.jwtToken);
                },
                success : function(json){
                    alert('Commentaire ajouté avec succès');
                    location.reload();
                },
                error: function (result, status, err) {
                    alert('Erreur : ' + result.responseText);
                }
            });
        });

    });
</script>


{{ include('elements/right-sidebar.tpl') }}

{{ include('elements/footer.tpl') }}

<script src="js/res-delete.js"></script>
