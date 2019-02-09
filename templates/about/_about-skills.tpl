<?php function showIndicator($title, $value, $color = '') { 
	$indicatorWidth = 126;
	$radius = ($indicatorWidth - 20) / 2;
	$perimeter = 2 * pi() * $radius;
	$offset = $perimeter * (1 - intval($value)/100);
	?>
	<div class="indicator">
		<svg class="svg-box" width="<?=$indicatorWidth?>" height="<?=$indicatorWidth?>"> 
			<circle class="circle circle__bg val-100" r="<?=$radius?>" cx="<?=$indicatorWidth/2?>" cy="<?=$indicatorWidth/2?>"></circle>
			<circle 
					<?php if ( $color == '' ) { ?>
						class="circle"
					<?php } else { ?>
						class="circle circle--<?=$color?>"
					<?php } ?>
						stroke-dasharray="<?=$perimeter?>"
						stroke-dashoffset="<?=$offset?>"
						r="<?=$radius?>" 
						cx="<?=$indicatorWidth/2?>" cy="<?=$indicatorWidth/2?>"></circle>
		</svg>
		<div class="indicator__text"><?=$title?></div>
	</div>
<?php } ?>

<div class="section-indikators pt-50">
	<div class="container">
		<div class="row indikators-block">
			<div class="offset-md-3 col-md-7">
				<h2 class="title-general mb-10 color-width">Технологии</h2>
				<p class="indikators-block__text mt-0 mb-0">Которые использую в работе</p>
			</div>
			<?php if ( isAdmin() ) { ?>
				<div class="col-md-2">
					<a class="button button-edit" href="<?=HOST?>edit-skills">Редактировать</a>
				</div>
			<?php } ?>
		</div>
		<div class="row">
			<div class="col-md-2 list-technology">
				<span class="list-technology__text">Frontend</span>
				<span class="list-technology__text">Backend</span>
				<span class="list-technology__text">Workflow</span>
			</div>
			<div class="col-md-10">
				<div class="container-indicators">
					<div class="row ml-90 pt-40">
						<?php showIndicator('HTML', $skills['html'], 'green') ?>
						<?php showIndicator('CSS3', $skills['css'], 'green') ?>
						<?php showIndicator('JS', $skills['js'], 'green') ?>
						<?php showIndicator('jQuery', $skills['jquery'], 'green') ?>
					</div>

					<div class="row ml-90 pt-40">
						<?php showIndicator('PHP', $skills['php'], 'blue') ?>
						<?php showIndicator('MySql', $skills['jquery'], 'blue') ?>
					</div>

					<div class="row ml-90 pt-40">
						<?php showIndicator('Git', $skills['git'], 'yellow') ?>
						<?php showIndicator('Gulp', $skills['gulp'], 'yellow') ?>
						<?php showIndicator('Npm', $skills['npm'], 'yellow') ?>
						<?php showIndicator('Yarn', $skills['yarn'], 'yellow') ?>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>