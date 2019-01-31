$(document).ready(function() {

	var checkAddNewPost = (function(){

		var _newPostSubmit = $('#newPostSubmit');

		// Метод запуска паттерн-модуля
		var init = function(){
			// Запускаем прослушку событий
			_setUpListeners();
		}

		// Прослушиваем события
		var _setUpListeners = function(){

			_newPostSubmit.on('click', function(e){
				_addNewPostFormValidate(e);
			});
		}

		// Приватные методы
		var _addNewPostFormValidate = function(e){

			e.preventDefault();

			var _addPostName = $('#addPostName'),
				_addPostNameVal = _addPostName.val().trim(),
				_addPostText = $('#addPostText'),
				_addPostTextVal = _addPostText.val().trim(),
				
				// Переменные нотификаций об ошибке
				_enterPostTitle = $('#enterPostTitle'),
				_enterPostText = $('#enterPostText');

			// Проверяем поля
			if ( _addPostNameVal.length === 0 ) {
				_enterPostTitle.fadeIn(500);
			} else {
				if ( _addPostTextVal.length === 0 ) {
					_enterPostText.fadeIn(500);
				} else {
					// _newPostSubmit.unbind('click').click();
				}
			}

			// _newPostSubmit.unbind('click').click();

			// Скрываем нотификации об ошибках при вводе текста в поля
			_addPostName.keypress(function(){
				_enterPostTitle.fadeOut();
			});

			_addPostText.keypress(function(){
				_enterPostText.fadeOut();
			});
		}

		// Возвращаем метод запуска
		return {
			init
		}

	}());

	// Запускаем модуль проверки формы добавления нового поста
	checkAddNewPost.init();