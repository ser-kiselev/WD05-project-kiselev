<div class="container pt-80 pb-120">
	<div class="row">
		<div class="col-10 offset-1">
			<div class="post">
				<div class="post-head">
					<div class="row">
						<div class="col">
							<h1 class="title-general mb-0 mt-0"><?=$post['title']?></h1>
						</div>

						<?php if ( isAdmin() ) { ?>
							<div class="col-auto text-right">
								<a class="button button-edit mr-10" href="<?=HOST?>blog/post-edit?id=<?=$post['id']?>">Редактировать</a>
								<a class="button button-delete" href="<?=HOST?>blog/post-delete?id=<?=$post['id']?>">Удалить</a>
							</div>
						<?php } ?>
						
					</div>
				</div>
			</div>
			<div class="post-info">
				<div class="post-info__author">
					<?=$post['name']?> <?=$post['secondname']?>
				</div>
				<div class="post-info__topic">
					<a class="postlink" href="#"><?=$post['cat_title']?></a>
				</div>

				<?php if ( $post['update_time'] != "" ) { ?>
					<div class="post-info__date">
						<? echo rus_date("j F Y H:i", strtotime($post['date_time'])); ?>
					</div>
					<div class="post-info__date post-info__date--update">
						<span>Обновлено: </span>
						<? echo rus_date("j F Y H:i", strtotime($post['update_time'])); ?>
					</div>
				<?php } else { ?>
					<div class="post-info__date">
						<? echo rus_date("j F Y H:i", strtotime($post['date_time'])); ?>
					</div>
				<?php } ?>

				<?php if ( count($comments) > 0 ) { ?>
					<div class="post-info__comments">
						<a class="postlink" href="#comments"><?php commentNumber( count($comments) ); ?></a>
					</div>
				<?php } ?>

			</div>
			<div class="post-img">

				<?php if ( $post['post_img'] != "" ) { ?>
					<img src="<?=HOST?>usercontent/blog/<?=$post['post_img']?>" alt="<?=$post['title']?>" />
				<?php } else { ?>
					<img src="<?=HOST?>usercontent/blog-no-img-big.jpg" alt="<?=$post['title']?>" />
				<?php } ?>

				
			</div>
			<div class="post-content mb-25">
				<?=$post['text']?>
			</div>
			<div class="post-buttons-nav mb-25"><a class="button button-previous" href="#">Назад <span class="button__icon button__icon--mright float-left"><i class="mr-0 fas fa-arrow-left"></i></span></a><a class="button button-next" href="#">Вперед <span class="button__icon"><i class="mr-0 fas fa-arrow-right"></i></span></a></div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-10 offset-1">
			<div id="comments" class="user-comments-wrapper mt-20 mb-25">
				
				<!-- Вывод комментариев -->
				<?php if ( count($comments) > 0 ) { ?>
					<div class="title-2"><?php commentNumber( count($comments) ); ?></div>

					<?php foreach ($comments as $comment) {
						include ROOT . "templates/blog/_comment-card.tpl";
					} ?>
				<?php } ?>

			</div>

			<?php include ROOT . "templates/blog/_add-comment-form.tpl"; ?>

		</div>
	</div>
</div>