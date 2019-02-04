<div class="col-4 mb-30 pl-0">
	<div class="card-box">
		<div class="card-box__img-blog">

			<?php if ( $post->post_img_small != "" ) { ?>
				<img src="<?=HOST?>usercontent/blog/<?=$post->post_img_small?>" alt="<?=$post->title?>" />
			<?php } else { ?>
				<img src="<?=HOST?>usercontent/blog-no-img.jpg" alt="<?=$post->title?>" />
			<?php } ?>

		</div>
		<div class="card-box__title">
			<?php echo mbCutString($post->title, 47); ?>	
		</div>
		<a class="button card-box--button" href="<?=HOST?>blog/post?id=<?=$post->id?>">Читать</a>
	</div>
</div>