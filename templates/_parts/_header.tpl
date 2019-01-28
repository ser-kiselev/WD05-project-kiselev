<?php 

if ( isset($_SESSION['logged_user']) && $_SESSION['login'] == 1 && $_SESSION['role'] == 'admin') {
	include ROOT . "templates/_parts/_admin-panel.tpl";
}

 ?>

<header class="header">
	<div class="row header__wrapper">
		<div class="logo">
			<div class="logo__wrapper">
				<div class="logo__img"><i class="far fa-paper-plane"></i></div>
				<div class="logo__title">Digital Lifestyle</div>
			</div>
			<div class="logo__description">Сайт IT специалиста</div>
		</div>

		<?php if ( isset($_SESSION['logged_user']) && $_SESSION['login'] == 1  ) {		
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
			<a class="nav__link" href="<?=HOST?>">Главная</a>
			<a class="nav__link" href="about-me.html">Обо мне</a>
			<a class="nav__link" href="works.html">Работы</a>
			<a class="nav__link" href="blog.html">Блог</a>
			<a class="nav__link" href="contacts.html">Контакты</a>
		</nav>
	</div>
</header>