<div class="content-exp-page">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10">
				<h1 class="title-general mt-0 mb-35">Редактировать - Опыт работы</h1>
				
				<?php foreach ($jobs as $job) {
					include ROOT . "templates/about/_card-job-edit.tpl";
				 } ?>

				<h3 class="title-3 mt-0 mb-35">Добавить новое место</h3>

				<?php require ROOT . "templates/_parts/_errors.tpl"; ?>

				<form action="<?=HOST?>edit-jobs" method="POST" class="about-me-edit-form">
					<label class="label" for="work-date">Период</label>
					<input class="input" name="period" id="work-date" type="text" placeholder="Введите даты начала и окончания работы" value="<?=@$_POST['period']?>" />

					<label class="label" for="name-post">Название должности</label>
					<input class="input" name="title" id="name-post" type="text" placeholder="Введите название должности" value="<?=@$_POST['title']?>" />

					<label class="label" for="description-text">Описание работы, должностные обязанности, достигнутые результаты</label>
					<textarea class="textarea" name="description" id="description-text" placeholder="Напишите интересное краткое содержательное описание"><?=@$_POST['description']?></textarea>

					<input class="button button-save" type="submit" name="newJob" value="Добавить" /></form>
			</div>
		</div>
	</div>
</div>