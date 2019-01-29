$(document).ready(function() {

	var checkEditProfile = (function(){

		var _editProfileSubmit = $('#editProfileSubmit');

		// Метод запуска паттерн-модуля
		var init = function(){
			// Запускаем прослушку событий
			_setUpListeners();
		}

		// Прослушиваем события
		var _setUpListeners = function(){

			_editProfileSubmit.on('click', function(e){
				_editProfileFormValidate(e);
			});
		}

		// Приватные методы
		var _editProfileFormValidate = function(e){

			e.preventDefault();

			var _userEditName = $('#userEditName'),
				_userEditNameVal = _userEditName.val().trim(),
				_userEditLastname = $('#userEditLastname'),
				_userEditLastnameVal = _userEditLastname.val().trim(),
				
				// Переменные нотификаций об ошибке
				_enterName = $('#enterName'),
				_enterLastName = $('#enterLastName');

			// Проверяем поля
			if ( _userEditNameVal.length === 0 ) {
				_enterName.fadeIn(500);
			} else {

				if ( _userEditLastnameVal.length === 0 ) {
					_enterLastName.fadeIn(500);
				} else {
					_editProfileSubmit.unbind('click').click();
				}
			}

			// Скрываем нотификации об ошибках при вводе текста в поля
			_userEditName.keypress(function(){
				_enterName.fadeOut();
			});

			_userEditLastname.keypress(function(){
				_enterLastName.fadeOut();
			});
		}

		// Возвращаем метод запуска
		return {
			init
		}

	}());

	// Запускаем модуль проверки формы редактирования профиля
	checkEditProfile.init();

});