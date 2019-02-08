<div class="sticky-footer-content">
	<div class="container content--padding">
		<div class="row">
			<div class="col-10 offset-1">
				<h1 class="title-general contacts-messages-title--color mt-0 mb-0">Сообщения от посетителей</h1>

				<?php if ( isset($_GET['result']) ) {
					include ROOT . "templates/contacts/_results.tpl";
				} ?>
				
				<?php foreach ($messages as $message) { ?>
					<?php include ROOT . "templates/contacts/message-card.tpl" ?>
				<?php } ?>
			</div>
		</div>
	</div>
</div>