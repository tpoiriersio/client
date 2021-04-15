
{{ include('elements/header.tpl') }}
<body class="bodyIndex">
    <div class="login">
        <div class="wrap">
            <div id="toggle-wrap">
                <div id="toggle-terms">
                    <div id="cross">
                        <span></span>
                        <span></span>
                    </div>
                </div>
            </div>
            <div class="recovery">
                <h2>Mot de passe oublié</h2>
                <p>Entrez votre adresse email afin de récupérer votre mot de passe.</p>
                <p>Une suite d'instruction sera ensuite envoyé par mail.</p>
                <form class="recovery-form" action="" method="post">
                    <input type="email" class="input" id="user_recover" placeholder="Entrez votre adresse email">
                    <input type="submit" class="button" value="Submit">
                </form>
                <p class="mssg">Un email vient de vous être envoyé.</p>
            </div>
            <div class="content">
                <div id="slideshow">
                    <div class="one">
                        <h2><a href="#"><img src="./assets/media/logo/logo.png" alt=""></a></h2>
                        <p>Rejoignez Ressource Relationnelle dès maintenant</p>
                    </div>
                </div>
            </div>
            <div class="user">
                <div class="form-wrap">
                    <div class="tabs">
                        <h3 class="login-tab"><a class="log-in active" href="#login-tab-content"><span>Se connecter<span></a></h3>
                        <h3 class="signup-tab"><a class="sign-up" href="#signup-tab-content"><span>S'inscrire</span></a></h3>
                    </div>
                    <div class="tabs-content">
                        <div id="login-tab-content" class="active">
                            <form class="login-form" method="POST">
                                <input type="email" class="input" id="user_email" name="email" autocomplete="off" placeholder="Adresse email">
                                <input type="password" class="input" id="user_pass" name="mdp" autocomplete="off" placeholder="Mot de passe">
                                <input type="checkbox" class="checkbox" checked id="remember_me">
                                <label for="remember_me">Se souvenir de moi</label>
                                <input type="button" class="button" value="Se connecter" onclick="connexion()">
                            </form>
                            <div class="help-action">
                                <p><i class="fa fa-arrow-left" aria-hidden="true"></i><a class="forgot" href="#">Mot de passe oublié ?</a></p>
                            </div>
                        </div>
                        <div id="signup-tab-content">
                            <form class="signup-form" action="http://localhost:5000/users/inscription" method="POST">
                                <input type="email" class="input" id="user_emailinscription" name="email" autocomplete="off" placeholder="Adresse email">
                                <input type="text" class="input" id="user_surname" name="nom" autocomplete="off" placeholder="Nom">
                                <input type="text" class="input" id="user_name" name="prenom" autocomplete="off" placeholder="Prénom">
                                <input type="password" class="input" id="user_passinscription" name="mdp" autocomplete="off" placeholder="Mot de passe">
                                <input type="phone" class="input" id="user_tel" name="tel" autocomplete="off" placeholder="Téléphone">
                                <input type="text" class="input" id="user_address" name="adresse" autocomplete="off" placeholder="Adresse">
                                <input type="text" class="input" id="user_country" name="pays" autocomplete="off" placeholder="Pays">
                                <input type="text" class="input" id="user_situation" name="situation" autocomplete="off" placeholder="Situation">
                                <input type="checkbox" class="input" id="user_handicap" name="handicap" autocomplete="off" placeholder="Handicap">

                                <input type="submit" class="button" value="S'inscrire">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
$(function() {
	var tab = $('.tabs h3 a');
	tab.on('click', function(event) {
		event.preventDefault();
		tab.removeClass('active');
		$(this).addClass('active');
		tab_content = $(this).attr('href');
		$('div[id$="tab-content"]').removeClass('active');
		$(tab_content).addClass('active');
	});
});

(function($) {
	'use strict';
	$.fn.swapClass = function(remove, add) {
		this.removeClass(remove).addClass(add);
		return this;
	};
}(jQuery));

function connexion(){
    var email = $("#user_email").val();
    var mdp = $("#user_pass").val();
    $.ajax({
        url : 'http://localhost:5000/users/connexion',
        type : 'POST',
        data: {
        "email": email,
        "mdp": mdp,
        },
        dataType : 'JSON',
        success : function(json){
            $.ajax({
                url : 'login.php',
                type : 'POST',
                data: {
                "json": json,
                },
                dataType : 'html',
                success : function(html){
                    window.location.href = './home.php';
                },
            });
        },
    });
}

/*$(function() {
	$('.agree,.forgot, #toggle-terms, .log-in, .sign-up').on('click', function(event) {
		event.preventDefault();
		var terms = $('.terms'),
        recovery = $('.recovery'),
        close = $('#toggle-terms'),
        arrow = $('.tabs-content .fa');
		if ($(this).hasClass('agree') || $(this).hasClass('log-in') || ($(this).is('#toggle-terms')) && terms.hasClass('open')) {
			if (terms.hasClass('open')) {
				terms.swapClass('open', 'closed');
				close.swapClass('open', 'closed');
				arrow.swapClass('active', 'inactive');
			} else {
				if ($(this).hasClass('log-in')) {
					return;
				}
				terms.swapClass('closed', 'open').scrollTop(0);
				close.swapClass('closed', 'open');
				arrow.swapClass('inactive', 'active');
			}
		}
		else if ($(this).hasClass('forgot') || $(this).hasClass('sign-up') || $(this).is('#toggle-terms')) {
			if (recovery.hasClass('open')) {
				recovery.swapClass('open', 'closed');
				close.swapClass('open', 'closed');
				arrow.swapClass('active', 'inactive');
			} else {
				if ($(this).hasClass('sign-up')) {
					return;
				}
				recovery.swapClass('closed', 'open');
				close.swapClass('closed', 'open');
				arrow.swapClass('inactive', 'active');
			}
		}
	});
});


$(function() {
	$('.recovery .button').on('click', function(event) {
		event.preventDefault();
		$('.recovery .mssg').addClass('animate');
		setTimeout(function() {
			$('.recovery').swapClass('open', 'closed');
			$('#toggle-terms').swapClass('open', 'closed');
			$('.tabs-content .fa').swapClass('active', 'inactive');
			$('.recovery .mssg').removeClass('animate');
		}, 2500);
	});
});


$(function() {
	$('.button').on('click', function(event) {
		$(this).stop();
		event.preventDefault();
		return false;
	});
});*/

</script>

{{ include('elements/footer.tpl') }}




