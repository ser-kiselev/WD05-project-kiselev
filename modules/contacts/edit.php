<?php 

if( !isAdmin() ) { 
	header('Location: ' . HOST);
	die();
}

$title = "Редактировать данные";
$contacts = R::load('contacts', 1);

if ( isset($_POST['contactsUpdate']) ) {
	
	if ( trim($_POST['name']) == '') {
		$errors[] = ['title' => 'Введите имя' ];
	}
	
	if ( trim($_POST['email']) == '') {
		$errors[] = ['title' => 'Введите email' ];
	}

	if ( trim($_POST['phone']) == '') {
		$errors[] = ['title' => 'Введите номер телефона' ];
	}
	
	if ( empty($errors)) {
		$contacts->email = htmlentities($_POST['email']);
		$contacts->phone = htmlentities($_POST['phone']);
		$contacts->address = htmlentities($_POST['address']);
		$contacts->name = htmlentities($_POST['name']);
		$contacts->secondname = htmlentities($_POST['secondname']);
		$contacts->skype = htmlentities($_POST['skype']);
		$contacts->vk = htmlentities($_POST['vk']);
		$contacts->fb = htmlentities($_POST['fb']);
		$contacts->github = htmlentities($_POST['github']);
		$contacts->twitter = htmlentities($_POST['twitter']);
		R::store($contacts);
		header('Location: ' . HOST . "contacts");
		exit();
	}
}

// Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/contacts/edit.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

 ?>