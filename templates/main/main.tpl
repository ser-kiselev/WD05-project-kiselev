<div class="main-wrapper">
	<?php require_once ROOT . "templates/about/_about-text.tpl"; ?>

	<div class="line"></div>

	<div class="new-works container section">
		<div class="row">
			<div class="col-md-12">
				<h2 class="title-2 title-1--weight mb-30"> Новые <span class="title-1--underline">работы</span></h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="card-box card-box--height">
					<div class="card-box__img-portfolio"><img src="../img/blog/ui-portfolio-preview.jpg" /></div>
					<div class="card-box__title">Верстка Landing Page</div><a class="button card-box--button" href="#">Смотреть кейс</a>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card-box card-box--height">
					<div class="card-box__img-portfolio"><img src="../img/blog/ui-portfolio-preview.jpg" /></div>
					<div class="card-box__title">Верстка Landing Page</div><a class="button card-box--button" href="#">Смотреть кейс</a>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card-box card-box--height">
					<div class="card-box__img-portfolio"><img src="../img/blog/ui-portfolio-preview.jpg" /></div>
					<div class="card-box__title">Верстка Landing Page</div><a class="button card-box--button" href="#">Смотреть кейс</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="blog-entries container">
		<div class="row">
			<div class="col-md-12">
				<h2 class="title-2 title-1--weight"> Новые записи в <a href="<?=HOST?>blog" class="title-1--underline">блоге</a></h2>
			</div>
		</div>
		<div class="row">
			<?php foreach ($posts as $post) { ?>
				<?php include ROOT . "templates/_parts/_blog-card.tpl" ?>
			<?php } ?>
		</div>
	</div>
</div>