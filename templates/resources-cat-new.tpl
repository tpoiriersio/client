{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-3 order-md-2">

    <div class="container rounded bg-white mt-5 mb-5 centerprofil">
        <form id="new-resource" action="http://localhost:5000/ressourceCategories/create" method="POST">
            <div class="row mt-3">
                <div class="col-12">
                    <label for="inputTitre" class="form-label">Titre</label>
                    <input type="text" name="name" class="form-control" id="inputCatName">
                </div>
            </div>

            <button type="submit" class="btn btn-primary" style="margin: 30px; left: 0;">Enregistrer</button>
        </form>
    </div>

</div>

{{ include('elements/right-sidebar.tpl') }}

{{ include('elements/footer.tpl') }}

