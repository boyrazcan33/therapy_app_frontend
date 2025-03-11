import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization/app_localizations.dart';
import 'routes.dart';
import 'themes/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Enable debug profiling ONLY in debug mode
  assert(() {
    debugProfileBuildsEnabled = true;
    return true;
  }());

  runApp(const OnnJoyApp());
}

/// ✅ Centralized App Configuration
class AppConfig {
  static const String appTitle = 'OnnJoy';
  static const Locale defaultLocale = Locale('en', '');

  static const List<Locale> supportedLocales = [
    Locale('en', ''),
    Locale('et', ''),
    Locale('lv', ''),
    Locale('lt', ''),
    Locale('ru', ''),
  ];

  static final List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    const AppLocalizationsDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
}

/// ✅ Main App Widget
class OnnJoyApp extends StatelessWidget {
  const OnnJoyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appTitle,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // ✅ Supports system-wide theme settings
      supportedLocales: AppConfig.supportedLocales,
      localizationsDelegates: AppConfig.localizationsDelegates,
      localeResolutionCallback: (locale, supportedLocales) {
        return supportedLocales.firstWhere(
              (supportedLocale) => supportedLocale.languageCode == locale?.languageCode,
          orElse: () => AppConfig.defaultLocale,
        );
      },
      initialRoute: Routes.welcome,
      routes: appRoutes,
      onGenerateRoute: generateRoute, // ✅ Handles dynamic routes with parameters
    );
  }
}
