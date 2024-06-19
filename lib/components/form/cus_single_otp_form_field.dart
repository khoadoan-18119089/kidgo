import 'package:flutter/material.dart';
import 'package:kidgo/commom/methods.dart';
import 'package:kidgo/components/form/cus_form_field.dart';
import 'package:kidgo/components/form/cus_text_field.dart';
import 'package:kidgo/components/form/form_item.dart/extension/format_ext.dart';
import 'package:kidgo/components/form/form_item.dart/form_item_model.dart';
import 'package:kidgo/main.dart';

class CusSingleOtpFormField extends CusFormField<int> {
  CusSingleOtpFormField({
    super.key,
    required super.formItem,
    this.nextAction,
    this.previousAction,
    void Function(String)? onChanged,
  }) : super(
          builder: (field) {
            return SizedBox(
              height: 60,
              width: 50,
              child: CusTextField(
                autofocus: true,
                showCursor: false,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: field.textController,
                maxLength: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  counterText: '',
                ),
                onChanged: (value) {
                  field.didChange(formItem.tryCast(value));
                },
              ),
            );
          },
        );

  final TextInputAction? nextAction;

  final TextInputAction? previousAction;

  @override
  CusFormFieldState<int> createState() => _CusSingleOtpFormFieldState();
}

class _CusSingleOtpFormFieldState extends CusFormFieldState<int> {
  @override
  CusSingleOtpFormField get widget => super.widget as CusSingleOtpFormField;

  TextInputAction? get _nextAction => widget.nextAction;

  TextInputAction? get _previousAction => widget.previousAction;

  @override
  void initState() {
    item.updateType(FormItemType.otp);
    super.initState();
  }

  @override
  void didChange(int? value) {
    if (value != null) {
      if (_nextAction == TextInputAction.next) {
        MyApp.nextFocus();
      }
      if (_nextAction == TextInputAction.done) {
        MyApp.unfocus();
      }
    } else {
      if (_previousAction == TextInputAction.previous) {
        MyApp.previousFocus();
      }
    }
    super.didChange(value);
  }
}
