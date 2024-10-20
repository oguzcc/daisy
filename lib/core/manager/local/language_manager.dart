// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:flutter/material.dart';

class LanguageManager {
  LanguageManager._();
  static LanguageManager? _instance;
  static LanguageManager get instance => _instance ??= LanguageManager._();

  final enLocale = const Locale('en', 'US');
  final trLocale = const Locale('tr', 'TR');

  List<Locale> get supportedLocales => [enLocale, trLocale];

  // constants
  static const supportedLanguages = <Locale>[
    Locale('en', 'US'),
    Locale('tr', 'TR'),
  ];

  Locale get fallbackLocale => enLocale;

  Locale get getCurrentLocale => Locale(Platform.localeName);

  String get path => 'assets/translation';
}
