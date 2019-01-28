<div class="autorization-content">

	<?php if ( $newPasswordReady == false ) { ?>
		<h1 class="autorization-content__title mb-30">Введите новый пароль</h1>
	<?php } else { ?>
		<h1 class="autorization-content__title mb-30">Пароль установлен</h1>
	<?php } ?>
	
	<form class="autorization-content-form" method="POST" action="<?=HOST?>set-new-password" novalidate>
		
		<div class="notification">

			<div id="enterPassword" class="notification__title notification--error mb-10 hidden">Введите новый пароль</div>

			<?php require ROOT . "templates/_parts/_errors.tpl" ?>
			
		</div>

		<?php if ( $newPasswordReady == false ) { ?>
			<input id="inputNewPass" class="input mb-10 mt-20" name="resetpassword" type="password" placeholder="Новый пароль" />
		<?php } ?>
		
		<div class="autorization-content-form-help mt-10 mb-30 text-center">
			<a class="link" href="<?=HOST?>login">Перейти на страницу входа</a>
		</div>
		
		<div class="autorization-content-form-button">

			<?php if ( $newPasswordReady == false ) { ?>
				<input type="hidden" name="resetemail" value="<?=$_GET['email']?>">
				<input type="hidden" name="onetimecode" value="<?=$_GET['code']?>">
				<input id="submitNewPass" class="button button-enter" type="submit" name="set-new-password" value="Установить пароль" />
			<?php } ?>

		</div>
	</form>
</div>