// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:flutter/material.dart';

class LanguageManager {
  LanguageManager._();
  static LanguageManager? _instance;
  static LanguageManager get instance => _instance ??= LanguageManager._();

  final enLocale = const Locale('en');
  final trLocale = const Locale('tr');

  List<Locale> get supportedLocales => [
        enLocale,
        trLocale,
      ];

  // constants
  static const supportedLanguages = <String>['en', 'tr'];

  Locale getCurrentLocale() => supportedLanguages.contains(getCurrentLang)
      ? Locale(getCurrentLang)
      : const Locale('en');

  Locale get fallbackLocale => enLocale;

  String get getCurrentLang => Platform.localeName.substring(0, 2);

  String get path => 'assets/translation';
}
