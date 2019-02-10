<div class="container pb-120 pt-80 pl-0 pr-0">
	<div class="works-title mb-35">
		<div class="works-title-left">
			<h1 class="works-title-text"><span class="works-title-text--bold">Работы</span>, которые сделал я и моя команда</h1>
		</div>
		<?php if ( isAdmin() ) { ?>
			<div class="works-title-right"><a class="button button-edit" href="<?=HOST?>portfolio-new">Добавить работу</a></div>
		<?php } ?>
	</div>

	<div class="row ml-0 mr-0 mb-30">
		<div class="col pl-0 pr-0">
			<?php if ( isset($_GET['result']) ) {
				include ROOT . "templates/portfolio/_results.tpl";
			} ?>
		</div>
	</div>

	<div class="row ml-0 mr-0 mb-50">
		<?php foreach ($works as $work) { ?>
			<div class="col-auto pl-0 pr-0 mr-30">
				<div class="card-box card-box--height">
					<div class="card-box__img-portfolio">
						<img src="<?=HOST?>usercontent/works/<?=$work->work_img?>" />
					</div>
					<div class="card-box__title">
						<?php echo mbCutString($work->title, 47); ?>
					</div>
					<a class="button card-box--button" href="<?=HOST?>portfolio/portfolio?id=<?=$work->id?>">Смотреть кейс</a>
				</div>
			</div>
		<?php } ?>
	</div>
</div>