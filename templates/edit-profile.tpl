{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-3 order-md-2">
{{ include('elements/profile-header.tpl') }}

    <form id="edit-profile" action="">
        <div class="mb-3">
            <label for="inputAvatar" class="form-label">Image de profil</label>
            <input type="file" accept="image/png,image/jpeg" class="form-control" id="inputAvatar">
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
            <label for="inputPays" class="form-label">Pays</label>
            <input type="text" class="form-control" id="inputPays" value="{{ pays }}">
        </div>
        <div class="mb-3">
            <label for="inputEmail" class="form-label">Adresse email</label>
            <input type="email" class="form-control" id="inputEmail" aria-describedby="emailHelp" value="{{ email }}">
        </div>
        <div class="mb-3">
            <label for="inputPassword1" class="form-label">Mot de passe</label>
            <input type="password" class="form-control" id="inputPassword1">
        </div>
        <div class="mb-3">
            <label for="inputPassword2" class="form-label">Confirmer le mot de passe</label>
            <input type="password" class="form-control" id="inputPassword2">
        </div>
       <button type="submit" class="btn btn-primary">Enregistrer</button>
    </form>

</div>

{{ include('elements/right-sidebar.tpl') }}

{{ include('elements/footer.tpl') }}

