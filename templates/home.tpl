{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-3 order-md-2">
    <div class="container">
        {% for key, ressource in reslist.ressources %}
    {{ include('elements/resources.tpl') }}
    {% endfor %}
    </div>
</div>

{{ include('elements/right-sidebar.tpl') }}

{{ include('elements/footer.tpl') }}


