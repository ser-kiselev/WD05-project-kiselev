<?php 

require "config.php";
require "db.php";

// РОУТЕР
$uri = $_SERVER['REQUEST_URI'];
$uri = rtrim($uri, "/");
$uri = filter_var($uri, FILTER_SANITIZE_URL);
$uri = substr($uri, 1);
$uri = explode('?', $uri);

switch ( $uri[0] ) {
	case '':
		include "modules/main/index.php";
		break;
	case 'about':
		include "modules/about/index.php";
		break;
	case 'contacts':
		include "modules/contacts/index.php";
		break;
	case 'blog':
		include "modules/blog/index.php";
		break;
	default:
		echo "404 and Main page";
		break;
}



 ?>