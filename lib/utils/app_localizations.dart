
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;
  // ignore: sort_constructors_first
  AppLocalizations(this.locale);
  
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  Map<String, String> _localizedStrings;

  Future<bool> load() async{
    final String jsonString = await rootBundle.loadString('lang/${locale.languageCode}.json');
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    _localizedStrings = jsonMap.map((String key, dynamic value) => MapEntry<String, String>(key, value.toString()));
    return true;
  }

  String translate(String key) {
    return _localizedStrings[key];
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) => <String>['en', 'ru', 'ua'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async{
    final AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }
  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
   return false;
  }
}