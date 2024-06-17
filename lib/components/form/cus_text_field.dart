import 'package:flutter/material.dart';

class CusTextField extends TextField {
  CusTextField({
    super.key,
    super.controller,
    Widget? lable,
    String? lableText,
    Widget? prefixIcon,
    Color? prefixIconColor,
    String? hintText,
    TextStyle? hintStyle,
    Widget? suffixIcon,
    Color? suffixIconColor,
    InputDecoration? decoration,
    super.onChanged,
    String? errorText,
    super.enabled = true,
    super.keyboardType,
    super.showCursor,
    super.readOnly,
    super.maxLines,
    super.minLines,
    super.onTap,
  }) : super(
          decoration: decoration ??
              InputDecoration(
                label: lable,
                labelText: lable != null ? null : lableText,
                prefixIcon: prefixIcon,
                prefixIconColor: prefixIconColor,
                suffixIcon: suffixIcon,
                suffixIconColor: suffixIconColor,
                hintText: hintText,
                hintStyle: hintStyle,
                errorText: errorText,
              ),
        );
}
