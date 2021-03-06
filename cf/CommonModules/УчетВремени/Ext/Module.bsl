﻿
Функция ПолучитьЗапросаСДатами(ТекстЗапроса, Сотрудник, Проект, Задача, ДатаНачала, ДатаОкончания)
	
	// Формирует запрос устанавливает параметры
	
	Запрос = Новый Запрос(СтрЗаменить(ТекстЗапроса, 
		"//+ГДЕ", СтрШаблон("%5 %1 %2 %3 %4", 
		?(ЗначениеЗаполнено(Проект),"			И Задача.Проект = &Проект", ""),
		?(ЗначениеЗаполнено(Задача),"			И Задача = &Задача", ""),
		?(ЗначениеЗаполнено(ДатаНачала),"		И Период >= &ДатаНачала", ""),
		?(ЗначениеЗаполнено(ДатаОкончания),"	И Период <= &ДатаОкончания", ""),
		?(ЗначениеЗаполнено(Сотрудник),"		И Автор = &Сотрудник", ""))));
	
	Запрос.УстановитьПараметр("Сотрудник", 		Сотрудник);
	Запрос.УстановитьПараметр("Проект", 		Проект);
	Запрос.УстановитьПараметр("Задача", 		Задача);
	Запрос.УстановитьПараметр("ДатаНачала", 	ДатаНачала);
	Запрос.УстановитьПараметр("ДатаОкончания",	ДатаОкончания);
	
	Возврат Запрос;
	
КонецФункции

Функция ПолучитьИзмененийРеквизитовЗадачСотруднника(Сотрудник = Неопределено, Проект = Неопределено, Задача = Неопределено, ДатаНачала = Неопределено, ДатаОкончания = Неопределено, ПозниеПервые = Ложь) Экспорт
	
	// Возвращает хронологическую таблицу по изменении реквизитов задач
	//	Задача
	//	Период
	//	Реквизит 				- реквизит над которым производилось действие
	//	Значение				- значение которе было установлено
	
	Возврат ПолучитьЗапросаСДатами("
	|ВЫБРАТЬ РАЗРЕШЕННЫЕ 	Задача, Период, ИмяРеквизита Реквизит, Значение, null БольшойТекст
	|ИЗ			РегистрСведений.ИсторияРеквизитовЗадач
	|ГДЕ		ИмяРеквизита <> ""ФактДоп"" //+ГДЕ
	|
	|ОБЪЕДИНИТЬ ВСЕ
	|
	|ВЫБРАТЬ 	Задача, Период, ""Описание"",null, Значение
	|ИЗ			РегистрСведений.ИсторияОписанийЗадач
	|ГДЕ		ИСТИНА //+ГДЕ
	|
	|ОБЪЕДИНИТЬ ВСЕ
	|
	|ВЫБРАТЬ 	Задача, Период, ""Комментарий"", null, Комментарий
	|ИЗ			РегистрСведений.КомментарииЗадач
	|ГДЕ		ИСТИНА //+ГДЕ
	|
	|УПОРЯДОЧИТЬ ПО Период " + ?(ПозниеПервые, "Убыв", ""), 
		Сотрудник, Проект, Задача, ДатаНачала, ДатаОкончания).Выполнить().Выгрузить();
	
