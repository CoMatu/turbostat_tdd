import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
class S implements WidgetsLocalizations {
  const S();

  static S current;

  static const GeneratedLocalizationsDelegate delegate =
    GeneratedLocalizationsDelegate();

  static S of(BuildContext context) => Localizations.of<S>(context, S);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get add_car_page_description => "On this page you must enter information about your car:";
  String get add_entry_page_description => "On this page you must enter the name of the inspection or operation of the vehicle maintenance schedule, as well as the maintenance interval.";
  String get add_maintenance_operation => "Write maintenance operation";
  String get add_maintenance_regular => "Add regular maintenance";
  String get add_operation_page_description => "On this page, it is necessary to record the performed inspection or maintenance operation, odometer value, used consumables or spare parts";
  String get already_have_account => "Already have an account? Sign in";
  String get button_add_calendar_camel => "Remind";
  String get button_add_car => "ADD CAR";
  String get button_cancel => "CANCEL";
  String get button_delete => "DELETE";
  String get button_delete_camel => "Delete";
  String get button_edit => "EDIT";
  String get button_edit_camel => "Edit";
  String get button_save => "SAVE";
  String get car_card_alert_dialog_title => "Remove a car from the list?";
  String get car_card_change => "Edit";
  String get car_card_content_text => "You will remove the car from the list of vehicles without the possibility of recovery";
  String get car_card_enter_current_mileage => "Enter current mileage";
  String get car_card_no_image_selected => "No image selected";
  String get car_list_page_warning => "To get started you need to add a car";
  String get dashboard_page_not_determinate_title => "No maintenance information";
  String get dashboard_page_welcome => "Welcome to TurboStat!";
  String get dashboard_page_welcome_thanks => "";
  String get date => "date";
  String get delete_entry_operation => "Delete record?";
  String get delete_entry_operation_warning => "You will delete the current record without the possibility of recovery";
  String get delete_image => "Delete image";
  String get drawer_add_car => "Add car";
  String get drawer_logout => "Logout";
  String get drawer_my_cars => "My cars";
  String get drawer_not_logged => "Not logged in";
  String get edit_car_page_title => "Edit car details:";
  String get edit_entry_page_title => "Edit maintenance information";
  String get enter_email => "Enter Email";
  String get enter_password => "Enter Password";
  String get form_alert_details => "Details";
  String get form_decorator_car_mark => "Enter a car mark";
  String get form_decorator_car_mileage => "Enter a current mileage";
  String get form_decorator_car_model => "Enter a car model";
  String get form_decorator_car_name => "Choose a car name";
  String get form_decorator_car_vin => "Enter a VIN code * unnecessary";
  String get form_decorator_car_year => "Enter a car year";
  String get form_decorator_date => "Maintenance date";
  String get form_decorator_date_select => "Select the date";
  String get form_decorator_maintenance_interval => "Maintenance interval, mo";
  String get form_decorator_maintenance_interval_km => "Maintenance interval, km";
  String get form_decorator_maintenance_name => "Maintenance title";
  String get form_decorator_notes => "Notes";
  String get form_decorator_odometer_value => "Odometer value, km";
  String get form_decorator_part_name => "Consumables / parts";
  String get form_decorator_select_maintenance => "Select maintenance from list";
  String get form_initial_my_car => "My Car";
  String get form_switch_check => "Check";
  String get form_switch_replacement => "Replacement";
  String get form_validator_car_mark => "Please, enter a car mark";
  String get form_validator_car_mileage => "Please, enter a current mileage";
  String get form_validator_car_model => "Please, enter a car model";
  String get form_validator_car_name => "Please, enter a car name";
  String get form_validator_car_vin => "Please, enter a VIN code";
  String get form_validator_car_year => "Please, enter a car year";
  String get form_validator_date_format => "Wrong date format";
  String get form_validator_dot => "Use dot for groups of digits";
  String get form_warning_fill_info => "Fill in the required information";
  String get image_deleted => "Image deleted";
  String get km => " km";
  String get login => "SIGN IN:";
  String get new_image_info => "* a new image can be selected on the list of your cars page";
  String get odometer => "odometer";
  String get parts => "Parts: ";
  String get password => "Password";
  String get pick_image => "Pick Image";
  String get registration => "Create an Account";
  String get signin => "SIGN IN";
  String get signin_with_google => "SIGN IN WITH GOOGLE";
  String get snack_bar_message_warning => "The form is filled incorrectly! Correct the mistakes";
  String get statistics => "Statistics";
  String get will_pop_alert => "Exit the App?";
  String get works => "Works: ";
  String car_card_mileage(String mileage) => "Mileage: $mileage km";
  String dashboard_page_maintenance_before(String daysRemain, String mileageRemain) => "$daysRemain days or $mileageRemain km left before the next maintenance operation";
  String dashboard_page_missed_maintenance(String mileageFromLast) => "You missed a maintenance operation, your mileage was over $mileageFromLast km";
  String dashboard_page_missed_maintenance_days(String daysOver) => "You missed a maintenance operation for $daysOver days";
  String entry_details_page_description(String entryDateLimit2, String entryMileageLimit2) => "This maintenance must be performed every $entryDateLimit2 months or $entryMileageLimit2 kilometers (whichever comes first)";
  String form_alert_car_mark(String mark) => "Car mark: $mark";
  String form_alert_car_mileage(String mileage) => "Mileage: $mileage";
  String form_alert_car_model(String model) => "Car model: $model";
  String form_alert_car_name(String name) => "Car name: $name";
  String form_alert_car_year(String year) => "Car year: $year";
  String get form_decorator_value_parts => "Value of parts";
  String get form_decorator_value_work => "Value of work";
}

