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
	
});