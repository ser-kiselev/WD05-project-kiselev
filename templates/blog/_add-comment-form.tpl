<?php if ( isLoggedIn() ) { ?>

	<h2 class="title-2 m-0 mb-15">Оставить комментарий</h2>
	<div class="comments-submit">
		<div class="avatar avatar--small">	
			<?php if ( $_SESSION['logged_user']['avatar_small'] != "") { ?>
				<img src="<?=HOST?>usercontent/avatar/<?=$_SESSION['logged_user']['avatar_small']?>" alt="<?=$_SESSION['logged_user']['name']?> <?=$_SESSION['logged_user']['secondname']?>" />
			<?php } else { ?>
				<img src="<?=HOST?>templates/assets/img/placeholders/user-avatar-placeholder-small.jpg?>" alt="<?=$_SESSION['logged_user']['name']?> <?=$_SESSION['logged_user']['secondname']?>" />
			<?php } ?>
		</div>

		<form id="commentForm" class="comments-form" method="POST" action="<?=HOST?>blog/post?id=<?=$post['id']?>">
			<b class="comments__author">
				<?=$_SESSION['logged_user']['name']?> 
				<?=$_SESSION['logged_user']['secondname']?>
			</b>
			<div class="notification">
				<div id="enterComment" class="notification__title notification--error hidden">Комментарий не может быть пустым</div>
			</div>

			<?php require ROOT . "templates/_parts/_errors.tpl" ?>

			<textarea id="userComment" class="textarea" name="commentText" placeholder="Присоединиться к обсуждению..."></textarea>

			<input id="commentSubmit" class="button mt-10" type="submit" name="addComment" value="Опубликовать" data-add-comment />
		</form>
	</div>
<?php } else { ?>
	<!-- Если пользователь не авторизован на сайте -->
	<div class="comments-unregistered">
		<p class="comments-unregistered__note"><a class="link" href="<?=HOST?>login">Войдите</a> или <a class="link" href="<?=HOST?>registration">Зарегистрируйтесь</a> чтобы оставить комментарий</p>
	</div>
	<!-- // Если пользователь не авторизован на сайте -->
<?php } ?>