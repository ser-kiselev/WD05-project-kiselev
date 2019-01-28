<?php 

$title = "Ошибка при восстановлении пароля";

// Гоговим контент для центральной части страницы
ob_start();

include ROOT . "templates/login/set-new-password-error.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/login/login-page.tpl";
include ROOT . "templates/_parts/_foot.tpl";

 ?>