<div class="autorization-content">
	<h1 class="autorization-content__title mb-30">Забыл пароль</h1>
	<form id="lostPassForm" class="autorization-content-form" method="POST" action="<?=HOST?>lost-password" novalidate>
		
		<div class="notification">

			<div id="enterEmail" class="notification__title notification--error mb-10 hidden">Введите e-mail</div>
			<div id="invalidEmail" class="notification__title notification--error mb-10 hidden">Неверный формат email</div>

			<?php require ROOT . "templates/_parts/_errors.tpl" ?>
			<?php require ROOT . "templates/_parts/_success.tpl" ?>
			
		</div>
		<input id="inputEmailLostPassForm" class="input mb-10 mt-20" name="email" type="email" placeholder="E-mail" />
		<div class="autorization-content-form-help mt-10 mb-30 text-center">
			<a class="link" href="<?=HOST?>login">Перейти на страницу входа</a>
		</div>
		<div class="autorization-content-form-button">
			<input id="restorePass" class="button button-enter" type="submit" name="lost-password" value="Восстановить пароль" />
		</div>
	</form>
</div>