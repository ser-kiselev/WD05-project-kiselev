<?php 

if ( !isAdmin() ) {
	header('Location: ' . HOST);
	die();
}

$title = "Редактировать работу";
$work = R::load('works', $_GET['id']);
$cats = R::find('categories', 'ORDER BY cat_title ASC');

if ( isset($_POST['workUpdate']) ) {
	
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

		$work->title = htmlentities($_POST['workTitle']);
		$work->cat = htmlentities($_POST['workCat']);
		$work->description = $_POST['workDescription'];
		$work->result = $_POST['workResult'];
		$work->technology = $_POST['workTechnology'];
		$work->projectLink = $_POST['linkProject'];
		$work->githubLink = ($_POST['linkGithub']);
		$work->authorId = $_SESSION['logged_user']['id'];
		$work->updateTime = R::isoDateTime();

		// Добавление изображения
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

			// Если изображение загружено ранее, то удаляем его
			$workImg = $work->work_img;

			if ( $workImg != "") {
				$picurl = $workImgFolderLocation . $workImg;

				if ( file_exists($picurl) ) {
					unlink($picurl);
				}

				$picurl320 = $workImgFolderLocation . '320-' . $workImg;
				if ( file_exists($picurl320) ) {
					unlink($picurl320);
				}
			}

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
		header('Location: ' . HOST . "portfolio?result=workUpdated");
		exit();
	}
}

if ( isset($_POST['removeImage']) ) {
	
	$workImg = $work->work_img;
	$workImgFolderLocation = ROOT . 'usercontent/blog/';	
	$picurl = $workImgFolderLocation . $workImg;
	$picurl320 = $workImgFolderLocation . '320-' . $workImg;

	if ( file_exists($picurl) ) {
		unlink($picurl);
	}

	if ( file_exists($picurl320) ) {
		unlink($picurl320);
	}

	$post->post_img = NULL;
	$post->post_img_small = NULL;
	R::store($post);
	header('Location: ' . HOST . "blog/post-edit?id=$post->id");
}

// Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/portfolio/portfolio-edit.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

 ?>