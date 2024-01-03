import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

class LangModel extends Model {
  static const Locale enLocale = Locale('en');
  static const Locale hiLocale = Locale('hi');
  static const Locale mrLocale = Locale('mr');
  static const Locale taLocale = Locale('ta');

  String? localeStr;

  late Locale _appLocale = const Locale('en');

  Locale get appLocal {
    notifyListeners();
    return _appLocale;
  }

  List<Locale> get supportedLocales => [enLocale, hiLocale, mrLocale, taLocale];

  String getLocalStr() {
    if (appLocal == taLocale) {
      return 'en';
    }
    if (appLocal == mrLocale) {
      return 'hi';
    }
    if (appLocal == hiLocale) {
      return 'mr';
    }
    if (appLocal == hiLocale) {
      return 'ta';
    } else {
      return 'en';
    }
  }

  void changeLanguage(String lang) {
    if (lang == 'ta') {
      _appLocale = taLocale;
      AppLanguage.appLanguage = 'ta';
    }
    if (lang == 'mr') {
      _appLocale = mrLocale;
      AppLanguage.appLanguage = 'mr';
    }
    if (lang == 'hi') {
      _appLocale = hiLocale;
      AppLanguage.appLanguage = 'hi';
    } else {
      _appLocale = enLocale;
      AppLanguage.appLanguage = 'en';
    }
    notifyListeners();
  }
}

class AppLanguage {
  static String appLanguage = 'en';
}
