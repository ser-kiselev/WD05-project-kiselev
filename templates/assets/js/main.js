$(document).ready(function() {
	
	// $(".left-panel").customScrollbar({preventDefaultScroll: true});

	setTimeout(function(){
		$('[data-notify-hide]').slideUp(600);
	}, 2000);

	$('[data-notify-hide]').dblclick(function(){
		$(this).slideUp(600);
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

	// Проверка формы на странице Контакты
	$('#sendMessage').on('click', function(e){
		e.preventDefault();
		
		var senderName = $('#senderName'),
			senderEmail = $('#senderEmail'),
			senderMessage = $('#senderMessage'),
			enterName = $('#enterName'),
			enterEmail = $('#enterEmail'),
			invalidEmail = $('#invalidEmail'),
			enterMessage = $('#enterMessage'),
			pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;

		if ( senderName.val() == '' ) {
			enterName.fadeIn(500);
		} else if ( senderEmail.val() == '' ) {
			enterEmail.fadeIn(500);
		} else if ( !pattern.test(senderEmail.val() ) ) {
			invalidEmail.fadeIn(500);
		} else if ( senderMessage.val() == '' ) {
			enterMessage.fadeIn(500);
		} else {
			$('#sendMessage').unbind('click').click();
		}

		// Скрываем нотификации об ошибках
		senderName.keypress(function(){
			enterName.fadeOut();
		});
		senderEmail.keypress(function(){
			enterEmail.fadeOut();
			invalidEmail.fadeOut();
		});
		senderMessage.keypress(function(){
			enterMessage.fadeOut();
		});

	});
	
});