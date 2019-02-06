<?php if ( $_GET['result'] == 'catCreated' ) { ?>
	<div class="notification__title notification--success mb-30" data-notify-hide>
		Категория успешно добавлена
	</div>
<?php } ?>

<?php if ( $_GET['result'] == 'catUpdated' ) { ?>
	<div class="notification__title notification--success mb-30" data-notify-hide>
		Категория успешно обновлена
	</div>
<?php } ?>

<?php if ( $_GET['result'] == 'catDeleted' ) { ?>
	<div class="notification__title mb-30" data-notify-hide>
		Категория успешно удалена
	</div>
<?php } ?>

<?php if ( $_GET['result'] == 'catCreated' ) { ?>
	<div class="notification__title notification--error mb-30" data-notify-hide>
		Категория c таким названием уже существует
	</div>
<?php } ?>