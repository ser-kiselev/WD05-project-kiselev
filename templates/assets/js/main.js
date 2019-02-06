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
		var userComment = $('#user-comment'),
			enterComment = $('#enterComment');
		if ( userComment.val() == '' ) {
			// Показываем ошибку
			enterComment.fadeIn(500);
		} else {
			$('#commentForm').submit();
		}
		// Скрываем нотификацию об ошибке при вводе комментария
		$('#user-comment').keypress(function(){
			enterComment.fadeOut();
		});
	});
	
});