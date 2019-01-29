$(document).ready(function() {

	var checkSetNewPassword = (function(){

		// Переменные модуля
		var _submitNewPass = $('#submitNewPass');

		// Метод запуска модуля
		var init = function(){
			// Запускаем прослушку событий
			_setUpListeners();
		}

		// Прослушиваем события
		var _setUpListeners = function(){

			_submitNewPass.on('click', function(e){
				_lostSetNewPassFormValidate(e);
			});
		}

		// Приватные методы
		var _lostSetNewPassFormValidate = function(e){

			e.preventDefault();

			var _inputNewPass = $('#inputNewPass'),
				_inputNewPassVal = _inputNewPass.val().trim(),
				
				// Переменные нотификаций об ошибке
				_enterPassword = $('#enterPassword');

			// Проверяем поле пароля на странице «Установить новый пароль»
			if ( _inputNewPassVal.length === 0 ) {
				_enterPassword.fadeIn(500);
			} else {
				_submitNewPass.unbind('click').click();
			}

			// Скрываем нотификации об ошибках при вводе текста в поля
			_inputPass.keypress(function(){
				_enterPassword.fadeOut();
			});
		}

		// Возвращаем метод запуска
		return {
			init
		}

	}());

	// Запускаем модуль проверки формы «Задать новый пароль»
	checkSetNewPassword.init();

});