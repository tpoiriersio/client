<div class="container">
    <div class="row">
    {% for key, user in userslist.utilisateurs %}
        <div class="col-md-6">
            <div class="card placementPublication relation-card" id="fetchUsers">
                <h5 class="card-header">
                    <a href="profile.php?id={{user.iduser}}">
                        <img src="assets/media/upload/images/homer.jpg" class="rounded-circle user-pic">
                        <strong>{{ user.prenomuser }} {{ user.nomuser }}</strong>
                    </a>
                </h5>
                <div class="card-body">
                    <a href="profile.php?id={{user.iduser}}" title="Voir le profil" class="bouton-relation">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                            <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                        </svg>
                    </a>
                    <!--<a href="messages.php?id={{user.iduser}}" title="Envoyer un message" class="bouton-relation">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-chat-quote-fill" viewBox="0 0 16 16">
                            <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM7.194 6.766a1.688 1.688 0 0 0-.227-.272 1.467 1.467 0 0 0-.469-.324l-.008-.004A1.785 1.785 0 0 0 5.734 6C4.776 6 4 6.746 4 7.667c0 .92.776 1.666 1.734 1.666.343 0 .662-.095.931-.26-.137.389-.39.804-.81 1.22a.405.405 0 0 0 .011.59c.173.16.447.155.614-.01 1.334-1.329 1.37-2.758.941-3.706a2.461 2.461 0 0 0-.227-.4zM11 9.073c-.136.389-.39.804-.81 1.22a.405.405 0 0 0 .012.59c.172.16.446.155.613-.01 1.334-1.329 1.37-2.758.942-3.706a2.466 2.466 0 0 0-.228-.4 1.686 1.686 0 0 0-.227-.273 1.466 1.466 0 0 0-.469-.324l-.008-.004A1.785 1.785 0 0 0 10.07 6c-.957 0-1.734.746-1.734 1.667 0 .92.777 1.666 1.734 1.666.343 0 .662-.095.931-.26z"/>
                        </svg>
                    </a>-->
                    <a title="Supprimer l'utilisateur" class="bouton-relation deleteUtilisateur">
                        <input type="hidden" value="{{user.iduser}}" id="valueUser">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-person-x-fill" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6.146-2.854a.5.5 0 0 1 .708 0L14 6.293l1.146-1.147a.5.5 0 0 1 .708.708L14.707 7l1.147 1.146a.5.5 0 0 1-.708.708L14 7.707l-1.146 1.147a.5.5 0 0 1-.708-.708L13.293 7l-1.147-1.146a.5.5 0 0 1 0-.708z"/>
                        </svg>
                    </a>
                    <!-- Options admin / modo -->
                    <a href="admin-edit-user.php?id={{user.iduser}}" title="Modifier l'utilisateur" class="bouton-relation">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
                            <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
                        </svg>
                    </a>
                </div>
            </div>
            <input type="hidden" id="token" value="{{ token }}">
        </div>
    {% endfor %}
    </div>
</div>


<script>

$(".deleteUtilisateur").click(function() {
    var userId = $("#valueUser").val();
    var token = $("#token").val();
    //alert(token);
    console.log(token);
    $.ajax({
        url : 'http://localhost:5000/users/delete/:id',
        headers: {"jwtToken": token},
        type : 'DELETE',
        data: {
        "id": userId,
        //"jwtToken": token,
        },
        dataType : 'html',
        success : function(html){
            //$("#fetchUsers").load(" #fetchUsers"); 
            //console.log("utilisateur supprimé");
        },
    });
});



</script>