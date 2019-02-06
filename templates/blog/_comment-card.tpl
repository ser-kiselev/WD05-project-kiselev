<div class="user-comment">
	<div class="user-comment__avatar">
		<div class="avatar avatar--small">
			
			<?php if ( $comment['avatar_small'] != "") { ?>
				<img src="<?=HOST?>usercontent/avatar/<?=$comments['avatar_small']?>" alt="<?=$comment['name']?> <?=$comment['secondname']?>" />
			<?php } else { ?>
				<img src="<?=HOST?>templates/assets/img/placeholders/user-avatar-placeholder-small.jpg?>" alt="<?=$comment['name']?> <?=$comment['secondname']?>" />
			<?php } ?>

		</div>
	</div>
	<div class="user-comment-info-wrapper">
		<span class="user-comment__name">
			<?=$comment['name']?> 
			<?=$comment['secondname']?>
		</span>
		<span class="user-comment__date"><i class="far fa-clock"></i>
			<?=$comment['date_time']?>
		</span>
		<div class="user-comment__text">
			<p><?=$comment['text']?></p>
		</div>
	</div>
</div>