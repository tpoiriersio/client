{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-3 order-md-2">

    <div class="container rounded bg-white mt-5 mb-5 centerprofil">
        <form id="new-resource" action="http://localhost:5000/ressources/create" method="POST">
            <div class="row mt-3">
                <div class="col-12">
                    <label for="inputTitre" class="form-label">Titre</label>
                    <input type="text" name="titre" class="form-control" id="inputTitre">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <label for="inputIllustration" class="form-label">Illustration</label>
                    <input type="file" name="illustration" accept="image/png,image/jpeg" class="form-control" id="inputIllustration">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <label for="inputMessage" class="form-label">Message</label>
                    <textarea rows="5" name="message" class="form-control" id="inputMessage"></textarea>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <label for="inputDuree" class="form-label">Durée</label>
                    <input type="number" name="duree" class="form-control" id="inputDuree">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <label for="selectTypRes" class="form-label">Type</label>
                    <select name="TypRes" class="form-control" id="selectTypRes">
                        <option value="">Choisissez un type</option>
                        <!-- TODO: For each type -->
                        <option value="photo">Photo</option>
                        <option value="video">Vidéo</option>
                        <option value="texte">Texte</option>
                    </select>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <label for="selectCatRes" class="form-label">Catégorie</label>
                    <select name="CatRes" class="form-control" id="selectCatRes">
                        <option value="">Choisissez une catégorie</option>
                        <!-- TODO: For each catégorie -->
                        <option value="test">test</option>
                    </select>
                </div>
            </div>

            <button type="submit" class="btn btn-primary" style="margin: 30px; left: 0;">Enregistrer</button>
        </form>
    </div>

</div>

{{ include('elements/right-sidebar.tpl') }}

{{ include('elements/footer.tpl') }}

