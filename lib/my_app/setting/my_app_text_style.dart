import 'package:flutter/material.dart';
import 'package:kidgo/my_app/setting/my_app_colors.dart';
import 'package:kidgo/my_app/setting/my_app_theme.dart';

extension MyAppTextStyle on MyAppTheme {
  TextTheme get myAppTextTheme => TextTheme(
        titleLarge: _titleLarge,
        titleMedium: _titleMedium,
        titleSmall: _titleSmall,
        bodyMedium: _bodyMedium,
        labelMedium: _labelMedium,
        headlineMedium: _button,
      );

  TextStyle get _titleLarge => TextStyle(
        fontSize: 33,
        fontWeight: FontWeight.w700,
        color: titleColor,
        fontFamily: 'Inter',
      );

  TextStyle get _titleMedium => TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: titleColor,
        fontFamily: 'Inter',
      );

  TextStyle get _titleSmall => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: titleColor,
        fontFamily: 'Inter',
      );

  TextStyle get _bodyMedium => TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: bodyColor,
        fontFamily: 'Inter',
      );

  TextStyle get _labelMedium => TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: labelColor,
        fontFamily: 'Inter',
      );

  TextStyle get _button => TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w700,
        color: buttonColor,
        fontFamily: 'Inter',
      );

  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        labelStyle: _titleSmall,
        hintStyle: _bodyMedium,
        errorStyle: _labelMedium.copyWith(color: errorTextColor),
        prefixIconColor: iconTextFieldColor,
        suffixIconColor: iconTextFieldColor,
        filled: true,
        fillColor: const Color(0XFFfdf7e2),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide(
            color: Color(0XFF1e5568),
            width: 2,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide(
            color: Color(0XFF1e5568),
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide(
            color: Color(0XFF1e5568),
            width: 2,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      );
}
