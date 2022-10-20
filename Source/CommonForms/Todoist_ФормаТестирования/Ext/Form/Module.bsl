﻿&НаКлиенте
Процедура ОбновитьПроекты()
	СписокПроектов.Очистить();
	Проекты = Todoist_Клиент.ПолучитьСписокВсехПроектов();
	Для Каждого Проект Из Проекты Цикл
		ТС = СписокПроектов.Добавить();
		ТС.Идентификатор = Проект.Идентификатор;
		ТС.Название = Проект.Название;
		ТС.КоличествоКомментариев = Проект.КоличествоКомментариев;
		ТС.ПорядковыйНомер = Проект.ПорядковыйНомер;
		ТС.Цвет = Проект.Цвет;
		ТС.Общий = Проект.Общий;
		ТС.Избранное = Проект.Избранное;
		ТС.Входящие = Проект.Входящие;
		ТС.ВходящиеКоманды = Проект.ВходящиеКоманды;
		ТС.СпособОтображения = Проект.СпособОтображения;
		ТС.Ссылка = Проект.Ссылка;
		ТС.ИдентификаторРодителя = Проект.ИдентификаторРодителя;
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьЗадачи()
	СписокЗадач.Очистить();
	ТД = ЭтаФорма.Элементы.СписокПроектов.ТекущиеДанные;
	Фильтр = Todoist_Клиент.ПолучитьСтруктуруФильтра(1);
	Фильтр.ИдентификаторПроекта = ТД.Идентификатор;
	Задачи = Todoist_Клиент.ПолучитьСписокАктивныхЗадач(Фильтр);
	Для Каждого Задача Из Задачи Цикл
		ТС = СписокЗадач.Добавить();
		ТС.ИдентификаторСоздателя = Задача.ИдентификаторСоздателя;
		ТС.ДатаСоздания = Задача.ДатаСоздания;
		ТС.ИдентификаторИсполнителя = Задача.ИдентификаторИсполнителя;
		ТС.ИдентификаторДелегировавшего = Задача.ИдентификаторДелегировавшего;
		ТС.КоличествоКомментариев = Задача.КоличествоКомментариев;
		ТС.Исполнен = Задача.Исполнен;
		ТС.Содержание = Задача.Содержание;
		ТС.Описание = Задача.Описание;
		ТС.ДатаИсполнения = Задача.СрокИсполнения.ДатаИсполнения;
		ТС.Повторяющийся = Задача.СрокИсполнения.Повторяющийся;
		ТС.ДатаВремяСтрокой = Задача.СрокИсполнения.ДатаВремяСтрокой;
		ТС.Время = Задача.СрокИсполнения.Время;
		ТС.ЧасовойПояс = Задача.СрокИсполнения.ЧасовойПояс;
		ТС.Идентификатор = Задача.Идентификатор;
		ТС.Метки = Задача.Метки;
		ТС.ПорядковыйНомер = Задача.ПорядковыйНомер;
		ТС.Приоритет = Задача.Приоритет;
		ТС.ИдентификаторПроекта = Задача.ИдентификаторПроекта;
		ТС.ИдентификаторСекции = Задача.ИдентификаторСекции;
		ТС.ИдентификаторРодителя = Задача.ИдентификаторРодителя;
		ТС.Ссылка = Задача.Ссылка;
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьКомментарии()
	СписокКомментариев.Очистить();
	ТД = ЭтаФорма.Элементы.СписокЗадач.ТекущиеДанные;
	Фильтр = Todoist_Клиент.ПолучитьСтруктуруФильтра(2);
	Фильтр.ИдентификаторЗадачи = ТД.Идентификатор;
	Комментарии = Todoist_Клиент.ПолучитьСписокВсехКомментариев(Фильтр);
	Для Каждого Комментарий Из Комментарии Цикл
		ТС = СписокКомментариев.Добавить();
		ТС.Содержание = Комментарий.Содержание;
		ТС.Идентификатор = Комментарий.Идентификатор;
		ТС.ДатаВремяСоздания = Комментарий.ДатаВремяСоздания;
		ТС.ИдентификаторПроекта = Комментарий.ИдентификаторПроекта;
		ТС.ИдентификаторЗадачи = Комментарий.ИдентификаторЗадачи;
		ТС.НазваниеФайла = Комментарий.ПривязанныйФайл.НазваниеФайла;
		ТС.ТипФайла = Комментарий.ПривязанныйФайл.ТипФайла;
		ТС.СсылкаНаФайл = Комментарий.ПривязанныйФайл.СсылкаНаФайл;
		ТС.ТипСодержимого = Комментарий.ПривязанныйФайл.ТипСодержимого;
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	ОбновитьПроекты();
КонецПроцедуры

&НаКлиенте
Процедура СписокПроектовПередУдалением(Элемент, Отказ)
	Отказ = Истина;
КонецПроцедуры

&НаКлиенте
Процедура СписокПроектовПриАктивизацииСтроки(Элемент)
	ОбновитьЗадачи();
КонецПроцедуры

&НаКлиенте
Процедура СписокЗадачПередУдалением(Элемент, Отказ)
	Отказ = Истина;
КонецПроцедуры

&НаКлиенте
Процедура СписокЗадачПриАктивизацииСтроки(Элемент)
	ОбновитьКомментарии();
КонецПроцедуры

&НаКлиенте
Процедура СписокКомментариевПередУдалением(Элемент, Отказ)
	Отказ = Истина;
КонецПроцедуры
