<body class="registration">
	<div class="autorization autorization--vertical-position">
		<div class="autorization-head">
			<div class="autorization-head-logo"><span class="mr-20"><i class="far fa-paper-plane mr-0"></i></span><span>Супер сайт</span></div>
			
			<div class="autorization-head-link">
				<?php if ( $uri[0] == 'registration' ) { ?>
						<a class="link" href="<?=HOST?>login">Вход</a>
				<?php } else { ?>
						<a class="link" href="<?=HOST?>registration">Регистрация</a>
				<?php } ?>
			</div>

		</div>
		<div class="container">
			<div class="row">
				<div class="col-12 flex--center">
					<?=$content?>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="autorization-footer pb-30">
						<p class="mb-15">© Сергей Киселев</p>
						<p>Создано с <i class="mr-0 fas fa-heart"></i> в <a class="strong" href="http://webcademy.ru" target="_blank">WebCademy.ru</a> в 2019 году</p>
					</div>
				</div>
			</div>
		</div>
	</div>
