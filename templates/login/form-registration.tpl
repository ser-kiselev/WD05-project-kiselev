<div class="autorization-content">
	<h1 class="autorization-content__title mb-40">Регистрация</h1>

	<form id="registrationForm" method="POST" class="autorization-content-form" action="<?=HOST?>registration" novalidate>
		<div class="notification">
			<div id="enterEmail" class="notification__title notification--error mb-10 hidden">Введите e-mail</div>
			<div id="invalidEmail" class="notification__title notification--error mb-10 hidden">Неверный формат email</div>
			<div id="enterPassword" class="notification__title notification--error mb-10 hidden">Введите пароль</div>

			<?php require ROOT . "templates/_parts/_errors.tpl" ?>

		</div>
		<input id="inputEmail" class="input mb-10 mt-20" name="email" type="email" placeholder="E-mail" />
		<input id="inputPassword" class="input mb-30" name="password" type="password" placeholder="Пароль" />
		<div class="autorization-content-form-button">
			<input id="inputSubmit" class="button button-enter" type="submit" name="register" value="Регистрация" />
		</div>
	</form>
</div>