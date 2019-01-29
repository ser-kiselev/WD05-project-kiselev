<?php foreach ($success as $success_item) {
	
	if ( count($success_item) == 1 ) { ?>
		<div class="notification__title notification--success">
			<?=$success_item['title']?>
		</div>

<?php	} else if ( count($success_item) == 2 ) { ?>
		<div class="notification__title notification--success notification--with-description">
			<?=$success_item['title']?>
		</div>
		<div class="notification__description">
			<?=$success_item['desc']?>
		</div>

<?php	}

}

?>