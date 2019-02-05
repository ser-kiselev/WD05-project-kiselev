<div class="container pl-0 pr-0 pt-80 pb-120">
	<div class="row m-0">
		<div class="col-10 offset-1 p-0">
			<div class="add-post-content">
				<h1 class="title-general mt-0 mb-0">Добавить пост</h1>

				<?php require ROOT . "templates/_parts/_errors.tpl" ?>
				
				<form action="<?=HOST?>blog/post-new" method="POST" enctype="multipart/form-data" novalidate>
					<div class="add-post-content__name mt-40"><label class="label" for="postTitle">Название</label>

						<div id="enterPostTitle" class="notification__title notification--error mt-10 mb-10 hidden">Введите название поста</div>

						<input id="addPostName" class="input" name="postTitle" type="text" placeholder="Введите название поста" />
					</div>

					<div class="category mt-30">
						<label class="label">Категория</label>
						<div class="category_select mt-15">
							<select name="postCat">
								<?php foreach ($cats as $cat) { ?>
									<option value="<?=$cat['id']?>"><?=$cat['cat_title']?></option>
								<?php } ?>
							</select>
						</div>
					</div>

					<div class="add-post-content__img mt-30">
						<section class="upload-file">
							<h6 class="upload-file__title">Изображение</h6>
							<p class="upload-file__description">
							Изображение jpg, jpeg или png. Рекомендуемый размер: ширина - 920px, высота - от 400px. Вес до 5Мб.</p>
							
							<input class="input-file" type="file" name="postImg" id="upload-file" data-multiple-caption="{count}" accept="image/jpeg,image/png,image/jpg" /><label class="input-file-mark" for="upload-file">Выбрать файл</label><span>Файл не выбран</span>
						</section>
					</div>
					<div class="add-post-content__main mt-30"><label class="label" for="postText">Содержание</label>
					</div>
					<div class="add-post-content__main mt-20">

						<div id="enterPostText" class="notification__title notification--error mt-10 mb-10 hidden">Введите текст поста</div>

						<textarea id="ckEditor" class="textarea" name="postText" placeholder="Введите текст поста"></textarea>

						<?php include_once ROOT . "templates/_parts/_ckeditorConnect.tpl" ?>
					</div>
					<div class="add-post-content__submit mt-30">
						<input id="newPostSubmit" class="button button-save mr-20" type="submit" name="postNew" value="Сохранить" />
						<a class="button" href="<?=HOST?>blog">Отмена</a>
					</div>
				</form>

			</div>
		</div>
	</div>
</div>
