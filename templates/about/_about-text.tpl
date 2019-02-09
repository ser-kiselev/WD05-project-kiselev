<div class="section-about-info mt-80 mb-65">
	<div class="container">
		<div class="row about-info">
			<div class="col-md-3">
				<div class="avatar">
					<?php if ( $about->photo != "") { ?>
						<img src="<?=HOST?>usercontent/about/<?=$about->photo?>" alt="<?=$about->name?>" />
					<?php } else { ?>
						<img src="<?=HOST?>templates/assets/img/placeholders/user-avatar-placeholder-big.jpg> " alt="<?=$about->name?>" />
					<?php } ?>
				</div>
			</div>
			<div class="col-md-9">
				<div class="about-info">

					<?php if ( isAdmin() ) { ?>
						<a class="button button-edit float-right" href="<?=HOST?>edit-text">Редактировать</a>
					<?php } ?>
				
					<p class="mb-15 about-info__name"><?=$about->name?></p>
					<div class="about-info-description">
						<?=$about->description?>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>