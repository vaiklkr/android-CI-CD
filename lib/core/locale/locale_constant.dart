// ignore_for_file: use_build_context_synchronously

import 'package:finjoy_app/main.dart';
import 'package:flutter/material.dart';

const String prefSelectedLanguageCode = "SelectedLanguageCode";

Future<Locale> setLocale(String languageCode) async {
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  return _locale('en');
}

Locale _locale(String languageCode) {
  return languageCode.isNotEmpty
      ? Locale(languageCode, '')
      : const Locale('en', '');
}

void changeLanguage(BuildContext context, String selectedLanguageCode) async {
  var locale = await setLocale(selectedLanguageCode);
  MyApp.setLocale(context, locale);
}
