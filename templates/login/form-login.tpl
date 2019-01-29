<div class="autorization-content">
	<h1 class="autorization-content__title mb-40">Вход на сайт</h1>
	<form class="autorization-content-form" method="POST" action="<?=HOST?>login" novalidate>
		<div class="notification">

			<div id="enterEmail" class="notification__title notification--error mb-10 hidden">Введите e-mail</div>
			<div id="invalidEmail" class="notification__title notification--error mb-10 hidden">Неверный формат email</div>
			<div id="enterPassword" class="notification__title notification--error mb-10 hidden">Введите пароль</div>

			<?php require ROOT . "templates/_parts/_errors.tpl" ?>
			
		</div>
		<input class="input mb-10 mt-20" name="email" id="inputEmail" type="email" placeholder="E-mail" value="admin@mysite.com" />
		<input class="input mb-25" name="password" id="inputPassword" type="password" placeholder="Пароль" value="admin" />
		<div class="autorization-content-form-help mb-30">
			<label class="form__label-checkbox">
				<input class="form__input-checkbox" type="checkbox" checked="checked" /><span class="form__checkbox"></span>Запомнить меня 
			</label>
			<a class="link" href="<?=HOST?>lost-password">Забыл пароль</a>
		</div>
		<div class="autorization-content-form-button">
			<input id="inputSubmit" class="button button-enter" type="submit" name="login" value="Войти" />
		</div>
	</form>
</div>