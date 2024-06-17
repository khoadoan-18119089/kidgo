import 'package:flutter/material.dart';
import 'package:kidgo/my_app/setting/my_app_theme.dart';

extension MyAppColors on MyAppTheme {
  Color get scaffoldBackgroundColor => const Color(0XFFE3F5FC);

  Color get titleColor => const Color(0XFF1E5568);

  Color get bodyColor => const Color(0XFF328EAE);

  Color get labelColor => const Color(0XFF328EAE);

  Color get buttonColor => Colors.white;

  Color get buttonBackgroundColor => const Color(0XFF328EAE);

  Color get iconTextFieldColor => const Color(0XFF1E5568);

  Color get errorTextColor => Colors.red;

  Color get iconColor => const Color(0XFF1E5568);

  Color get radioColor => const Color(0XFF1E5568);
}
