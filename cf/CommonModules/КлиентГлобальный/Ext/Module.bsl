﻿
#Область Смена_пароля

Процедура ПроверитьТребованиеСменитьПароль() Экспорт
	
	Если ОбщиеФункции.ПользователюНужноСменитьПароль() Тогда
		ОткрытьФорму("Справочник.Пользователи.Форма.ВводПароля", Новый Структура("ПоказатьНадпись1", Истина),,,,,Новый ОписаниеОповещения("ПолучитьНовыйПарольПользователя", МодульКлиента)); КонецЕсли;
	
КонецПроцедуры


#КонецОбласти
