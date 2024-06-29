import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kidgo/bloc/form/form_controller_bloc.dart';
import 'package:kidgo/commom/field_name.dart';
import 'package:kidgo/commom/icon.dart';
import 'package:kidgo/commom/methods.dart';
import 'package:kidgo/components/cus_button.dart';
import 'package:kidgo/components/cus_icon.dart';
import 'package:kidgo/components/cus_text.dart';
import 'package:kidgo/components/form/cus_form.dart';
import 'package:kidgo/components/form/cus_form_save.dart';
import 'package:kidgo/components/form/cus_phone_form_field.dart';
import 'package:kidgo/components/form/form_item.dart/form_item_model.dart';
import 'package:kidgo/main.dart';
import 'package:kidgo/my_app/route/screens.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: MyApp.unfocus,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CusForm(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                const CusText.titleLarge('Chào mừng\nbạn!'),
                const CusText.bodyMedium(
                    'Hãy đăng nhập tài khoản để tiếp tục.'),
                const SizedBox(height: 16),
                _phone(),
                const SizedBox(height: 32),
                _dangNhap(),
                const SizedBox(height: 24),
                _taoTaiKhoan(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _phone() {
    return CusPhoneFormField(
      prefixIcon: CusIcon(icon: MyIcons.phone1),
      formItem: FormItem<String>(
        hintText: 'Số điện thoại',
        isRequired: true,
        fieldName: FieldName.phoneNumber,
        initialValue: MyApp.prefs.phomeNumber,
      ),
    );
  }

  Widget _dangNhap() {
    return Center(
      child: CusFormSave(builder: (context, canSave) {
        return CusButton.elevated(
          isExpanded: true,
          disable: !canSave,
          text: 'Đăng nhập',
          onPressed: () {
            String number = Methods.getString(
              context.read<FormControllerBloc>().saveTempData(),
              fieldName: FieldName.phoneNumber,
            );
            if (number == '(037) 968 3482') {
              MyApp.prefs.saveUser(
                phone: number,
                date: DateTime.now(),
              );
              MyApp.to(context, screen: Screens.home);
            }
          },
        );
      }),
    );
  }

  Widget _taoTaiKhoan(BuildContext context) {
    return Center(
      child: CusText.rich(
        'Chưa có tài khoản?  ',
        children: [
          TextSpan(
            text: 'Tạo tài khoản',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 13,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => MyApp.to(context, screen: Screens.signup),
          ),
        ],
      ),
    );
  }
}
