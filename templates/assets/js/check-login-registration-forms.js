$(document).ready(function() {

	var checkLoginRegistration = (function(){

		// Переменные паттерн-модуля
		var _inputSubmit = $('#inputSubmit');

		// Метод запуска паттерн-модуля
		var init = function(){
			// Запускаем прослушку событий
			_setUpListeners();
		}

		// Прослушиваем события
		var _setUpListeners = function(){

			_inputSubmit.on('click', function(e){
				_registrationFormValidate(e);
			});

		}

		// Приватные методы
		var _registrationFormValidate = function(e){

			e.preventDefault();

			var _inputEmail = $('#inputEmail'),
				_inputPassword = $('#inputPassword'),
				_inputEmailVal = _inputEmail.val().trim(),
				_inputPasswordVal = _inputPassword.val().trim(),
				
				// Переменные нотификаций об ошибках
				_enterEmail = $('#enterEmail'),
				_invalidEmail = $('#invalidEmail'),
				_enterPassword = $('#enterPassword');

			// Проверяем поля форм авторизации и регистрации
			if ( _inputEmailVal.length === 0 ) {
				_enterEmail.fadeIn(500);
				
			} else {

				var _pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;

				if ( _pattern.test( _inputEmailVal ) ) {
					
					if ( _inputPasswordVal.length === 0 ) {
						_enterPassword.fadeIn(500);
					} else {
						// Если все поля заполнены, то отправляем форму
						_inputSubmit.unbind('click').click();
					}

				} else {
					_invalidEmail.fadeIn(500);
				}
			}

			// Скрываем нотификации об ошибках при вводе текста в поля
			_inputEmail.keypress(function(){
				_enterEmail.fadeOut();
				_invalidEmail.fadeOut();
			});

			_inputPassword.keypress(function(){
				_enterPassword.fadeOut();
			});

		}

		// Возвращаем метод запуска
		return {
			init
		}

	}());

	// Запускаем модуль проверки регистрации
	checkLoginRegistration.init();

});