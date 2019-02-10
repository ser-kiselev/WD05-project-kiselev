<?php if ( $_GET['result'] == 'workDeleted' ) { ?>
	<div class="notification__title notification mb-30" data-notify-hide>
		Работа удалена
	</div>
<?php } ?>

<?php if ( $_GET['result'] == 'workCreated' ) { ?>
	<div class="notification__title notification--success mb-30" data-notify-hide>
		Новая работа успешно добавлена
	</div>
<?php } ?>

<?php if ( $_GET['result'] == 'workUpdated' ) { ?>
	<div class="notification__title notification mb-30" data-notify-hide>
		Работа отредактирована
	</div>
<?php } ?>