class $ru extends S {
  const $ru();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get form_decorator_car_mileage => "Введите текущий пробег";
  @override
  String get form_decorator_date_select => "Выберите дату";
  @override
  String get date => "дата выполнения";
  @override
  String get form_decorator_odometer_value => "Текущий пробег, км";
  @override
  String get form_decorator_car_vin => "Введите VIN *необязательно";
  @override
  String get drawer_my_cars => "Мои автомобили";
  @override
  String get enter_password => "Введите пароль";
  @override
  String get form_validator_car_year => "Пожалуйста, введите год выпуска";
  @override
  String get form_decorator_car_name => "Придумайте название авто";
  @override
  String get form_initial_my_car => "Моя машина";
  @override
  String get dashboard_page_welcome_thanks => "Спасибо, что Вы с нами!";
  @override
  String get password => "Пароль";
  @override
  String get car_card_alert_dialog_title => "Удалить автомобиль из списка?";
  @override
  String get form_switch_check => "Проверка";
  @override
  String get form_validator_car_mileage => "Пожалуйста, введите текущий пробег";
  @override
  String get form_decorator_part_name => "Расходные материалы / запчасти";
  @override
  String get signin => "ВХОД";
  @override
  String get car_card_no_image_selected => "Изображение не выбрано";
  @override
  String get form_decorator_value_parts => "Стоимость запчастей";
  @override
  String get form_validator_dot => "Используйте точку для групп разрядов";
  @override
  String get form_decorator_car_year => "Введите год выпуска";
  @override
  String get odometer => "пробег";
  @override
  String get pick_image => "Выбрать изображение";
  @override
  String get form_decorator_notes => "Заметки";
  @override
  String get dashboard_page_welcome => "Добро пожаловать в TurboStat!";
  @override
  String get car_card_content_text => "Вы удалите автомобиль из списка транспортных средств без возможности восстановления";
  @override
  String get add_car_page_description => "На этой странице необходимо ввести информацию о Вашем автомобиле:";
  @override
  String get form_warning_fill_info => "Заполните необходимую информацию";
  @override
  String get button_edit_camel => "Изменить";
  @override
  String get edit_car_page_title => "Редактировать информацию об автомобиле:";
  @override
  String get dashboard_page_not_determinate_title => "Нет информации о проведении ТО";
  @override
  String get button_delete_camel => "Удалить";
  @override
  String get will_pop_alert => "Выйти из приложения?";
  @override
  String get parts => "Запчасти:";
  @override
  String get form_decorator_car_model => "Введите модель автомобиля";
  @override
  String get registration => "Зарегистрироваться";
  @override
  String get form_switch_replacement => "Замена";
  @override
  String get add_entry_page_description => "На этой странице необходимо ввести название проверки или операции регламента технического обслуживания автомобиля, а также периодичность проверки.";
  @override
  String get image_deleted => "Фотография удалена";
  @override
  String get button_cancel => "ОТМЕНА";
  @override
  String get form_decorator_select_maintenance => "Выберите проверку из списка";
  @override
  String get form_alert_details => "Детали";
  @override
  String get works => "Работа:";
  @override
  String get drawer_add_car => "Добавить автомобиль";
  @override
  String get snack_bar_message_warning => "Форма заполнена некорректно! Исправьте ошибки...";
  @override
  String get add_maintenance_operation => "Записать операцию ТО";
  @override
  String get delete_entry_operation_warning => "Вы удалите текущую запись без возможности восстановления";
  @override
  String get delete_image => "Удалить фотографию";
  @override
  String get form_validator_car_name => "Пожалуйста, введите название";
  @override
  String get form_decorator_car_mark => "Введите марку автомобиля";
  @override
  String get button_save => "СОХРАНИТЬ";
  @override
  String get login => "ВХОД В ПРИЛОЖЕНИЕ:";
  @override
  String get form_decorator_maintenance_name => "Название проверки или вида ТО";
  @override
  String get form_validator_car_model => "Пожалуйста, введите модель авто";
  @override
  String get form_validator_date_format => "Неправильный формат даты";
  @override
  String get form_decorator_value_work => "Стоимость работ";
  @override
  String get add_maintenance_regular => "Добавить регламент ТО";
  @override
  String get button_add_calendar_camel => "Напомнить";
  @override
  String get button_delete => "УДАЛИТЬ";
  @override
  String get form_decorator_maintenance_interval_km => "Периодичность, км";
  @override
  String get km => " км";
  @override
  String get add_operation_page_description => "На этой странице необходимо записать выполненную проверку или операцию ТО, показания одометра, использованные расходники или запчасти";
  @override
  String get delete_entry_operation => "Удалить запись?";
  @override
  String get car_list_page_warning => "Для начала работы с программой нужно добавить хотя бы один автомобиль";
  @override
  String get form_decorator_maintenance_interval => "Периодичность, мес";
  @override
  String get edit_entry_page_title => "Редактировать информацию вида технического обслуживания:";
  @override
  String get button_edit => "ИЗМЕНИТЬ";
  @override
  String get button_add_car => "ДОБАВИТЬ АВТО";
  @override
  String get already_have_account => "Есть аккаунт? Войти";
  @override
  String get car_card_enter_current_mileage => "Введите текущий пробег";
  @override
  String get enter_email => "Введите Email";
  @override
  String get form_validator_car_mark => "Пожалуйста, введите марку автомобиля";
  @override
  String get car_card_change => "Изменить";
  @override
  String get drawer_logout => "Выход из аккаунта";
  @override
  String get new_image_info => "* новую фотографию можно выбрать на странице списка Ваших машин";
  @override
  String get drawer_not_logged => "Вход не выполнен";
  @override
  String get signin_with_google => "ВХОД ЧЕРЕЗ GOOGLE";
  @override
  String get form_validator_car_vin => "Пожалуйста, введите VIN";
  @override
  String get form_decorator_date => "Дата проверки (операции)";
  @override
  String get statistics => "Статистика";
  @override
  String form_alert_car_year(String year) => "Год выпуска: $year";
  @override
  String dashboard_page_missed_maintenance(String mileageFromLast) => "Вы пропустили операцию ТО, пробег сверх нормы составил $mileageFromLast км";
  @override
  String form_alert_car_model(String model) => "Модель: $model";
  @override
  String entry_details_page_description(String entryDateLimit2, String entryMileageLimit2) => "Эту операцию ТО необходимо выполнять каждые $entryDateLimit2 мес или $entryMileageLimit2 км (в зависимости от того, что наступит раньше)";
  @override
  String form_alert_car_mark(String mark) => "Марка: $mark";
  @override
  String car_card_mileage(String mileage) => "Пробег: $mileage км";
  @override
  String form_alert_car_mileage(String mileage) => "Пробег: $mileage";
  @override
  String dashboard_page_maintenance_before(String daysRemain, String mileageRemain) => "До следующей операции ТО осталось $daysRemain дней или $mileageRemain км";
  @override
  String dashboard_page_missed_maintenance_days(String daysOver) => "Вы пропустили операцию ТО на $daysOver дней";
  @override
  String form_alert_car_name(String name) => "Имя: $name";
}

