<div class="sticky-footer-content">
	<div class="container add-works pl-0 pr-0 pt-80 pb-120">
		<div class="row ml-0 mr-0">
			<div class="col-10 offset-1 pl-0 pr-0">
				<div class="add-works__title">
					<h1 class="title-general mt-0 mb-0">Добавить работу</h1>
				</div>

				<?php require ROOT . "templates/_parts/_errors.tpl" ?>

				<form action="<?=HOST?>portfolio-new" method="POST" class="add-works__form mt-40" enctype="multipart/form-data">
					<div class="add-works__form-item mb-30">
						<label class="label" for="field-work-name">Название</label>
						<input class="input" name="workTitle" id="field-work-name" type="text" placeholder="Введите название работы" />
					</div>
					<div class="category mt-30">
						<label class="label">Категория</label>
						<div class="category_select mt-15">
							<select name="workCat">
								<?php foreach ($cats as $cat) { ?>
									<option value="<?=$cat['id']?>"><?=$cat['cat_title']?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="add-works__form-item mb-30">
						<section class="upload-file">
							<h6 class="upload-file__title">Изображение</h6>
							<p class="upload-file__description">Изображение jpg или png, рекомендуемая ширина 945px и больше, высота от 400px и более, вес до 2Мб.</p><input class="input-file" type="file" name="workImg" id="upload-file" data-multiple-caption="{count}" /><label class="input-file-mark" for="upload-file">Выбрать файл</label><span>Файл не выбран</span>
						</section>
					</div>
					<div class="add-works__form-item mb-30">
						<label class="label" for="description-work">Содержание</label>
						<div class="add-works__form-description mt-20">
							<textarea class="textarea" name="workDescription" id="ckEditor" placeholder="Введите описание"></textarea>
						</div>

						<?php include_once ROOT . "templates/_parts/_ckeditorConnect.tpl" ?>
					</div>
					<div class="add-works__form-item mb-30">
						<label class="label" for="result-work">Результат</label>
						<textarea class="textarea" name="workResult" id="result-work" placeholder="Введите описание"></textarea>
					</div>
					<div class="add-works__form-item mb-30">
						<label class="label" for="tech-for-work">Технологии</label>
						<textarea class="textarea" name="workTechnology" id="ckEditor" placeholder="Введите описание"></textarea>
					</div>
					<div class="row ml-0 mr-0">
						<div class="col-3 no-paddings mr-30">
							<label class="label" for="field-link-project">Ссылка на проект</label>
							<input class="input" name="linkProject" id="field-link-project" type="url" placeholder="Введите ссылку" />
						</div>
						<div class="col-3 no-paddings">
							<label class="label" for="link-on-github">Ссылка на GitHub</label>
							<input class="input" name="linkGithub" id="link-on-github" type="url" placeholder="Введите ссылку" />
						</div>
					</div>
					<div class="row ml-0 mr-0 mt-30">
						<input class="button button-save mr-20" type="submit" name="newWork" value="Сохранить" />
						<a href="<?=HOST?>portfolio" class="button">Отмена</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>