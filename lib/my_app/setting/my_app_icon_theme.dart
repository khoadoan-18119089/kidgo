import 'package:flutter/material.dart';
import 'package:kidgo/my_app/setting/my_app_colors.dart';
import 'package:kidgo/my_app/setting/my_app_theme.dart';

extension MyAppIconTheme on MyAppTheme {
  IconThemeData get myAppIconTheme => IconThemeData(
    color: iconColor,
  );
}
