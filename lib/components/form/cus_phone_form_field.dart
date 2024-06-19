import 'package:flutter/material.dart';
import 'package:kidgo/components/form/cus_form_field.dart';
import 'package:kidgo/components/form/cus_text_field.dart';
import 'package:kidgo/components/form/form_item.dart/extension/format_ext.dart';
import 'package:kidgo/components/form/form_item.dart/form_item_model.dart';

class CusPhoneFormField extends CusFormField<String> {
  CusPhoneFormField({
    super.key,
    required super.formItem,
    Widget? prefixIcon,
    TextInputAction? textInputAction,
  }) : super(
          builder: (field) {
            return CusTextField(
              key: key,
              textInputAction: textInputAction,
              controller: field.textController,
              lable: formItem.lable,
              lableText: formItem.lableText,
              hintText: formItem.hintText,
              errorText: field.errorText,
              prefixIcon: prefixIcon,
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                field.didChange(formItem.tryCast(value));
              },
            );
          },
        );

  @override
  CusFormFieldState<String> createState() => _CusPhoneFormFieldState();
}

class _CusPhoneFormFieldState extends CusFormFieldState<String> {
  @override
  void initState() {
    item.updateType(FormItemType.phone);
    textController.text = item.display(initialValue);
    super.initState();
  }
}