import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:salon_app/core/localization/app_localization.dart';

class AppLocalizationSetup {
  static const Iterable<Locale> supportedLocales = [
    Locale('en'),
    Locale('fr'),
    Locale('de'),
    Locale('es'),
    Locale('ar'),
    Locale('zh'),
  ];

  static const Iterable<LocalizationsDelegate<dynamic>> localizationDelegates =
      [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static Locale? localeResolutionCallback(
      Locale? locale, Iterable<Locale> supportedLocales) {
    for (Locale supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale?.languageCode &&
          supportedLocale.countryCode == locale?.countryCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }
}
