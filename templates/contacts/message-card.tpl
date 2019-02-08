<div class="user-from-messages mt-30 mb-20">
	<div class="message-user">
		<a class="button button-delete button--small-delete float-right" href="<?=HOST?>message-delete?id=<?=$message->id?>">Удалить</a>
		<div class="message-user__date mb-20">
			<?=$message->date_time?>
		</div>
		<div class="message-user-info">
			<span class="message-user-info__name">
				<?=$message->name?>
			</span>
			<a class="message-user-info__email ml-20" href="mailto:<?=$message->email?>">
				<?=$message->email?>
			</a>
		</div>
		<p class="message-user__text">
			<?=$message->message?>
		</p>
		<?php if ( $message->message_file != '' ) { ?>
			<span class="message-info-files strong">Прикрепленный файл:<a class="message-user-info-files__link ml-20" href="<?=HOST?>usercontent/upload-files/<?=$message->message_file?>" target="_blank"><?=$message->message_file_name_original?></a></span>
		<?php } ?>	
	</div>
</div>
