import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kidgo/commom/field_name.dart';
import 'package:kidgo/commom/icon.dart';
import 'package:kidgo/components/cus_button.dart';
import 'package:kidgo/components/cus_icon.dart';
import 'package:kidgo/components/cus_text.dart';
import 'package:kidgo/components/form/cus_form.dart';
import 'package:kidgo/components/form/cus_form_save.dart';
import 'package:kidgo/components/form/cus_phone_form_field.dart';
import 'package:kidgo/components/form/form_item.dart/form_item_model.dart';
import 'package:kidgo/main.dart';
import 'package:kidgo/my_app/route/screems.dart';

class LoginScreem extends StatelessWidget {
  const LoginScreem({super.key});

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
                const CusText.titleLarge('Chào mừng'),
                const CusText.titleLarge('bạn!'),
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
          onPressed: () {},
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
              ..onTap = () => MyApp.to(context, screem: Screems.signup),
          ),
        ],
      ),
    );
  }
}
