<div class="container pb-120 pt-80 pl-0 pr-0">
	<div class="blog-title mb-40">
		<h1 class="title-general mb-0 mt-0 blog-title--color">Блог веб-разработчика</h1>
		<a class="button button-edit" href="<?=HOST?>blog/post-new">Добавить пост</a>
	</div>

	<div class="row ml-0 mr-0 mb-50">
		
		<?php foreach ($posts as $post) { ?>
			<?php include ROOT . "templates/_parts/_blog-card.tpl" ?>
		<?php } ?>

	</div>
</div>