class $en extends S {
  const $en();
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("ru", ""),
      Locale("en", ""),
    ];
  }

  LocaleListResolutionCallback listResolution({Locale fallback, bool withCountry = true}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported, withCountry);
      }
    };
  }

  LocaleResolutionCallback resolution({Locale fallback, bool withCountry = true}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported, withCountry);
    };
  }

  @override
  Future<S> load(Locale locale) {
    final String lang = getLang(locale);
    if (lang != null) {
      switch (lang) {
        case "ru":
          S.current = const $ru();
          return SynchronousFuture<S>(S.current);
        case "en":
          S.current = const $en();
          return SynchronousFuture<S>(S.current);
        default:
          // NO-OP.
      }
    }
    S.current = const S();
    return SynchronousFuture<S>(S.current);
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale, true);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;

  ///
  /// Internal method to resolve a locale from a list of locales.
  ///
  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported, bool withCountry) {
    if (locale == null || !_isSupported(locale, withCountry)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  ///
  /// Returns true if the specified locale is supported, false otherwise.
  ///
  bool _isSupported(Locale locale, bool withCountry) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        // Language must always match both locales.
        if (supportedLocale.languageCode != locale.languageCode) {
          continue;
        }

        // If country code matches, return this locale.
        if (supportedLocale.countryCode == locale.countryCode) {
          return true;
        }

        // If no country requirement is requested, check if this locale has no country.
        if (true != withCountry && (supportedLocale.countryCode == null || supportedLocale.countryCode.isEmpty)) {
          return true;
        }
      }
    }
    return false;
  }
}

String getLang(Locale l) => l == null
  ? null
  : l.countryCode != null && l.countryCode.isEmpty
    ? l.languageCode
    : l.toString();
