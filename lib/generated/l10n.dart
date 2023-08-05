// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Приглашаю своих дорогих друзей отметить мой день рождения в замечательном месте с множеством развлечений, вкусных блюд и хорошим настроением!`
  String get welcomeMessage {
    return Intl.message(
      'Приглашаю своих дорогих друзей отметить мой день рождения в замечательном месте с множеством развлечений, вкусных блюд и хорошим настроением!',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Список Гостей`
  String get guestList {
    return Intl.message(
      'Список Гостей',
      name: 'guestList',
      desc: '',
      args: [],
    );
  }

  /// `Вишлист`
  String get wishlist {
    return Intl.message(
      'Вишлист',
      name: 'wishlist',
      desc: '',
      args: [],
    );
  }

  /// `Меню`
  String get menu {
    return Intl.message(
      'Меню',
      name: 'menu',
      desc: '',
      args: [],
    );
  }

  /// `Развлечения`
  String get entertainment {
    return Intl.message(
      'Развлечения',
      name: 'entertainment',
      desc: '',
      args: [],
    );
  }

  /// `Место`
  String get place {
    return Intl.message(
      'Место',
      name: 'place',
      desc: '',
      args: [],
    );
  }

  /// `Центральная ул., 84, хутор Седых`
  String get localAdress {
    return Intl.message(
      'Центральная ул., 84, хутор Седых',
      name: 'localAdress',
      desc: '',
      args: [],
    );
  }

  /// `Настольные игры`
  String get boardGames {
    return Intl.message(
      'Настольные игры',
      name: 'boardGames',
      desc: '',
      args: [],
    );
  }

  /// `Мафия, уно, домино, экивоки и другие`
  String get gameCategories {
    return Intl.message(
      'Мафия, уно, домино, экивоки и другие',
      name: 'gameCategories',
      desc: '',
      args: [],
    );
  }

  /// `Бассейн`
  String get pool {
    return Intl.message(
      'Бассейн',
      name: 'pool',
      desc: '',
      args: [],
    );
  }

  /// `Два Бассейна с подгоревом`
  String get twoHeatedPools {
    return Intl.message(
      'Два Бассейна с подгоревом',
      name: 'twoHeatedPools',
      desc: '',
      args: [],
    );
  }

  /// `Свернуть ▲`
  String get collapse {
    return Intl.message(
      'Свернуть ▲',
      name: 'collapse',
      desc: '',
      args: [],
    );
  }

  /// `Развернуть ▼`
  String get expand {
    return Intl.message(
      'Развернуть ▼',
      name: 'expand',
      desc: '',
      args: [],
    );
  }

  /// `День рождения`
  String get birthday {
    return Intl.message(
      'День рождения',
      name: 'birthday',
      desc: '',
      args: [],
    );
  }

  /// `Перейти на сайт места`
  String get visitSite {
    return Intl.message(
      'Перейти на сайт места',
      name: 'visitSite',
      desc: '',
      args: [],
    );
  }

  /// `Хлеб`
  String get bread {
    return Intl.message(
      'Хлеб',
      name: 'bread',
      desc: '',
      args: [],
    );
  }

  /// `Имя`
  String get name {
    return Intl.message(
      'Имя',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Фамилия`
  String get surname {
    return Intl.message(
      'Фамилия',
      name: 'surname',
      desc: '',
      args: [],
    );
  }

  /// `Телефон`
  String get phone {
    return Intl.message(
      'Телефон',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Профессия`
  String get profession {
    return Intl.message(
      'Профессия',
      name: 'profession',
      desc: '',
      args: [],
    );
  }

  /// `Записаться`
  String get enroll {
    return Intl.message(
      'Записаться',
      name: 'enroll',
      desc: '',
      args: [],
    );
  }

  /// `Add New Guest!`
  String get addNewGuest {
    return Intl.message(
      'Add New Guest!',
      name: 'addNewGuest',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong.`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong.',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Ссылка`
  String get link {
    return Intl.message(
      'Ссылка',
      name: 'link',
      desc: '',
      args: [],
    );
  }

  /// `Add new wish!`
  String get addNewWish {
    return Intl.message(
      'Add new wish!',
      name: 'addNewWish',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
