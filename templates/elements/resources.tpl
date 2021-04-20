<div class="container">

</div>
<input type="hidden" id="token" value="{{ token }}">

<!--{% if ressourceList.ressource.isNotVerified == true %}
    <div class="container">
        {% for key, ressource in resourcesList.ressources %}
        <div class="card placementPublication">
            <h5 class="card-header">
                <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle me-2">
                ///ici on récupére l'id de l'auteur dans une variale hidden pour une requête ajax ensuite
                <input type="hiden" class="idauteur" value="{{ ressource.idauteur }}">
                <strong id="nomAuteur">{{ ressource.titreressource }}</strong>
            </h5>
            <div class="card-body">
                <h5 class="card-title">{{ ressource.titreressource }}</h5>
                <p class="card-text">{{ ressource.messageressource }}</p>
                <!-- Afficher ces actions si la ressource est validée / visible publiquement -->
                <!--<svg class="bi me-2" width="16" height="16"><use xlink:href="#like"/></svg>
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#comment"/></svg>
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#share"/></svg>-->
                <!-- Afficher ces actions si la ressource appartient à l'utilisateur connecté ou pour admin / modo -->
                <!--<a href="" title="Éditer" class="bouton-ressource">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                        <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
                    </svg>
                </a>
                <a href="" title="Supprimer définitivement" class="bouton-ressource">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                    </svg>
                </a>-->
                <!-- Afficher pour les admins / modos dans la liste des ressources en attente -->
                <!--<a href="" title="Valider la ressource" class="bouton-ressource">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-check" viewBox="0 0 16 16">
                        <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"/>
                    </svg>
                </a>
            </div>
        </div>-->
        <!--{% endfor %}-->
    <!--</div>  
{% endif %}-->



<script>
$( document ).ready(function() {

    var token = $("#token").val();
    var tokenParse = JSON.parse(token);

    //on parcourt pour chaque élément ayant la classe id auteur, on récupére son ID puis on fait une recherche de l'utilisateur qui l'a crée
    var collection = $(".idauteur");
    collection.each(function() {
        var id = $(this).val();
        $.ajax({
            url : 'http://localhost:5000/users/'+ id,
            type : 'GET',
            dataType : 'json',
            success : function(json){
                $('#nomAuteur').val(json.utilisateur.nomuser + json.utilisateur.prenomuser);
            },
        });
    });

    $.ajax({
        url : 'http://localhost:5000/res/NotVerified',
        type : 'GET',
        dataType : 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Authorization", 'Bearer '+ tokenParse.jwtToken);
        },
        success : function(json){
            for (let i = 0; i <= Object.keys(json).length; i++) {             
                var retour = '<div class="card placementPublication"><h5 class="card-header"><img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle me-2"><strong class="nomAuteur"></strong></h5>';
                
                var retourContenu = '<div class="card-body">' +
                '<h5 class="card-title">'+ json.ressources[i]['titreressource'] + '</h5>' +
                '<p class="card-text">'+ json.ressources[i]['messageressource'] + '</p>' +
                '{% if ressource.isverified == true %}' +
                '<svg class="bi me-2" width="16" height="16"><use xlink:href="#like"/></svg>' +
                '<svg class="bi me-2" width="16" height="16"><use xlink:href="#comment"/></svg>' +
                '<svg class="bi me-2" width="16" height="16"><use xlink:href="#share"/></svg>' +
                '{% endif %}' +
                '{% if ressource.idauteur == user.utilisateur.iduser or user.utilisateur.issuperadmin or user.utilisateur.isadmin or user.utilisateur.ismoderateur %}'+
                '<a href="" title="Éditer" class="bouton-ressource">'+
                '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">'+
                '<path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>'+
                '</svg>'+
                '</a>'+
                '<a href="" title="Supprimer définitivement" class="bouton-ressource">'+
                '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">'+
                '<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>'+
                '</svg>'+
                '</a>'+
                '{% endif %}'+
                '{% if ressource.isverified == false %}'+
                '{% if user.utilisateur.issuperadmin or user.utilisateur.isadmin or user.utilisateur.ismoderateur %}'+
                '<a href="" title="Valider la ressource" class="bouton-ressource">'+
                '<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-check" viewBox="0 0 16 16">'+
                '<path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"/>'+
                '</svg>'+
                '</a>'+
                '{% endif %}'+
                '{% endif %}'+
                '</div></div>';


                $.ajax({
                    url : 'http://localhost:5000/users/'+ json.ressources[i]['idauteur'],
                    type : 'GET',
                    dataType : 'json',
                    success : function(json){
                        $('.nomAuteur').html(json.utilisateur.nomuser + " " +json.utilisateur.prenomuser);
                    },
                });
                
                $(".container").html($(".container").html() + retour + retourContenu );
            }
        },  
    });
});
</script>