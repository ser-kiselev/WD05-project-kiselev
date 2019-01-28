<div class="container pb-120 pt-80 pl-0 pr-0">
	<div class="row">
		<div class="col-10 offset-1">
			<h1 class="title-general mt-0 mb-0">Редактировать профиль</h1>

			<?php require ROOT . "templates/_parts/_errors.tpl" ?>

			<form enctype="multipart/form-data" class="mt-35" action="<?=HOST?>profile-edit" method="POST">
				<div class="user-edit-wrapper">
					<div class="user-edit-name"><label class="label" for="userEditName">Имя</label>
						<input class="input" name="name" id="userEditName" type="text" placeholder="Введите имя" value="<?=$currentUser->name?>" />
					</div>
					<div class="user-edit-lastname mt-30"><label class="label" for="userEditLastname">Фамилия</label>
						<input class="input" name="secondname" id="userEditLastname" type="text" placeholder="Введите фамилию" value="<?=$currentUser->secondname?>" />
					</div>
					<div class="user-edit-email mt-30"><label class="label" for="userEditEmail">Email</label>
						<input class="input" name="email" id="userEditEmail" type="email" placeholder="Введите email" value="<?=$currentUser->email?>" />
					</div>
				</div>
				<div class="user-edit-foto mt-30">
					<section class="upload-file">
						<h6 class="upload-file__title">Фотография</h6>
						<p class="upload-file__description">Изображение jpg, gif или png, рекомендуемый размер 222x222 пикселей, и весом до 2Мб.</p>
						<input class="input-file" type="file" name="avatar" id="upload-file" accept="image/jpeg,image/png,image/gif,image/jpg" />
						<label class="input-file-mark" for="upload-file">Выбрать файл</label>
						<span>Файл не выбран</span>
					</section>
				</div>
				<div class="user-edit-wrapper mt-30">
					<div class="user-edit-land"><label class="label" for="userEditLand">Страна</label>
						<input class="input" name="country" id="userEditLand" type="text" placeholder="Введите страну" value="<?=$currentUser->country?>" />
					</div>
					<div class="user-edit-city mt-30"><label class="label" for="userEditCity">Город</label>
						<input class="input" name="city" id="userEditCity" type="text" placeholder="Введите город" value="<?=$currentUser->city?>" />
					</div>
					<div class="user-edit-buttons mt-30">
						<input class="button button-save" type="submit" name="profile-update" value="Сохранить" />
						<a href="<?=HOST?>profile" class="button">Отмена</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>