import 'package:finjoy_app/core/locale/language.dart';
import 'package:finjoy_app/core/locale/language_en.dart';
import 'package:finjoy_app/core/locale/language_mar.dart';
import 'package:finjoy_app/core/locale/language_tam.dart';
import 'package:finjoy_app/core/locale/language_hi.dart';
import 'package:flutter/material.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'hi', 'mr', 'ta'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      case 'hi':
        return LanguageHi();
      case 'mr':
        return LanguageMAR();
      case 'ta':
        return LanguageTAM();
      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
