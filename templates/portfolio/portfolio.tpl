<div class="separate-work-wrapper">
	<div class="separate-work-header-bg pb-50">
		<div class="logo ml-50 mb-120">
			<div class="logo__wrapper">
				<div class="logo__img logo__img--dark mr-15"><i class="far fa-paper-plane mr-0"></i></div>
				<div class="logo__title logo__title--dark">Digital Lifestyle</div>
			</div>
			<div class="logo__description logo__description--dark ml-50">Сайт IT специалиста</div>
		</div>
		
		<div class="container">
			<div class="separate-work-head">
				<div class="row no-gutters justify-content-between">
					<div class="col offset-1">
						<h1 class="title-general separate-work-title--size"><?=$work['title']?></h1>
					</div>

					<?php if ( isAdmin() ) { ?>
						<div class="col-auto text-right">
							<a class="button button-edit mr-10" href="<?=HOST?>portfolio/portfolio-edit?id=<?=$work['id']?>">Редактировать</a>
							<a class="button button-delete" href="<?=HOST?>blog/portfolio-delete?id=<?=$work['id']?>">Удалить</a>
						</div>
					<?php } ?>
				</div>
			</div>
			<div class="separate-work-info mt-10">
				<div class="row">
					<div class="col-8 offset-1">
						<span class="separate-work-info__author mr-20"><?=$work['name']?> <?=$work['secondname']?></span>
						<a class="separate-work-info__category mr-20" href="#"><?=$work['cat_title']?></a>
						<span class="separate-work-info__date">
						<? echo rus_date("j F Y H:i", strtotime($work['date_time'])); ?>
						</span>
					</div>
				</div>
			</div>
			<div class="separate-work-image mt-55">
				<div class="row">
					<div class="col-10 offset-1">
						<div class="separate-work-image-preview">
							<img src="<?=HOST?>usercontent/works/<?=$work['work_img']?>" alt="Сайт компании" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container pb-120">
		<div class="separate-work-description-wrapper">
			<div class="row">
				<div class="col-5 offset-1">
					<div class="separate-work-description">
						<h3 class="title-3 mt-0 mb-20 strong">Кратко о проекте</h3>
						<div><?=$work['description']?></div>
					</div>
					<div class="separate-work-result">
						<h3 class="title-3 mb-20 mt-20 strong">Результат</h3>
						<p><?=$work['result']?></p>
					</div>
				</div>
				<div class="col-5">
					<div class="separate-work-technologies">
						<h3 class="title-3 mb-20 mt-0 strong">Технологии</h3>
						<p><?=$work['technology']?></p>
					</div>
					<div class="separate-work-link-project mb-35">
						<h3 class="title-3 mb-20 mt-25 strong">Ссылка на проект</h3><a class="separate-work-link-project__link" href="#"><?=$work['project_link']?></a>
					</div>
					<?php if ( $work['project_link'] != "" ) { ?>
						<div class="separate-work-link-github">
							<h3 class="title-3 title-3 mb-20 mt-0 strong">Код на github</h3><a class="separate-work-link-github__link" href="#"><?=$work['github_link']?></a>
						</div>
					<?php } ?>
				</div>
			</div>
		</div>
		<div class="separate-work-pagination-wrapper mt-45">
			<div class="row">
				<div class="col-10 offset-1">
					<div class="separate-work-pagination"><a class="button button-previous button-work-pagination-prev" href="#">Все работы <span class="button__icon button__icon--mright float-left"><i class="mr-0 fas fa-arrow-left"></i></span></a><a class="button button-next button-work-pagination-next" href="#">Следующая работа <span class="button__icon"><i class="mr-0 fas fa-arrow-right"></i></span></a></div>
				</div>
			</div>
		</div>
	</div>
</div>