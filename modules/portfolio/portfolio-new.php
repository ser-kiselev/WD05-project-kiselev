<?php 

if ( !isAdmin() ) {
	header('Location: ' . HOST);
	die();
}

$title = "Добавить новую работу";
$cats = R::find('categories', 'ORDER BY cat_title ASC');

if ( isset($_POST['newWork']) ) {

	if ( trim($_POST['workTitle']) == '' && trim($_POST['workDescription']) == '' ) {
		$errors[] = ['title' => 'Введите название и содержание работы'];
	} else if ( trim($_POST['workTitle']) == '' ) {
		$errors[] = ['title' => 'Введите название работы'];
	} else if ( trim($_POST['workDescription']) == '' ){
		$errors[] = ['title' => 'Введите содержание работы'];
	} else if ( trim($_POST['workResult']) == '' ) {
		$errors[] = ['title' => 'Введите результат работы'];
	} else if ( trim($_POST['workTechnology']) == '' ) {
		$errors[] = ['title' => 'Введите технологии'];
	} else if ( trim($_POST['linkProject']) == '' ) {
		$errors[] = ['title' => 'Введите ссылку на проект'];
	}

	if ( empty($errors) ) {

		$work = R::dispense('works');
		$work->title = htmlentities($_POST['workTitle']);
		$work->cat = htmlentities($_POST['workCat']);
		$work->description = $_POST['workDescription'];
		$work->result = $_POST['workResult'];
		$work->technology = $_POST['workTechnology'];
		$work->projectLink = $_POST['linkProject'];
		$work->githubLink = ($_POST['linkGithub']);
		$work->authorId = $_SESSION['logged_user']['id'];
		$work->dateTime = R::isoDateTime();

		if ( isset($_FILES['workImg']['name']) && $_FILES['workImg']['tmp_name'] != "" ) {

			// Записываем параметры изображения в переменные
			$fileName = $_FILES['workImg']['name'];
			$fileTmpLoc = $_FILES['workImg']['tmp_name'];
			$fileType = $_FILES['workImg']['type'];
			$fileSize = $_FILES['workImg']['size'];
			$fileErrorMsg = $_FILES['workImg']['error'];
			$kaboom = explode(".", $fileName);
			$fileExt = end($kaboom);

			// Проверяем свойства на разные условия (действительно ли загружается файл, а не что-то иное)
			list($width, $height) = getimagesize($fileTmpLoc);
			if ( $width < 10 || $height < 10 ) {
				$errors[] = ['title' => 'Изображение не имеет размеров. Загрузите изображение побольше'];
			}

			// Если размер файла больше 5 Мб, то выводим ошибку
			if ( $fileSize > 5242880 ) {
				$errors[] = ['title' => 'Файл изображения не должен быть больше 5 Мб'];
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
			$workImgFolderLocation = ROOT . 'usercontent/works/';
			$uploadfile = $workImgFolderLocation . $db_file_name;
			$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

			if ( $moveResult != true ) {
				$errors[] = ['title' => 'Ошибка при загрузке файла'];
			}

			include_once( ROOT . "libs/image_resize_imagick.php");

			// Работа с большими изображениями (на странице поста)
			$target_file = $workImgFolderLocation . $db_file_name;
			$wmax = 920;
			$hmax = 620;
			$img = createThumbnailBig($target_file, $wmax, $hmax);
			$img->writeImage($target_file);
			// записываем файл в БД
			$work->workImg = $db_file_name;

			// Работа с малыми изображениями (превью поста – тумба)
			$target_file = $workImgFolderLocation . $db_file_name;
			$resized_file = $workImgFolderLocation . "320-" . $db_file_name;
			$wmax = 320;
			$hmax = 140;
			$img = createThumbnailCrop($target_file, $wmax, $hmax);
			$img->writeImage($resized_file);
			// записываем файл в БД
			$work->workImgSmall = "320-" . $db_file_name;
		}

		R::store($work);
		header('Location: ' . HOST . "portfolio?result=workCreated");
		exit();
	}
}

// Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/portfolio/portfolio-new.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

 ?>