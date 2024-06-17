import 'package:flutter/material.dart';
import 'package:kidgo/my_app/setting/my_app_colors.dart';
import 'package:kidgo/my_app/setting/my_app_theme.dart';

extension MyAppRadioTheme on MyAppTheme {
  RadioThemeData get myAppRadioTheme => RadioThemeData(
    fillColor: WidgetStatePropertyAll(radioColor),
  );
}
