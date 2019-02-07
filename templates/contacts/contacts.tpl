<div class="container pt-55 pb-80">
	<div class="row">
		<div class="col-12 clearfix mb-30">
			<a class="button float-right" href="<?=HOST?>messages">Сообщения</a>
			<a class="button button-edit float-right mr-20" href="<?=HOST?>contacts-edit">Редактировать</a>
		</div>
		<div class="col-5">
			<h1 class="title-general mb-30">Контакты</h1>
			<div class="row mb-15">
				<div class="col-6 contacts-category">
					<p>Email</p>
				</div>
				<div class="col-6 link-box-info">
					<p><a class="link" href="#!">webdev-ninja@mail.ru</a></p>
				</div>
			</div>
			<div class="row mb-15">
				<div class="col-6 contacts-category">
					<p>Skype</p>
				</div>
				<div class="col-6 link-box-info">
					<p><a class="link" href="#!">webdev-ninja</a></p>
				</div>
			</div>
			<div class="row mb-15">
				<div class="col-6 contacts-category">
					<p>Социальные сети</p>
				</div>
				<div class="col-6 link-box-info">
					<p><a class="link link--bold" href="#!">Профиль Вконтакте</a></p>
					<p><a class="link link--bold" href="#!">Профиль Facebook</a></p>
				</div>
			</div>
			<div class="row mb-15">
				<div class="col-6 contacts-category">
					<p>Телефон</p>
				</div>
				<div class="col-6 info">
					<p>+595-456-123</p>
				</div>
			</div>
			<div class="row mb-15">
				<div class="col-6 contacts-category">
					<p>Адрес</p>
				</div>
				<div class="col-6 info">
					<p>Россия, Московская обл. <br /> г. Зеленоград</p>
				</div>
			</div>
		</div>
		
		<div class="col-4 offset-1">
			<div class="title-general mb-40">Связаться со мной</div>

			<form class="feedback-form" action="#!">
				<input class="input" name="name-user" type="text" placeholder="Введите имя" />
				<input class="input" name="email-user" type="email" placeholder="Email" />
				<textarea class="textarea mb-20" name="user-message" placeholder="Сообщение"></textarea>
				<section class="upload-file">
					<h6 class="upload-file__title">Прикрепить файл</h6>
					<p class="upload-file__description">jpg, png, pdf, doc, весом до 2Мб.</p><input class="input-file" type="file" name="upload-file" id="upload-file" data-multiple-caption="{count}" /><label class="input-file-mark input-file-mark--rounded" for="upload-file">Выбрать файл</label><span>Файл не выбран</span>
				</section><input class="button button-save mt-20" type="submit" name="save-button" value="Отправить" />
			</form>

		</div>
	</div>
</div>


<div class="geolocation" id="map"></div>
<script src="js/googlemap.js"></script>