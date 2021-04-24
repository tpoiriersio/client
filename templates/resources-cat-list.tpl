{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-3 order-md-2">
    {{ include('elements/admin-header.tpl') }}
    <br/>
    <ol class="list-group list-group-numbered">
    {% for cat in catlist.ressourceCategories %}
    <li class="list-group-item">{{ cat.libellecatres }}</li>
    {% endfor %}
    </ol>
</div>


{{ include('elements/right-sidebar.tpl') }}

{{ include('elements/footer.tpl') }}

