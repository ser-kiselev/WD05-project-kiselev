<?php 

$title = "Установить новый пароль";

$recoveryCode = false;
$newPasswordReady = false;

if ( !empty($_GET['email']) ) {

	// Выбираем из БД пользователя с указанным email
	$user = R::findOne('users', 'email = ?', array($_GET['email']));

	if ( $user ) {
		// Уменьшаем кол-ва попыток восстановления пароля по ссылке
		$user->recovery_code_times--; // recovery_code_times = 2
		R::store($user);

		// Проверка верности кода
		if ( $user->recovery_code == $_GET['code'] ) {
			$recoveryCode = true;
		} else {
			$recoveryCode = false;
		}
	} else {
		echo "Пользователь с таким email не найден";
		die;
	}

} else if ( isset($_POST['set-new-password']) ) {

	// Если форма установки нового пароля для пользователя отправлена
	// Ищем пользователя по Email
	$user = R::findOne('users', 'email = ?', array( $_POST['resetemail']) );

	// Уменьшаем кол-ва попыток восстановления пароля по ссылке
	$user->recovery_code_times--; // recovery_code_times = 1
	// Сохраняем пользователя в БД
	R::store($user);

	$user = R::findOne('users', 'email = ?', array($_POST['resetemail']));
	
	if ( $user ) {
		if ( $user->recovery_code_times < 1 ) {
			header("Location: " . HOST ."set-new-password-error");
			die;
		}

		// Проверяем onetimecode
		if ( $user->recovery_code == $_POST['onetimecode']) { 

			// Если все верно – ставим новый пароль и убиваем код
			$user->password = password_hash($_POST['resetpassword'], PASSWORD_DEFAULT);

			// в любом случае убиваем код
			$user->recovery_code_times = 0; // recovery_code_times = 0
			R::store($user);
			$success[] = ['title' => "Пароль обновлен"];
			$newPasswordReady = true;
		}
	}

} else {
	header("Location: " . HOST ."lost-password");
	die;
}

// Гоговим контент для центральной части страницы
ob_start();

include ROOT . "templates/login/form-set-new-password.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/login/login-page.tpl";
include ROOT . "templates/_parts/_foot.tpl";

 ?>