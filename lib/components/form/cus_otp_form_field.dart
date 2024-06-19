import 'package:flutter/material.dart';
import 'package:kidgo/components/form/cus_single_otp_form_field.dart';
import 'package:kidgo/components/form/form_item.dart/form_item_model.dart';

class CusOtpFormField extends StatelessWidget {
  const CusOtpFormField({super.key});

  static const int otpLength = 6;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        otpLength,
        (index) {
          return CusSingleOtpFormField(
            formItem: FormItem<int>(
              fieldName: index.toString(),
            ),
            nextAction: index == otpLength - 1
                ? TextInputAction.done
                : TextInputAction.next,
            previousAction: index == 0 ? null : TextInputAction.previous,
          );
        },
      ),
    );
  }
}
