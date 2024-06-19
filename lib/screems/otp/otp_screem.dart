import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kidgo/bloc/form/form_controller_bloc.dart';
import 'package:kidgo/components/cus_button.dart';
import 'package:kidgo/components/form/cus_form.dart';
import 'package:kidgo/components/form/cus_form_save.dart';
import 'package:kidgo/components/form/cus_otp_form_field.dart';

class OtpScreem extends StatelessWidget {
  const OtpScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CusForm(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CusOtpFormField(),
            _xacNhan(),
          ],
        ),
      ),
    );
  } 

  Widget _xacNhan() {
    return Center(
      child: CusFormSave(
        builder: (context, canSave) {
          return CusButton.elevated(
            isExpanded: true,
            disable: !canSave,
            text: 'Xác nhận',
            onPressed: () async {
              print(context.read<FormControllerBloc>().otp());
            },
          );
        },
      ),
    );
  }
}
