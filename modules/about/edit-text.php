<?php 

if ( !isAdmin() ) {
	header("Location: " . HOST);
	die();
}

$title = "Редактировать – Обо мне";
$about = R::load('about', 1);

if ( isset($_POST['textUpdate']) ) {

	if ( trim($_POST['name']) == '' ) {
		$errors[] = ['title' => 'Введите имя'];
	}

	if ( trim($_POST['description']) == '' ) {
		$errors[] = ['title' => 'Введите описание'];
	}

	if ( empty($errors) ) {

		$about->name = htmlentities($_POST['name']);
		$about->description = $_POST['description'];

		// Добавление фотографии
		if ( isset($_FILES['photo']['name']) && $_FILES['photo']['tmp_name'] != "" ) {

			// Записываем параметры изображения в переменные
			$fileName = $_FILES['photo']['name'];
			$fileTmpLoc = $_FILES['photo']['tmp_name'];
			$fileType = $_FILES['photo']['type'];
			$fileSize = $_FILES['photo']['size'];
			$fileErrorMsg = $_FILES['photo']['error'];
			$kaboom = explode(".", $fileName);
			$fileExt = end($kaboom);

			// Проверяем свойства на разные условия (действительно ли загружается файл, а не что-то иное)
			list($width, $height) = getimagesize($fileTmpLoc);
			if ( $width < 10 || $height < 10 ) {
				$errors[] = ['title' => 'Изображение не имеет размеров. Загрузите изображение побольше'];
			}

			// Если размер файла больше 5 Мб, то выводим ошибку
			if ( $fileSize > 2097152 ) {
				$errors[] = ['title' => 'Файл изображения не должен быть больше 2 Мб'];
			}

			// Если формат файла не соответствует заданным типам, то выводим ошибку
			if ( !preg_match("/\.(gif|jpg|jpeg|png)$/i", $fileName) ) {
				$errors[] = [
					'title' => 'Неверный формат файла',
					'desc'	=> '<p>Файл изображения должен быть в формате jpg, jpeg или png</p>'
				];
			}

			// Ошибка при загрузке файла
			if ( $fileErrorMsg == 1 ) {
				$errors[] = ['title' => 'При загрузке изображения произошла ошибка. Попробуйте еще раз'];
			}

			// Перемещаем загруженный файл в нужную директорию
			$db_file_name = rand(100000000000,999999999999) . "." . $fileExt;
			$photoFolderLocation = ROOT . 'usercontent/about/';
			$uploadfile = $photoFolderLocation . $db_file_name;
			$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

			// Если изображение загружено ранее, то удаляем его
			$photo = $about->photo;

			if ( $photo != "") {
				$picurl = $photoFolderLocation . $photo;

				if ( file_exists($picurl) ) {
					unlink($picurl);
				}
			}

			if ( $moveResult != true ) {
				$errors[] = ['title' => 'Ошибка при загрузке файла'];
			}

			include_once( ROOT . "libs/image_resize_imagick.php");

			$target_file = $photoFolderLocation . $db_file_name;
			$wmax = 222;
			$hmax = 222;
			$img = createThumbnail($target_file, $wmax, $hmax);
			$img->writeImage($target_file);
			// записываем файл в БД
			$about->photo = $db_file_name;
		}

		R::store($about);
		header('Location: ' . HOST . "about");
		exit();
	}
}

// Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/about/edit-text.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

 ?>