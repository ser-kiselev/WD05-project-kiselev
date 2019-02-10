<?php 

$sqlWork = '
		SELECT works.id, works.title, works.description, works.result, works.technology,  works.author_id, works.date_time, works.github_link, works.work_img, works.project_link, works.cat,
			users.name, users.secondname,
		    categories.cat_title 
		FROM `works` 
		LEFT JOIN categories ON works.cat = categories.id 
		LEFT JOIN users ON works.author_id = users.id 
		WHERE works.id = ' . $_GET['id'] . ' LIMIT 1';

$work = R::getAll($sqlWork);
$work = $work[0];

$title = $work['title'];

// Готовим контент для центральной части
ob_start();
if ( isAdmin() ) {
	include ROOT . "templates/_parts/_admin-panel.tpl";
}

include ROOT . "templates/portfolio/portfolio.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

 ?>