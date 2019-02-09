<?php 

if ( !isAdmin() ) {
	header("Location: " . HOST);
	die();
}

$title = "Редактировать – Опыт работы";
$jobs = R::find('jobs', 'ORDER BY id DESC');

if ( isset($_POST['newJob']) ) {

	if ( trim($_POST['period']) == '' ) {
		$errors[] = ['title' => 'Введите период работы'];
	}

	if ( trim($_POST['title']) == '' ) {
		$errors[] = ['title' => 'Введите должность'];
	}

	if ( empty($errors) ) {

		$job = R::dispense('jobs');
		$job->period = htmlentities($_POST['period']);
		$job->title = htmlentities($_POST['title']);
		$job->description = htmlentities($_POST['description']);
		R::store($job);
		header('Location: ' . HOST . "edit-jobs");
	}
}

// Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/about/edit-jobs.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

 ?>