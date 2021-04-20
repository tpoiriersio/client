{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-3 order-md-2">
    {{ include('elements/admin-header.tpl') }}
    {% for cat in catlist.ressourceCategories %}
    <p>{{ cat.libellecatres }}</p><br>
    {% endfor %}
</div>


{{ include('elements/right-sidebar.tpl') }}

{{ include('elements/footer.tpl') }}

