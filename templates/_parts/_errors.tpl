<?php foreach ($errors as $error) {
	
	if ( count($error) == 1 ) { ?>
		<div class="notification__title notification--error mt-20">
			<?=$error['title']?>
		</div>

<?php	} else if ( count($error) == 2 ) { ?>
		<div class="notification__title notification--error notification--with-description mt-10">
			<?=$error['title']?>
		</div>
		<div class="notification__description">
			<?=$error['desc']?>
		</div>

<?php	}

}

?>