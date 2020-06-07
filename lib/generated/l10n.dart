// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S();
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S();
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  String get simpleText {
    return Intl.message(
      'Hello',
      name: 'simpleText',
      desc: '',
      args: [],
    );
  }

  String get workoutText {
    return Intl.message(
      'Workout',
      name: 'workoutText',
      desc: '',
      args: [],
    );
  }

  String get meetskypeText {
    return Intl.message(
      'Meet skype Been',
      name: 'meetskypeText',
      desc: '',
      args: [],
    );
  }

  String get othertaskText {
    return Intl.message(
      'Other tasks',
      name: 'othertaskText',
      desc: '',
      args: [],
    );
  }

  String get hometaskText {
    return Intl.message(
      'Home Tasks',
      name: 'hometaskText',
      desc: '',
      args: [],
    );
  }

  String get buymilktaskText {
    return Intl.message(
      'Buy milk',
      name: 'buymilktaskText',
      desc: '',
      args: [],
    );
  }

  String get listText {
    return Intl.message(
      'List',
      name: 'listText',
      desc: '',
      args: [],
    );
  }

  String get workText {
    return Intl.message(
      'Work',
      name: 'workText',
      desc: '',
      args: [],
    );
  }

  String get personalText {
    return Intl.message(
      'Personal',
      name: 'personalText',
      desc: '',
      args: [],
    );
  }

  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  String get systemLanguage {
    return Intl.message(
      'System language',
      name: 'systemLanguage',
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
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'it'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}