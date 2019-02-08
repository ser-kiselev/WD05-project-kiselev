<?php 

$title = "Контакты";
$contacts = R::load('contacts', 1);

if ( isset($_POST['newMessage']) ) {

	if ( trim($_POST['name']) == '') {
		$errors[] = ['title' => 'Введите Имя' ];
	}

	if ( trim($_POST['email']) == '') {
		$errors[] = ['title' => 'Введите Email' ];
	}

	if ( trim($_POST['message']) == '') {
		$errors[] = ['title' => 'Введите текст сообщения' ];
	}

	if ( empty($errors) ) {

		$message = R::dispense('messages');
		$message->name = htmlentities($_POST['name']);
		$message->email = htmlentities($_POST['email']);
		$message->message = htmlentities($_POST['message']);
		$message->dateTime = R::isoDateTime();

		if ( isset($_FILES['file']['name']) && $_FILES['file']['tmp_name'] != "" ) {

			// Записываем параметры файла в переменные
			$fileName = $_FILES['file']['name'];
			$fileTmpLoc = $_FILES['file']['tmp_name'];
			$fileType = $_FILES['file']['type'];
			$fileSize = $_FILES['file']['size'];
			$fileErrorMsg = $_FILES['file']['error'];
			$kaboom = explode(".", $fileName);
			$fileExt = end($kaboom);

			$db_file_name = rand(100000000000,999999999999) . "." . $fileExt;

			if ( $fileSize > 4194304 ) {
				$errors[] = ['title' => 'Файл изображения не должен быть больше 4 Мб'];
			} else if ( !preg_match("/\.(gif|jpg|jpeg|png|pdf|doc)$/i", $fileName) ) {
				$errors[] = [
					'title' => 'Неверный формат файла',
					'desc'	=> '<p>Допустимые расширения файлов: jpg, jpeg, png, pdf, doc</p>'
				];
			} else if ( $fileErrorMsg == 1 ) {
				$errors[] = ['title' => 'При загрузке файла произошла ошибка. Попробуйте еще раз'];
			}

			// Перемещаем загруженный файл в нужную директорию
			$messageFileFolderLocation = ROOT . 'usercontent/upload-files/';
			$uploadfile = $messageFileFolderLocation . $db_file_name;
			$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

			if ( $moveResult != true ) {
				$errors[] = ['title' => 'Ошибка при загрузке файла'];
			}

			$message->message_file_name_original = $fileName;
			$message->message_file = $db_file_name;
		}

		R::store($message);

		$success[] = ['title' => 'Сообщение было успешно отправлено!' ];

	}
}

// Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/contacts/contacts.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

 ?>