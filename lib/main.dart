import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kidgo/my_app/route/routes.dart';
import 'package:kidgo/my_app/route/screems.dart';
import 'package:kidgo/my_app/setting/my_app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('vi', 'VN'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'KidGo',
      theme: _theme.myAppTheme,
      initialRoute: _routes.initialRoute,
      onGenerateRoute: _routes.onGenerateRoute,
    );
  }

  static final MyAppTheme _theme = MyAppTheme.intanse;
  static final Routes _routes = Routes.intanse;

  static Future<T?> to<T extends Object?>(
    BuildContext context, {
    required Screems screem,
    Map<String, Object?>? arguments,
  }) {
    return Navigator.pushNamed(
      context,
      screem.path,
      arguments: arguments,
    );
  }

  static void back<T extends Object?>(
    BuildContext context, {
    Object? result,
  }) {
    Navigator.pop(context, result);
  }
}
