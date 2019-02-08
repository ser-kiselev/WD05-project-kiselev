<?php 

require "config.php";
require "db.php";
require "libs/functions.php";
session_start();

// -------------------  РОУТЕР  ---------------------
$uri = $_SERVER['REQUEST_URI'];
$uri = rtrim($uri, "/");
$uri = filter_var($uri, FILTER_SANITIZE_URL);
$uri = substr($uri, 1);
$uri = explode('?', $uri);

switch ( $uri[0] ) {
	case '':
		require ROOT . "modules/main/index.php";
		break;

	// ПОЛЬЗОВАТЕЛИ --------------------------------------
	case 'login':
		require ROOT . "modules/login/login.php";
		break;

	case 'registration':
		include ROOT . "modules/login/registration.php";
		break;

	case 'logout':
		include ROOT . "modules/login/logout.php";
		break;

	case 'lost-password':
		include ROOT . "modules/login/lost-password.php";
		break;

	case 'set-new-password':
		include ROOT . "modules/login/set-new-password.php";
		break;

	case 'set-new-password-error':
		include ROOT . "modules/login/set-new-password-error.php";
		break;

	case 'profile':
		include ROOT . "modules/profile/index.php";
		break;

	case 'profile-edit':
		include ROOT . "modules/profile/edit.php";
		break;

	// -------------------------------------------

	case 'about':
		include "modules/about/index.php";
		break;

	// КОНТАКТЫ

	case 'contacts':
		include "modules/contacts/index.php";
		break;

	case 'contacts-edit':
		include "modules/contacts/edit.php";
		break;

	case 'messages':
		include "modules/contacts/messages.php";
		break;

	case 'message-delete':
		include "modules/contacts/message-delete.php";
		break;

	// БЛОГ --------------------------------------

	case 'blog':
		include "modules/blog/index.php";
		break;

	case 'blog/post-new':
		include "modules/blog/post-new.php";
		break;

	case 'blog/post-edit':
		include "modules/blog/post-edit.php";
		break;

	case 'blog/post-delete':
		include "modules/blog/post-delete.php";
		break;

	case 'blog/post':
		include "modules/blog/post.php";
		break;

	// Категории
	case 'blog/categories':
		include "modules/categories/all.php";
		break;

	case 'blog/category-new':
		include "modules/categories/new.php";
		break;

	case 'blog/category-edit':
		include "modules/categories/edit.php";
		break;

	case 'blog/category-delete':
		include "modules/categories/delete.php";
		break;

	// -------------------------------------------

	default:
		echo "404 and Main page";
		break;
}

 ?>