import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kidgo/bloc/form/form_controller_bloc.dart';
import 'package:kidgo/commom/icon.dart';
import 'package:kidgo/components/countdown_timer.dart';
import 'package:kidgo/components/cus_button.dart';
import 'package:kidgo/components/cus_dialog.dart';
import 'package:kidgo/components/cus_text.dart';
import 'package:kidgo/components/form/cus_form.dart';
import 'package:kidgo/components/form/cus_form_save.dart';
import 'package:kidgo/components/form/cus_otp_form_field.dart';
import 'package:kidgo/main.dart';
import 'package:kidgo/my_app/route/screens.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CusForm(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              const CusText.titleLarge('Mã OTP đã\nđược gửi'),
              const CusText.bodyMedium(
                  'Hãy điền mã OTP từ điện thoại của bạn để xác nhận.'),
              const SizedBox(height: 16),
              const CusOtpFormField(),
              const SizedBox(height: 32),
              _xacNhan(),
              const SizedBox(height: 24),
              _guiOTP(),
            ],
          ),
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
            onPressed: () {
              String otp = context
                  .read<FormControllerBloc>()
                  .saveTempData()
                  .values
                  .join('');
              showDialog(
                context: context,
                builder: (_) {
                  return otp == '123456'
                      ? _dialogRight(context)
                      : _dialogWrong(context);
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _guiOTP() {
    return const Center(
      child: CountdownTimer(
        text: 'Chưa nhận được mã?',
        textButton: 'Gửi lại',
      ),
    );
  }

  Widget _dialogRight(BuildContext context) {
    return CusDialog(
      titleBuilder: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CusText.titleLarge('Tạo tài khoản mới\nthành công!'),
          CusText.bodyMedium(
              'Vui lòng quay lại để đăng nhập vào tài khoản mới.'),
        ],
      ),
      contentBuilder: Image.asset(
        MyIcons.alertRight,
        width: MediaQuery.of(context).size.width * 0.5,
      ),
      textBotton: 'Quay lại',
      onPressed: () => MyApp.popUntil(
        context,
        screen: Screens.login,
      ),
    );
  }

  Widget _dialogWrong(BuildContext context) {
    return CusDialog(
      titleBuilder: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CusText.titleLarge('Không xác nhận\nđược mã OTP'),
          CusText.bodyMedium('Vui lòng thử lại.'),
        ],
      ),
      contentBuilder: Image.asset(
        MyIcons.alertWrong,
        width: MediaQuery.of(context).size.width * 0.5,
      ),
      textBotton: 'Quay lại',
      onPressed: () => MyApp.back(context),
    );
  }
}
