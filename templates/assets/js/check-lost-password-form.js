$(document).ready(function() {

	var checkLostPassword = (function(){

		// Переменные паттерн-модуля
		var _restorePass = $('#restorePass');

		// Метод запуска паттерн-модуля
		var init = function(){
			// Запускаем прослушку событий
			_setUpListeners();
		}

		// Прослушиваем события
		var _setUpListeners = function(){

			_restorePass.on('click', function(e){
				_lostPassFormValidate(e);
			});

		}

		// Приватные методы
		var _lostPassFormValidate = function(e){

			e.preventDefault();

			var _inputEmailLostPassForm = $('#inputEmailLostPassForm'),
				_inputEmailLostPassFormVal = _inputEmailLostPassForm.val().trim(),
				
				// Переменные нотификаций об ошибках
				_enterEmail = $('#enterEmail'),
				_invalidEmail = $('#invalidEmail');

			// Проверяем полe e-mail на странице «Восстановить пароль»
			if ( _inputEmailLostPassFormVal.length === 0 ) {
				_enterEmail.fadeIn(500);
			} else {
				var _pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;

				if ( _pattern.test( _inputEmailLostPassFormVal ) ) {
					_restorePass.unbind('click').click();
				} else {
					_invalidEmail.fadeIn(500);
				}
			}

			// Скрываем нотификации об ошибках при вводе текста в поля
			_inputEmailLostPassForm.keypress(function(){
				_enterEmail.fadeOut();
				_invalidEmail.fadeOut();
			});

		}

		// Возвращаем метод запуска
		return {
			init
		}

	}());

	// Запускаем модуль проверки формы восстановления пароля
	checkLostPassword.init();

});