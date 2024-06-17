import 'package:flutter/material.dart';
import 'package:kidgo/components/form/cus_form_field.dart';
import 'package:kidgo/components/form/cus_text_field.dart';
import 'package:kidgo/components/form/form_item.dart/extension/format_ext.dart';

class CusTextFormField extends CusFormField<String> {
  CusTextFormField({
    super.key,
    required super.formItem,
    Widget? prefixIcon,
  }) : super(
          builder: (field) {
            return CusTextField(
              key: key,
              prefixIcon: prefixIcon,
              controller: field.textController,
              lable: formItem.lable,
              lableText: formItem.lableText,
              hintText: formItem.hintText,
              errorText: field.errorText,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                field.didChange(formItem.tryCast(value));
              },
            );
          },
        );

  @override
  CusFormFieldState<String> createState() => _CusTextFormFieldState();
}

class _CusTextFormFieldState extends CusFormFieldState<String> {
  @override
  void initState() {
    textController.text = widget.formItem.display(initialValue);
    super.initState();
  }

  @override
  void updateTextController() {
    textController.text = item.display(value);
  }
}