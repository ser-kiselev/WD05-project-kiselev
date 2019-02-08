<div class="container pt-55 pb-80">
	<div class="row">

		<?php if ( isAdmin() ) { ?>
			<div class="col-12 clearfix mb-30">
				<a class="button float-right" href="<?=HOST?>messages">Сообщения</a>
				<a class="button button-edit float-right mr-20" href="<?=HOST?>contacts-edit">Редактировать</a>
			</div>
		<?php } ?>
		
		<div class="col-6">
			<h1 class="title-general mb-30">Контакты</h1>

			<?php function showContactsItem($name, $title) {
				global $contacts;

				if ( $contacts[$name] != "" ) { ?>
				<div class="row mb-15">
					<div class="col-6 contacts-category">
						<p><?=$title?></p>
					</div>
					<div class="col-6 link-box-info">
						<?php if ( $name == 'email' ) { ?>
							<p><a class="link" href="mailto:<?=$contacts[$name]?>" target="_blank"><?=$contacts[$name]?></a></p>
						<?php } else if ( $name == 'phone' ) { ?>
							<p><a class="link" href="tel:<?=$contacts[$name]?>" target="_blank"><?=$contacts[$name]?></a></p>
						<?php } else if ( $name == 'skype' ) { ?>
							<p><a class="link" href="skype:<?=$contacts[$name]?>?chat" target="_blank"><?=$contacts[$name]?></a></p>
						<?php } else if ( $name == 'github' ) { ?>
							<p><a class="link" href="<?=$contacts[$name]?>" target="_blank"><?=$contacts[$name]?></a></p>
						<?php } else { ?>
							<?=$contacts[$name]?>
						<?php } ?>
					</div>
				</div>
				<?php }
			} ?>

			<?php showContactsItem('name', 'Имя') ?>
			<?php showContactsItem('secondname', 'Фамилия') ?>
			<?php showContactsItem('email', 'Email') ?>
			<?php showContactsItem('skype', 'Skype') ?>
			<?php showContactsItem('github', 'Github') ?>

			<?php if ( $contacts['vk'] != "" || $contacts['fb'] != "" || $contacts['twitter'] != "" ) { ?>
				
				<div class="row mb-15">
					<div class="col-6 contacts-category">
						<p>Социальные сети</p>
					</div>
					<div class="col-6 link-box-info">
						<?php if ( $contacts['vk'] != "" ) { ?>
							<p><a class="link link--bold" href="<?=$contacts['vk']?>" target="_blank">Профиль Вконтакте</a></p>
						<?php } ?>
						
						<?php if ( $contacts['fb'] != "" ) { ?>
							<p><a class="link link--bold" href="<?=$contacts['fb']?>" target="_blank">Профиль Facebook</a></p>
						<?php } ?>

						<?php if ( $contacts['twitter'] != "" ) { ?>
							<p><a class="link link--bold" href="<?=$contacts['twitter']?>" target="_blank">Профиль Twitter</a></p>
						<?php } ?>
					</div>
				</div>
			<?php } ?>

			<?php showContactsItem('phone', 'Телефон') ?>
			<?php showContactsItem('address', 'Адрес') ?>

		</div>
		
		<div class="col-4 offset-1">
			<div class="title-general mb-40">Связаться со мной</div>

			<?php require ROOT . "templates/_parts/_errors.tpl"; ?>
			<?php require ROOT . "templates/_parts/_success.tpl"; ?>

			<form class="feedback-form" action="<?=HOST?>contacts" method="POST" enctype="multipart/form-data">
				<input class="input" name="name" type="text" placeholder="Введите имя" />
				<input class="input" name="email" type="email" placeholder="Email" />
				<textarea class="textarea mb-20" name="message" placeholder="Сообщение"></textarea>
				<section class="upload-file">
					<h6 class="upload-file__title">Прикрепить файл</h6>
					<p class="upload-file__description">jpg, png, pdf, doc, весом до 2Мб.</p><input class="input-file" type="file" name="file" id="upload-file" data-multiple-caption="{count}" /><label class="input-file-mark input-file-mark--rounded" for="upload-file">Выбрать файл</label><span>Файл не выбран</span>
				</section>
				<input class="button button-save mt-20" type="submit" name="newMessage" value="Отправить" />
			</form>

		</div>
	</div>
</div>


<div class="geolocation" id="map"></div>
<script src="js/googlemap.js"></script>