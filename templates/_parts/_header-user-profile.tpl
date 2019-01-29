<div class="user-block">
	<div class="user-block__wrapper">
		<div class="row user-group">
			<div class="avatar avatar--small">

				<?php if ( $_SESSION['logged_user']['avatar_small'] != "") { ?>
					<img src="<?=HOST?>usercontent/avatar/<?=$_SESSION['logged_user']['avatar_small']?>" alt="<?=$_SESSION['logged_user']['name']?> <?=$_SESSION['logged_user']['secondname']?>" />
				<?php } else { ?>
					<img src="<?=HOST?>templates/assets/img/placeholders/user-avatar-placeholder-small.jpg?>" alt="<?=$_SESSION['logged_user']['name']?> <?=$_SESSION['logged_user']['secondname']?>" />
				<?php } ?>
		
			</div>
			<div class="user-name">
				<span>
					<?=$_SESSION['logged_user']['name']?> 
					<?=$_SESSION['logged_user']['secondname']?>
				</span>
				<p>Пользователь</p>
				<div class="row user-buttons">
					<a class="button button-profile" href="<?=HOST?>profile">Профиль</a>
					<a class="button button-profile" href="<?=HOST?>logout">Выход</a>
				</div>
			</div>
		</div>
	</div>
</div>