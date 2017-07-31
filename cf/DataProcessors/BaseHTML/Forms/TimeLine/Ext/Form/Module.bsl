Функция КлассTimeLineЗадачи() Возврат "button29" КонецФункции

&НаСервере
Функция ПолучитьСтильПоВсем()
	
	Возврат "
	|	/* -------------------------------------
	| * For horizontal version, set the
	| * $vertical variable to false
	| * ------------------------------------- */
	|/* -------------------------------------
	| * General Style
	| * ------------------------------------- */
	|@import url(https://fonts.googleapis.com/css?family=Noto+Sans);
	|body {
	|  max-width: 1200px;
	|  margin: 0 auto;
	|  padding: 0 5%;
	|  font-size: 100%;
	|  font-family: ""Noto Sans"", sans-serif;
	|  color: #000000;
	|  background: #FFFFFF;
	|}

	|h2 {
	|  margin: 3em 0 0 0;
	|  font-size: 1.5em;
	|  letter-spacing: 2px;
	|  text-transform: uppercase;
	|}

	|/* -------------------------------------
	| * timeline
	| * ------------------------------------- */
	|#timeline {
	|  list-style: none;
	|  margin: 50px 0 30px 120px;
	|  padding-left: 30px;
	|  border-left: 8px solid #eee9dc;
	|}
	|#timeline li {
	|  margin: 10px 0;
	|  position: relative;
	|}
	|#timeline p {
	|  margin: 0 0 15px;
	|}

	|.date {
	|  margin-top: -10px;
	|  top: 50%;
	|  left: -158px;
	|  font-size: 0.95em;
	|  line-height: 20px;
	|  position: absolute;
	|}

	|.circle {
	|  margin-top: -10px;
	|  top: 50%;
	|  left: -44px;
	|  width: 10px;
	|  height: 10px;
	|  background: #48b379;
	|  border: 5px solid #eee9dc;
	|  border-radius: 50%;
	|  display: block;
	|  position: absolute;
	|}

	|.content {
	|  max-height: 20px;
	|  padding: 50px 20px 0;
	|  border-color: transparent;
	|  border-width: 2px;
	|  border-style: solid;
	|  border-radius: 0.5em;
	|  position: relative;
	|}
	|.content:before, .content:after {
	|  content: """";
	|  width: 0;
	|  height: 0;
	|  border: solid transparent;
	|  position: absolute;
	|  pointer-events: none;
	|  right: 100%;
	|}
	|.content:before {
	|  border-right-color: inherit;
	|  border-width: 20px;
	|  top: 50%;
	|  margin-top: -20px;
	|}
	|.content:after {
	|  border-right-color: #FFFFFF;
	|  border-width: 17px;
	|  top: 50%;
	|  margin-top: -17px;
	|}
	|.content p {
	|  max-height: 0;
	|  color: transparent;
	|  text-align: justify;
	|  word-break: break-word;
	|  hyphens: auto;
	|  overflow: hidden;
	|}

	|label {
	|  font-size: 1.3em;
	|  position: absolute;
	|  z-index: 100;
	|  cursor: pointer;
	|  top: 20px;
	|  transition: transform 0.2s linear;
	|}

	|.radio {
	|  display: none;
	|}

	|.radio:checked + .relative label {
	|  cursor: auto;
	|  transform: translateX(42px);
	|}
	|.radio:checked + .relative .circle {
	|  background: #f98262;
	|}
	|.radio:checked ~ .content {
	|  max-height: 2000px;
	|  border-color: #000000;
	|  margin-right: 20px;
	|  transform: translateX(20px);
	|  transition: max-height 0.4s linear, border-color 0.5s linear, transform 0.2s linear;
	|}
	|.radio:checked ~ .content p {
	|  max-height: 200px;
	|  color: #000000;
	|  transition: color 0.3s linear 0.3s;
	|}
	
	// Кнопка
	
	|a." + КлассTimeLineЗадачи() + " {
	|	
	|  display: inline-block;
	|  width: 0.5em;
	|  height: 0.5em;
	|  vertical-align: middle;
	|  text-decoration: none;
	|  border: .25em solid rgba(0,0,0,0);
	|  border-radius: 100%;
	|  background: rgb(245,245,245) linear-gradient(#F8F2D8, rgb(188,192,193)) 50% 50% / calc(1.5em + .5em*2) calc(1.5em + .5em*2);
	|  box-shadow:
	|   inset 0 -3px 10px #F8F2D8,
	|   inset 0 3px 10px rgba(0,0,0,.4),
	|   0 2px 4px rgba(0,0,0,.9);
	|}
	|";
	
КонецФункции
&НаСервере
Функция ПолучитьСтильПоЗадаче()
	
	Возврат "
	|body {	
	|  margin: 0;
	|  padding: 0;
	|  background: rgb(230,230,230);
	|  
	|  color: rgb(50,50,50);
	|  font-family: 'Open Sans', sans-serif;
	|  font-size: 112.5%;
	|  line-height: 1.6em;
	|}

	|/* ================ The Timeline ================ */

	|.timeline {
	|  position: relative;
	|  width: 660px;
	|  margin: 0 auto;
	|  margin-top: 20px;
	|  padding: 1em 0;
	|  list-style-type: none;
	|}

	|.timeline:before {
	|  position: absolute;
	|  left: 50%;
	|  top: 0;
	|  content: ' ';
	|  display: block;
	|  width: 6px;
	|  height: 100%;
	|  margin-left: -3px;
	|  background: rgb(80,80,80);
	|  background: -moz-linear-gradient(top, rgba(80,80,80,0) 0%, rgb(80,80,80) 8%, rgb(80,80,80) 92%, rgba(80,80,80,0) 100%);
	|  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(30,87,153,1)), color-stop(100%,rgba(125,185,232,1)));
	|  background: -webkit-linear-gradient(top, rgba(80,80,80,0) 0%, rgb(80,80,80) 8%, rgb(80,80,80) 92%, rgba(80,80,80,0) 100%);
	|  background: -o-linear-gradient(top, rgba(80,80,80,0) 0%, rgb(80,80,80) 8%, rgb(80,80,80) 92%, rgba(80,80,80,0) 100%);
	|  background: -ms-linear-gradient(top, rgba(80,80,80,0) 0%, rgb(80,80,80) 8%, rgb(80,80,80) 92%, rgba(80,80,80,0) 100%);
	|  background: linear-gradient(to bottom, rgba(80,80,80,0) 0%, rgb(80,80,80) 8%, rgb(80,80,80) 92%, rgba(80,80,80,0) 100%);
	|  
	|  z-index: 5;
	|}

	|.timeline li {
	|  padding: 1em 0;
	|}

	|.timeline li:after {
	|  content: "";
	|  display: block;
	|  height: 0;
	|  clear: both;
	|  visibility: hidden;
	|}

	|.direction-l {
	|  position: relative;
	|  width: 300px;
	|  float: left;
	|  text-align: right;
	|}

	|.direction-r {
	|  position: relative;
	|  width: 300px;
	|  float: right;
	|}

	|.flag-wrapper {
	|  position: relative;
	|  display: inline-block;
	|  
	|  text-align: center;
	|}

	|.flag {
	|  position: relative;
	|  display: inline;
	|  background: rgb(248,248,248);
	|  padding: 6px 10px;
	|  border-radius: 5px;
	|  
	|  font-weight: 600;
	|  text-align: left;
	|}

	|.direction-l .flag {
	|  -webkit-box-shadow: -1px 1px 1px rgba(0,0,0,0.15), 0 0 1px rgba(0,0,0,0.15);
	|  -moz-box-shadow: -1px 1px 1px rgba(0,0,0,0.15), 0 0 1px rgba(0,0,0,0.15);
	|  box-shadow: -1px 1px 1px rgba(0,0,0,0.15), 0 0 1px rgba(0,0,0,0.15);
	|}

	|.direction-r .flag {
	|  -webkit-box-shadow: 1px 1px 1px rgba(0,0,0,0.15), 0 0 1px rgba(0,0,0,0.15);
	|  -moz-box-shadow: 1px 1px 1px rgba(0,0,0,0.15), 0 0 1px rgba(0,0,0,0.15);
	|  box-shadow: 1px 1px 1px rgba(0,0,0,0.15), 0 0 1px rgba(0,0,0,0.15);
	|}

	|.direction-l .flag:before,
	|.direction-r .flag:before {
	|  position: absolute;
	|  top: 50%;
	|  right: -40px;
	|  content: ' ';
	|  display: block;
	|  width: 12px;
	|  height: 12px;
	|  margin-top: -10px;
	|  background: #fff;
	|  border-radius: 10px;
	|  border: 4px solid rgb(255,80,80);
	|  z-index: 10;
	|}

	|.direction-r .flag:before {
	|  left: -40px;
	|}

	|.direction-l .flag:after {
	|  content: "";
	|  position: absolute;
	|  left: 100%;
	|  top: 50%;
	|  height: 0;
	|  width: 0;
	|  margin-top: -8px;
	|  border: solid transparent;
	|  border-left-color: rgb(248,248,248);
	|  border-width: 8px;
	|  pointer-events: none;
	|}

	|.direction-r .flag:after {
	|  content: "";
	|  position: absolute;
	|  right: 100%;
	|  top: 50%;
	|  height: 0;
	|  width: 0;
	|  margin-top: -8px;
	|  border: solid transparent;
	|  border-right-color: rgb(248,248,248);
	|  border-width: 8px;
	|  pointer-events: none;
	|}

	|.time-wrapper {
	|  display: inline;
	|  
	|  line-height: 1em;
	|  font-size: 0.66666em;
	|  color: rgb(250,80,80);
	|  vertical-align: middle;
	|}

	|.direction-l .time-wrapper {
	|  float: left;
	|}

	|.direction-r .time-wrapper {
	|  float: right;
	|}

	|.time {
	|  display: inline-block;
	|  padding: 4px 6px;
	|  background: rgb(248,248,248);
	|}

	|.desc {
	|  margin: 1em 0.75em 0 0;
	|  
	|  font-size: 0.77777em;
	|  font-style: italic;
	|  line-height: 1.5em;
	|}

	|.direction-r .desc {
	|  margin: 1em 0 0 0.75em;
	|}

	|/* ================ Timeline Media Queries ================ */

	|@media screen and (max-width: 660px) {

	|.timeline {
	| 	width: 100%;
	|	padding: 4em 0 1em 0;
	|}

	|.timeline li {
	|	padding: 2em 0;
	|}

	|.direction-l,
	|.direction-r {
	|	float: none;
	|	width: 100%;

	|	text-align: center;
	|}

	|.flag-wrapper {
	|	text-align: center;
	|}

	|.flag {
	|	background: rgb(255,255,255);
	|	z-index: 15;
	|}

	|.direction-l .flag:before,
	|.direction-r .flag:before {
	|  position: absolute;
	|  top: -30px;
	|	left: 50%;
	|	content: ' ';
	|	display: block;
	|	width: 12px;
	|	height: 12px;
	|	margin-left: -9px;
	|	background: #fff;
	|	border-radius: 10px;
	|	border: 4px solid rgb(255,80,80);
	|	z-index: 10;
	|}

	|.direction-l .flag:after,
	|.direction-r .flag:after {
	|	content: "";
	|	position: absolute;
	|	left: 50%;
	|	top: -8px;
	|	height: 0;
	|	width: 0;
	|	margin-left: -8px;
	|	border: solid transparent;
	|	border-bottom-color: rgb(255,255,255);
	|	border-width: 8px;
	|	pointer-events: none;
	|}

	|.time-wrapper {
	|	display: block;
	|	position: relative;
	|	margin: 4px 0 0 0;
	|	z-index: 14;
	|}

	|.direction-l .time-wrapper {
	|	float: none;
	|}

	|.direction-r .time-wrapper {
	|	float: none;
	|}

	|.desc {
	|	position: relative;
	|	margin: 1em 0 0 0;
	|	padding: 1em;
	|	background: rgb(245,245,245);
	|	-webkit-box-shadow: 0 0 1px rgba(0,0,0,0.20);
	|	-moz-box-shadow: 0 0 1px rgba(0,0,0,0.20);
	|	box-shadow: 0 0 1px rgba(0,0,0,0.20);
	|	
	|  z-index: 15;
	|}

	|.direction-l .desc,
	|.direction-r .desc {
	|	position: relative;
	|	margin: 1em 1em 0 1em;
	|	padding: 1em;
	|	
	|  z-index: 15;
	|}

	|}

	|@media screen and (min-width: 400px ?? max-width: 660px) {

	|.direction-l .desc,
	|.direction-r .desc {
	|	margin: 1em 4em 0 4em;
	|	}
	|}
	|";
	
КонецФункции

&НаСервере
Функция ДеньНеделиСтр(Период)
	
	Возврат СтрРазделить("понедельник,вторник,среда,четверг,пятница,суббота,воскресенье", ",")[ДеньНедели(период) - 1];
	
КонецФункции
Функция ТекстОткрытияЗадачи(Задача)
	
	Возврат СтрШаблон("<a href=""#"" title=""Time line по задаче"" id=""%1"" class=""%2""></a>", XMLСтрока(Задача), КлассTimeLineЗадачи());
	
КонецФункции
&НаКлиенте
Процедура ОбновитьHTML() Экспорт
	
	Если Задача.Пустая() Тогда
			ОбновитьHTMLПоВсем();
	Иначе	ОбновитьHTMLПоЗадаче() КонецЕсли;
	
КонецПроцедуры
&НаСервере
Процедура ОбновитьHTMLПоЗадаче()
	
	Тело 	= Новый Массив;
	Таблица = УчетВремени.TimeLineForPeople(
							новый Структура("Исполнитель, Проект, Задача, ДатаНачала, ДатаОкончания", 
							Исполнитель, Проект, Задача, период.ДатаНачала, Период.ДатаОкончания));
	Кол 	= Таблица.Количество();
	стДата 	= '00010101';
	
	Для Ном = 1 По Кол Цикл Строка = Таблица[Кол - Ном];
		
		Если стДата <> НачалоДня(Строка.Период) Тогда
			стДата = НачалоДня(Строка.Период);
			стрДата = СтрШаблон("<hr><b>%1<br>%2</b><br>%3", Формат(Строка.Период, "ДЛФ=DD"), ДеньНеделиСтр(Строка.Период), Формат(Строка.Период, "ДЛФ=T"));
		Иначе
			стрДата = Формат(Строка.Период, "ДЛФ=T"); КонецЕсли;
		
		Тело.Добавить(СтрШаблон("
		|<li>
		|	<div class=""direction-%4"">
		|	<div class=""flag-wrapper""><span class=""flag"">%1</span> <span class=""time-wrapper""><span class=""time"">%2</span></span></div>
		|	<div class=""desc"">%3</div></div></li>
		|<li>",
		Формат(Строка.Период, "ДЛФ=T"),
		СтрШаблон("%1 <b>%2</b>", Формат(Строка.Период, "ДЛФ=DD"), ДеньНеделиСтр(Строка.Период)),
		Строка.textHTML,
		?(ном%2, "l", "r"))); КонецЦикла;
		
	ТекстHTML = ОбщиеФункции.ОбернутьHTML("
	|<ul class=""timeline"">" + СтрСоединить(Тело, Символы.ПС) + "</ul>", ПолучитьСтильПоЗадаче());

КонецПроцедуры
&НаСервере
Процедура ОбновитьHTMLПоВсем()
	
	Тело 	= Новый Массив;
	Таблица = УчетВремени.TimeLineForPeople(
							новый Структура("Исполнитель, Проект, Задача, ДатаНачала, ДатаОкончания", 
							Исполнитель, Проект, Задача, период.ДатаНачала, Период.ДатаОкончания));
	Кол 	= Таблица.Количество();
	стДата 	= '00010101';
	
	Для Ном = 1 По Кол Цикл Строка = Таблица[Кол - Ном];
		
		Если стДата <> НачалоДня(Строка.Период) Тогда
			стДата = НачалоДня(Строка.Период);
			стрДата = СтрШаблон("<hr><b>%1<br>%2</b><br>%3", Формат(Строка.Период, "ДЛФ=DD"), ДеньНеделиСтр(Строка.Период), Формат(Строка.Период, "ДЛФ=T"));
		Иначе
			стрДата = Формат(Строка.Период, "ДЛФ=T"); КонецЕсли;
		
		Тело.Добавить(СтрШаблон("
			  |<li class='work'>
			  |  <input class='radio' id='work%4' name='works' type='radio' checked>
			  |  <div class=""relative"">
			  |    <label for='work%4'>%1 %5</label>
			  |    <span class='date'>%2</span>
			  |    <span class='circle'></span>
			  |  </div>
			  |  <div class='content'>
			  |    %3
			  |  </div>
			  |</li>",
		Строка.Задача,
		стрДата,
		Строка.textHTML,
		Формат(Ном, "ЧГ="),
		ТекстОткрытияЗадачи(Строка.Задача))); КонецЦикла;
		
	ТекстHTML = ОбщиеФункции.ОбернутьHTML("
	|<ul id=""timeline""><li class=""work"">" + СтрСоединить(Тело, Символы.ПС) + "</ul>", ПолучитьСтильПоВсем());
	
КонецПроцедуры

&НаКлиенте
Процедура Обновить(Команда)
	
	ОбновитьHTML();
	
КонецПроцедуры

&НаСервере
Процедура УстановитьЗадачуПоID(id)
	
	Задача = Документы.Задача.ПолучитьСсылку(Новый УникальныйИдентификатор(id));
	
КонецПроцедуры
&НаКлиенте
Процедура ТекстHTMLПриНажатии(Элемент, ДанныеСобытия, СтандартнаяОбработка)
	
	Если ДанныеСобытия.Element.className = "button29" Тогда
		
		СтандартнаяОбработка = Ложь; 
		УстановитьЗадачуПоID(ДанныеСобытия.Element.id);
		
		ПодключитьОбработчикОжидания("ОбновитьHTML", 0.1, Истина); КонецЕсли;
	
КонецПроцедуры