КонецФункции
Функция ПолучитьТаблицуВремениСотруднника(Сотрудник = Неопределено, Проект = Неопределено, Задача = Неопределено, ДатаНачала = Неопределено, ДатаОкончания = Неопределено) Экспорт
	
	// Возвращает когда таймер был включен а когда отключен
	//	Задача
	//	ДатаНачала		- таймер он
	//	ДатаОкончания	- таймер офф
	
	Возврат ПолучитьЗапросаСДатами("
	
	|ВЫБРАТЬ РАЗРЕШЕННЫЕ 	Задача, ДОБАВИТЬКДАТЕ(Период, СЕКУНДА, -ВЫРАЗИТЬ(Значение КАК ЧИСЛО)) ДатаНачала, Период ДатаОкончания
	|ИЗ			РегистрСведений.ИсторияРеквизитовЗадач
	|ГДЕ		ИмяРеквизита = ""Факт"" //+ГДЕ
	|
	|УПОРЯДОЧИТЬ ПО ДатаНачала
	|
	|", Сотрудник, Проект, Задача, ДатаНачала, ДатаОкончания).Выполнить().Выгрузить();
	
КонецФункции

Функция Парам(Структура, Параметр)
	// Возвращает значение из параметра, если его нету то неопределено
	
	Перем Значение;
	
	Структура.Свойство(Параметр, Значение);
	Возврат Значение;
	
КонецФункции

Процедура ДобавитьПозднююСтроку(Строки, Строка)
	
	// Добавляет строку в массив,
	// если в массиве уже есть строка с таким рекизитом, тогда заменяет ее
	
	Инд = -1;
	Для Каждого текСтрока Из Строки Цикл Инд = Инд + 1;
		Если текСтрока.Реквизит = Строка.Реквизит Тогда
			Строки[Инд] = Строка;
			Возврат; КонецЕсли; КонецЦикла;
			
	Строки.Добавить(Строка);
	
КонецПроцедуры
Функция ПолучитьВсеСтрокиВГруппе(Таблица, Индекс, Расстояние, ИгнорФакт, ИгнорРеквизиты)
	
	// Возвращает массив строк которые не превышают расстояние либо они далеко но у них маленький ИгнорФакт
	// Ищется от переданной строки и дальше
	//	если маленький игнор факт а в будущем расстояние меньше чем в прошлом то такая строка пропускается, чтобы
	// 	строка отнеслась в следующем запросе
	// 
	// Если в группе несколько значений одного реквизита, тогда береться только самый поздний
	
	ПослИндекс	= Таблица.Количество() - 1;
	стСтрока 	= Таблица[Индекс];
	Строки 		= Новый Массив;
	Задача		= Таблица[Индекс].Задача;
	
	Для Инд = Индекс По ПослИндекс Цикл
		
		Строка = Таблица[Инд];
		Если Задача <> Строка.Задача Тогда Прервать КонецЕсли;
		Если ИгнорРеквизиты.Найти(Строка.Реквизит) = Неопределено Тогда
			
			Если Строка.Реквизит = "Факт" И Строка.Значение < ИгнорФакт Тогда Продолжить КонецЕсли;
			
			Если Строка.Период - стСтрока.Период > Расстояние Тогда
				
				СтрокаБудущая = ?(Инд = ПослИндекс, Неопределено, Таблица[Инд + 1]);
				Если 	СтрокаБудущая <> Неопределено И 
						СтрокаБудущая.Задача = Задача И 
						СтрокаБудущая.Период - Строка.Период < Строка.Период - стСтрока.Период Тогда
					Прервать; КонецЕсли;
						
				ДобавитьПозднююСтроку(Строки, Строка);
				стСтрока = Строка;
				Продолжить;
				
			Иначе
				ДобавитьПозднююСтроку(Строки, Строка);
				стСтрока = Строка; КонецЕсли; КонецЕсли; КонецЦикла;
				
	Индекс = Инд;
	Возврат Строки;
	
КонецФункции
Функция ПолучитьпредставлениеИзменения(Строка, Настройки)
	
	Если Строка.Реквизит = "Описание" Тогда
		
		Возврат СтрШаблон("установил описание <p><span class=""%1"">%2</span></p>", Настройки.КлассОписание, СтрЗаменить(Строка.большойТекст, Символы.ПС, "<br>"));
		
	ИначеЕсли Строка.Реквизит = "Комментарий" Тогда
		
		Возврат СтрШаблон("<p><span class=""%1"">%2</span></p><p><span class=""%3"">%4</span></p>",
			Настройки.КлассВремя, Формат(Строка.Период, "ДЛФ=T"), Настройки.КлассКомментарий, СтрЗаменить(Строка.большойТекст, Символы.ПС, "<br>"));
			
	ИначеЕсли Строка.Реквизит = "Факт" Тогда
		
		Возврат СтрШаблон("Время работы составило <span class=""%1"">%2</span>", Настройки.КлассЗначение, ОбщиеФункции.представлениеВремени(Строка.Значение));
		
	ИначеЕсли Строка.Реквизит = "Сумма" Тогда
		
		Возврат СтрШаблон("Сумма (руб): <span class=""%1"">%2</span>", Настройки.КлассЗначение, Строка.Значение);
			
	Иначе
		
		Возврат СтрШаблон("Изменил <span class=""%1"">%2</span> <span class=""%3"">%4</span>", 
			Настройки.КлассРеквизит, Строка.Реквизит, Настройки.КлассЗначение, Строка.Значение); КонецЕсли;
	
КонецФункции
Функция TimeLineForPeople(Параметры, Настройки = Неопределено) Экспорт
	
	// Возвращает таблицу значений осознаную для отображения потом людям
	//	- Задача
	//	- Период
	//	- textHTML (для людей текст c html вставками)
	//
	// Параметры (структура) - параметры для запроса, могут быть - 
	//		- Исполнитель, 
	//		- Проект, 
	//		- Задача, 
	//		- ДатаНачала, 
	//		- ДатаОкончания
	//
	// Настройки (структура)
	//	- Расстояние - число, сколько секунд должно пройти между задачами чтобы они не объединялись
	//					(по умолчанию 60 сек)
	//	- ИгнорФакт - число, если у факта меньше секунд и ему не с кем объединится тогда такая запись игнорируется
	//					(по умолчанию 45 сек)
	//	- КлассРеквизит 	- (тэг выделения класса по имени), по умолчанию "property"
	//	- КлассОписание 	- (тэг выделения класса по имени), по умолчанию "content"
	//	- КлассЗначение 	- (тэг выделения класса по имени), по умолчанию "value"
	//	- КлассКомментарий 	- (тэг выделения класса по имени), по умолчанию "comment"
	//	- КлассВремя 		- (тэг выделения класса по имени), по умолчанию "timeEvent"
	//
	// 	если растояние между задачами маленько, тогда включает ее в одно время (время береться позднее)
	// 	если период факта очень саленький то игонрирует его
	//	задачи в объединенном времени объединяются
	
	
	// Реквизиты которые игнорируются
	ИгнорРеквизиты = СтрРазделить("ДатаСоздания,Автор,Ответственный,ФактДоп,Проект", ",");
	// Порядок отображения изменений, первыми идут которые не указаны в пррадки, потом по порядку
	Порядок = СтрРазделить("СтоимостьЧаса,Факт,Сумма,Описание,Комментарий", ",");
	
	Если Настройки = Неопределено Тогда Настройки = Новый Структура КонецЕсли;
	Если Не Настройки.Свойство("Расстояние") Тогда			Настройки.Вставить("Расстояние", 		60) КонецЕсли;
	Если Не Настройки.Свойство("ИгнорФакт") Тогда 			Настройки.Вставить("ИгнорФакт", 		45) КонецЕсли;
	Если Не Настройки.Свойство("КлассРеквизит") Тогда 		Настройки.Вставить("КлассРеквизит", 	"property") КонецЕсли;
	Если Не Настройки.Свойство("КлассОписание") Тогда 		Настройки.Вставить("КлассОписание", 	"content") КонецЕсли;
	Если Не Настройки.Свойство("КлассЗначение") Тогда 		Настройки.Вставить("КлассЗначение", 	"value") КонецЕсли;
	Если Не Настройки.Свойство("КлассКомментарий") Тогда 	Настройки.Вставить("КлассКомментарий", 	"comment") КонецЕсли;
	Если Не Настройки.Свойство("КлассВремя") Тогда 			Настройки.Вставить("КлассВремя", 		"timeEvent") КонецЕсли;
	
	новТаб = Новый ТаблицаЗначений;
	новТаб.Колонки.Добавить("Задача", 	Новый ОписаниеТипов("ДокументСсылка.Задача"));
	новТаб.Колонки.Добавить("Период", 	Новый ОписаниеТипов("Дата"));
	новТаб.Колонки.Добавить("Изменено", Новый ОписаниеТипов("Массив"));
	новТаб.Колонки.Добавить("textHTML",	Новый ОписаниеТипов("Строка"));
	
	Таблица 	= ПолучитьИзмененийРеквизитовЗадачСотруднника(Парам(Параметры, "Исполнитель"), Парам(Параметры, "Проект"), Парам(Параметры, "Задача"), Парам(Параметры, "ДатаНачала"), Парам(Параметры, "ДатаОкончания"));
	textHTML 	= новый Массив;
	Инд			= 0;
	
	Пока Инд < Таблица.Количество() Цикл textHTML.Очистить();
		
		Строки = ПолучитьВсеСтрокиВГруппе(Таблица, Инд, Настройки.Расстояние, Настройки.ИгнорФакт, ИгнорРеквизиты);
		Если Строки.Количество() Тогда
		
			Для Каждого Строка Из Строки Цикл
				Если Порядок.Найти(Строка.Реквизит) = Неопределено Тогда
					textHTML.Добавить(ПолучитьпредставлениеИзменения(Строка, Настройки)); КонецЕсли; КонецЦикла;
			
			Для Каждого ИмяПорядка Из Порядок Цикл
				Для Каждого Строка Из Строки Цикл
					Если Строка.реквизит = ИмяПорядка Тогда
						textHTML.Добавить(ПолучитьпредставлениеИзменения(Строка, Настройки));
						Прервать; КонецЕсли; КонецЦикла; КонецЦикла; 
						
			НовСтрока = новТаб.Добавить();
			НовСтрока.Задача 	= Строка.Задача;
			НовСтрока.Период 	= Строка.Период;
			НовСтрока.textHTML 	= СтрШаблон("<p>%1</p>", СтрСоединить(textHTML, "</p><p>")); КонецЕсли; КонецЦикла;
			
	Возврат новТаб;
	
КонецФункции