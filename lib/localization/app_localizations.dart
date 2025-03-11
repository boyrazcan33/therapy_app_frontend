import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;
  static final Map<String, String> _localizedStrings = {}; //  Singleton cache for efficiency

  AppLocalizations(this.locale);

  ///  Retrieve the localization instance
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// Load the localization JSON file once and store in memory
  Future<void> load() async {
    if (_localizedStrings.isNotEmpty) return; //  Prevent multiple loads

    try {
      String jsonString = await rootBundle.loadString('assets/localization/${locale.languageCode}.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      _localizedStrings.addAll(jsonMap.map((key, value) => MapEntry(key, value.toString())));
    } catch (e) {
      print("Error loading localization file: $e");
    }
  }

  /// Retrieve a translated string, fallback to key if missing
  String translate(String key) {
    return _localizedStrings[key] ?? key; //  Always return a fallback
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'et', 'lv', 'lt', 'ru'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false; //  No need to reload dynamically
}
