<?php if ( isAdmin() ) {
	include ROOT . "templates/_parts/_admin-panel.tpl";
} ?>

<header class="header">
	<div class="row header__wrapper">
		<div class="logo">
			<div class="logo__wrapper">
				<div class="logo__img"><i class="far fa-paper-plane"></i></div>
				<div class="logo__title">Digital Lifestyle</div>
			</div>
			<div class="logo__description">Сайт IT специалиста</div>
		</div>

		<?php if ( isLoggedIn()  ) {	
			// Пользователь авторизован на сайте
			if ( $_SESSION['role'] != 'admin' ) {
				// Авторизованный пользователь НЕ является Админом
				include( ROOT . "templates/_parts/_header-user-profile.tpl");
			} 

			} else { ?>
				<?php // Пользователь НЕ авторизован на сайте ?>
				<div class="user-block nav-dawn">
					<a class="nav__link" href="<?=HOST?>registration">Регистрация</a>
					<a class="nav__link" href="<?=HOST?>login">Вход</a>
				</div>
		<?php } ?>

	</div>
	<div class="row">
		<nav class="nav">
			<a class="nav__link <?=($uri[0] == "") ? "nav__link--active" : ""?>" href="<?=HOST?>">Главная</a>
			<a class="nav__link <?=($uri[0] == "about") ? "nav__link--active" : ""?>" href="<?=HOST?>about">Обо мне</a>
			<a class="nav__link <?=($uri[0] == "portfolio") ? "nav__link--active" : ""?>" href="<?=HOST?>portfolio">Работы</a>
			<a class="nav__link <?=($uri[0] == "blog") ? "nav__link--active" : ""?>" href="<?=HOST?>blog">Блог</a>
			<a class="nav__link <?=($uri[0] == "contacts") ? "nav__link--active" : ""?>" href="<?=HOST?>contacts">Контакты</a>
		</nav>
	</div>
</header>