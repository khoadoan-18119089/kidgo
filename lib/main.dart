import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kidgo/my_app/controller/shared_preferences_helper.dart';
import 'package:kidgo/my_app/route/routes.dart';
import 'package:kidgo/my_app/route/screens.dart';
import 'package:kidgo/my_app/setting/my_app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper().onInit();
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
  static final FocusManager _focusManager = FocusManager.instance;
  static final SharedPreferencesHelper prefs = SharedPreferencesHelper.intanse;

  static Future<T?> to<T extends Object?>(
    BuildContext context, {
    required Screens screen,
    Map<String, Object?>? arguments,
  }) {
    return Navigator.pushNamed(
      context,
      screen.path,
      arguments: arguments,
    );
  }

  static void back<T extends Object?>(
    BuildContext context, {
    Object? result,
  }) {
    Navigator.pop(context, result);
  }

  ///Quay về màn hình trước đó cho đến khi gặp được màn hình mà chúng ta định danh cụ thể
  static void popUntil(
    BuildContext context, {
    required Screens screen,
  }) {
    return Navigator.popUntil(
      context,
      ModalRoute.withName(screen.path),
    );
  }

  ///Quay lại màn hình trước đó, đồng thời cũng chuyển luôn qua màn hình mới
  static Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    BuildContext context, {
    required Screens screen,
    TO? result,
    Object? arguments,
  }) {
    return Navigator.popAndPushNamed(
      context,
      screen.path,
      result: result,
      arguments: arguments,
    );
  }

  static void unfocus() {
    _focusManager.primaryFocus?.unfocus();
  }

  static bool nextFocus() {
    return _focusManager.primaryFocus?.nextFocus() ?? false;
  }

  static bool previousFocus() {
    return _focusManager.primaryFocus?.previousFocus() ?? false;
  }
}
