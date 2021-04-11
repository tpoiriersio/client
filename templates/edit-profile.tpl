{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-3 order-md-2">
{{ include('elements/profile-header.tpl') }}
    <div class="container rounded bg-white mt-5 mb-5 centerprofil">
        <form id="edit-profile" action="">
            <div class="row mt-3">
                    <div class="col-md-12">  
                    <label for="inputAvatar" class="form-label">Image de profil</label>
                    <input type="file" accept="image/png,image/jpeg" class="form-control" id="inputAvatar">
                    </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-6">  
                    <label for="inputNom" class="form-label">Nom</label>
                    <input type="text" class="form-control" id="inputNom" value="{{ nom }}">
                </div>
                <div class="col-md-6">  
                    <label for="inputPrenom" class="form-label">Prénom</label>
                    <input type="text" class="form-control" id="inputPrenom" value="{{ prenom }}">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-6">  
                    <label for="inputPays" class="form-label">Pays</label>
                    <input type="text" class="form-control" id="inputPays" value="{{ pays }}">
                </div>
                <div class="col-md-6">  
                    <label for="inputEmail" class="form-label">Adresse email</label>
                    <input type="email" class="form-control" id="inputEmail" aria-describedby="emailHelp" value="{{ email }}">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-6">
                    <label for="inputPassword1" class="form-label">Mot de passe</label>
                    <input type="password" class="form-control" id="inputPassword1">
                </div>
                <div class="col-md-6">
                    <label for="inputPassword2" class="form-label">Confirmer le mot de passe</label>
                    <input type="password" class="form-control" id="inputPassword2">
                </div>
            </div>
        <button type="submit" class="btn btn-primary" style="margin: 30px; left: 0;">Enregistrer</button>
        </form>
    </div>
</div>

{{ include('elements/right-sidebar.tpl') }}

{{ include('elements/footer.tpl') }}

