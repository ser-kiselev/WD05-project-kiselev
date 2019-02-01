<div class="container pl-0 pr-0 pt-80 pb-120">
	<div class="row m-0">
		<div class="col-10 offset-1 p-0">
			<div class="add-post-content">
				<h1 class="title-general mt-0 mb-0">Удалить категорию</h1>

				<p>Вы действительно хотите удалить категорию <strong><?=$cat['cat_title']?></strong> с id = <?=$cat['id']?>?</p>
				
				<form action="<?=HOST?>blog/category-delete?id=<?=$cat['id']?>" method="POST" novalidate>

					<div class="add-post-content__submit mt-30">
						<input class="button button-delete mr-20" type="submit" name="catDelete" value="Удалить" />
						<a class="button" href="<?=HOST?>blog/categories">Отмена</a>
					</div>
				</form>

			</div>
		</div>
	</div>
</div>