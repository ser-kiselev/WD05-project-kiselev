<div class="about-me-edit">
	<div class="container">
		<div class="row">
			<div class="col-md-10 offset-md-1">
				<h1 class="title-general edit-title--color mt-0 mb-35">Редактировать - Обо Мне</h1>

				<?php require ROOT . "templates/_parts/_errors.tpl"; ?>
				
				<form class="about-me-edit-info-form" id="about-me-edit-info" action="<?=HOST?>edit-text" method="POST" enctype="multipart/form-data" novalidate>
					<div class="edit-name">
						<label class="label" for="editFullName">Имя, фамилия</label>
						<input class="input" name="name" id="editFullName" type="text" placeholder="Введите имя и фамилию" value="<?=$about->name?>" />
					</div>
					
					<div class="upload-photo mt-30 mb-35">
						<section class="upload-file">
							<h6 class="upload-file__title">Фотография</h6>
							<p class="upload-file__description">Изображение jpg или png, рекомендуемый размер 205x205 пикселей, и весом до 2Мб.</p>
							<input class="input-file" type="file" name="photo" id="upload-file" data-multiple-caption="{count}" accept="image/jpeg,image/png,image/jpg" />
							<label class="input-file-mark" for="upload-file">Выбрать файл</label><span>Файл не выбран</span>
						</section>
						<div class="upload-photo__result">
							<?php if ( $about->photo != "") { ?>
								<img src="<?=HOST?>usercontent/about/<?=$about->photo?>" alt="<?=$about->name?>" />
							<?php } else { ?>
								<img src="<?=HOST?>templates/assets/img/placeholders/user-avatar-placeholder-small.jpg> " alt="<?=$about->name?>" />
							<?php } ?>
						</div>
					</div>
					<div class="edit-information">
						<label class="label" for="about-me-edit-info">Информация на главной</label>

						<div class="edit-information-description mt-20">
							<textarea id="ckEditor" class="textarea edit-information__textarea" name="description" placeholder="Напишите информацию о себе"><?=$about->description?></textarea>
						</div>

						<?php include_once ROOT . "templates/_parts/_ckeditorConnect.tpl" ?>

					</div>
					<div class="about-me-edit-buttons">
						<input class="button button-save mr-20" type="submit" name="textUpdate" value="Сохранить" />
						<a href="<?=HOST?>about" class="button">Отмена</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>