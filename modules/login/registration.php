<?php 

$title = "Регистрация на сайте";

// Если форма отправлена, то делаем регистрацию пользователя
if ( isset($_POST['register']) ) {

	if ( trim($_POST['email']) == '' ) {
		$errors[] = ['title' => 'Введите e-mail'];
	}

	if ( trim($_POST['password']) == '' ) {
		$errors[] = ['title' => 'Введите пароль'];
	}

	// Проверка, если пользователь существует
	if ( R::count('users', 'email = ?', array($_POST['email'])) > 0 ) {
		$errors[] = [
			'title' => 'Данный e-mail уже занят',
			'desc'	=> '<p>Используйте другой email чтобы создать новый аккаунт.</p>
						<p>Или воспользуйтесь <a href="#!">восстановлением пароля</a>, чтобы войти на сайт.</p>'
		];
	}

	// Добавление нового пользователя (регистрация)
	if ( empty($errors) ) {
		$user = R::dispense('users');
		$user->email = htmlentities($_POST['email']);
		$user->role = 'user';
		$user->password = password_hash($_POST['password'], PASSWORD_DEFAULT);
		R::store($user);

		// Сессия пользователя
		$_SESSION['logged_user'] = $user;
		$_SESSION['login'] = "1";
		$_SESSION['role'] = $user->role;

		// Перенаправляем пользователя на страницу редактирования профиля
		header('Location: ' . HOST . "profile-edit");
		exit();
	}
}

// Гоговим контент для центральной части страницы
ob_start();
include ROOT . "templates/login/form-registration.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/login/login-page.tpl";
include ROOT . "templates/_parts/_foot.tpl";

 ?>