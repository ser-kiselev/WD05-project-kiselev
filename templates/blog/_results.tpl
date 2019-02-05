<?php if ( $_GET['result'] == 'postDeleted' ) { ?>
	<div class="notification__title notification mb-30" data-notify-hide>
		Пост был удален
	</div>
<?php } ?>

<?php if ( $_GET['result'] == 'postCreated' ) { ?>
	<div class="notification__title notification--success mb-30" data-notify-hide>
		Новый пост добавлен
	</div>
<?php } ?>

<?php if ( $_GET['result'] == 'postUpdated' ) { ?>
	<div class="notification__title notification mb-30" data-notify-hide>
		Пост отредактирован
	</div>
<?php } ?>

