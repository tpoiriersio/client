<div class="container">
    {% for i in 0..7 %}
    <div class="card placementPublication">
        <h5 class="card-header">
            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle me-2">
            <strong>PSEUDO</strong>
        </h5>
        <div class="card-body">
            <h5 class="card-title">Titre de la ressource</h5>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ultrices eleifend bibendum. Phasellus finibus mi porttitor sagittis egestas.
                Cras dignissim, orci nec elementum commodo, eros orci hendrerit urna, scelerisque porttitor nunc dui ut enim.
                Etiam rhoncus tortor consequat, auctor nunc vel, mollis leo. Mauris finibus dui sit amet malesuada fermentum.
                Mauris in ligula suscipit, vestibulum felis eget, vehicula mi. Donec ullamcorper elit sit amet condimentum tristique. Donec tristique venenatis mollis..</p>
            <svg class="bi me-2" width="16" height="16"><use xlink:href="#like"/></svg>
            <svg class="bi me-2" width="16" height="16"><use xlink:href="#comment"/></svg>
            <svg class="bi me-2" width="16" height="16"><use xlink:href="#share"/></svg>
        </div>
    </div>
    {% endfor %}

</div>