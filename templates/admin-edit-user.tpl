{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-3 order-md-2">
    {{ include('elements/admin-header.tpl') }}
    <div class="container rounded bg-white mt-5 mb-5 centerprofil">
    <form id="edit-profile">
        <div class="mb-3">
            <label for="selectRole" class="form-label">Rôle</label>
            <select class="form-select" id="selectRole">
                <option value="citoyen">Citoyen</option>
                <option value="moderateur">Modérateur</option>
                <option value="administrateur">Administrateur</option>
            </select>
        </div>
        <!--<div class="mb-3">
            <label for="inputAvatar" class="form-label">Image de profil</label>
            <input type="file" accept="image/png,image/jpeg" class="form-control" id="inputAvatar">
        </div>
        <button type="" class="btn btn-primary">Supprimer l'image</button>-->
        <div class="mb-3">
            <label for="inputEmail" class="form-label">Adresse email</label>
            <input type="email" class="form-control" id="inputEmail" aria-describedby="emailHelp" value="{{ email }}">
        </div>
        <div class="mb-3">
            <label for="inputPrenom" class="form-label">Prénom</label>
            <input type="text" class="form-control" id="inputPrenom" value="{{ prenom }}">
        </div>
        <div class="mb-3">
            <label for="inputNom" class="form-label">Nom</label>
            <input type="text" class="form-control" id="inputNom" value="{{ nom }}">
        </div>
        <div class="mb-3">
            <label for="inputTel" class="form-label">Téléphone</label>
            <input type="text" class="form-control" id="inputTel" value="{{ tel }}">
        </div>
        <div class="mb-3">
            <label for="inputPays" class="form-label">Pays</label>
            <input type="text" class="form-control" id="inputPays" value="{{ pays }}">
        </div>
        <div class="mb-3">
            <label for="inputSituation" class="form-label">Situation familiale</label>
            <input type="text" class="form-control" id="inputSituation" value="{{ situation }}">
        </div>
        <div class="mb-3">
            <label for="inputPassword1" class="form-label">Mot de passe</label>
            <input type="password" class="form-control" id="inputPassword1">
        </div>
        <div class="mb-3">
            <label for="inputPassword2" class="form-label">Confirmer le mot de passe</label>
            <input type="password" class="form-control" id="inputPassword2">
        </div>

        <button class="btn btn-danger">Supprimer l'utilisateur</button>
        <button type="submit" class="btn btn-primary" id="register">Enregistrer</button>
    </form>
    </div>  

</div>

<script>
    //on récupére l'id passé en URL pour ensuite l'envoyer
    var searchParams = new URLSearchParams(window.location.search);
    searchParams.has('id') ;
    var id = searchParams.get('id');

    var email = $("#inputEmail").val();
    var prenom = $("#inputPrenom").val();
    var nom = $("#inputNom").val();
    var tel = $("#inputTel").val();
    var pays = $("#inputPays").val();
    var sitation = $("#inputSituation").val();
    var mdp = $("#inputPassword2").val();

    $("#register").click(function() {
        //alert(userId);
        $.ajax({
            url : 'http://localhost:5000/users/update/:id',
            type : 'PUT',
            data: {
            "id": id,
            "email": email,
            "prenom": prenom,
            "nom": nom,
            "tel": tel,
            "pays":pays,
            "sitation": sitation,
            "mdp": mdp
            //"token": ,
            },
            dataType : 'html',
            success : function(html){
                //$("#fetchUsers").load(" #fetchUsers"); 
                console.log("utilisateur modifié");
            },
        });
    });


</script>

{{ include('elements/right-sidebar.tpl') }}

{{ include('elements/footer.tpl') }}

