<?php 

if ( !isAdmin() ) {
	header("Location: " . HOST);
	die();
}

$title = "Редактировать – Технологии";
$skills = R::load('skills', 1);

if ( isset($_POST['skillsUpdate']) ) {

	$skills->html = $_POST['html'];
	$skills->css = $_POST['css'];
	$skills->js = $_POST['js'];
	$skills->jquery = $_POST['jquery'];
	$skills->php = $_POST['php'];
	$skills->mysql = $_POST['mysql'];
	$skills->git = $_POST['git'];
	$skills->gulp = $_POST['gulp'];
	$skills->npm = $_POST['npm'];
	$skills->yarn = $_POST['yarn'];

	R::store($skills);
	header('Location: ' . HOST . "about");
	exit();
}

// Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/about/edit-skills.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

 ?>