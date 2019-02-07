$(document).ready(function() {
	
	// $(".left-panel").customScrollbar({preventDefaultScroll: true});

	setTimeout(function(){
		$('[data-notify-hide]').slideUp(400);
	}, 1500);

	$('[data-notify-hide]').dblclick(function(){
		$(this).slideUp(400);
	});

	// Проверка перед отправкой комментария
	$('#commentSubmit').on('click', function(e){
		e.preventDefault();
		var userComment = $('#userComment'),
			enterComment = $('#enterComment');
		if ( userComment.val() == '' ) {
			// Показываем ошибку
			enterComment.fadeIn(500);
		} else {
			$('#commentSubmit').unbind('click').click();
		}
		// Скрываем нотификацию об ошибке при вводе комментария
		userComment.keypress(function(){
			enterComment.fadeOut();
		});
	});

	// Проверка формы редактирования контактных данных
	$('#contactsEditSubmit').on('click', function(e){
		e.preventDefault();
		
		var contactName = $('#contactName'),
			contactEmail = $('#contactEmail'),
			contactPhone = $('#contactPhone'),
			enterName = $('#enterName'),
			enterEmail = $('#enterEmail'),
			invalidEmail = $('#invalidEmail'),
			enterPhone = $('#enterPhone'),
			pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;

		if ( contactName.val() == '' ) {
			enterName.fadeIn(500);
		} else if ( contactEmail.val() == '' ) {
			enterEmail.fadeIn(500);
		} else if ( !pattern.test(contactEmail.val() ) ) {
			invalidEmail.fadeIn(500);
		} else if ( contactPhone.val() == '' ) {
			enterPhone.fadeIn(500);
		} else {
			$('#contactsEditSubmit').unbind('click').click();
		}

		// Скрываем нотификации об ошибках
		contactName.keypress(function(){
			enterName.fadeOut();
		});
		contactEmail.keypress(function(){
			enterEmail.fadeOut();
			invalidEmail.fadeOut();
		});
		contactPhone.keypress(function(){
			enterPhone.fadeOut();
		});

	});
	
});