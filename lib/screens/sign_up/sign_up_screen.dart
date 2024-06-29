import 'package:flutter/material.dart';
import 'package:kidgo/commom/field_name.dart';
import 'package:kidgo/commom/icon.dart';
import 'package:kidgo/components/cus_button.dart';
import 'package:kidgo/components/cus_icon.dart';
import 'package:kidgo/components/cus_text.dart';
import 'package:kidgo/components/form/cus_date_time_form_field.dart';
import 'package:kidgo/components/form/cus_email_form_field.dart';
import 'package:kidgo/components/form/cus_form.dart';
import 'package:kidgo/components/form/cus_form_save.dart';
import 'package:kidgo/components/form/cus_phone_form_field.dart';
import 'package:kidgo/components/form/cus_radio_form_field.dart';
import 'package:kidgo/components/form/cus_text_form_field.dart';
import 'package:kidgo/components/form/form_item.dart/form_item_model.dart';
import 'package:kidgo/main.dart';
import 'package:kidgo/my_app/route/screens.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: MyApp.unfocus,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CusForm(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                const CusText.titleLarge('Tạo tài khoản\nmới'),
                const CusText.bodyMedium(
                    'Vui lòng nhập thông tin vào ô trống để tạo tài khoản.'),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _name(),
                      const SizedBox(height: 16),
                      _email(),
                      const SizedBox(height: 16),
                      _phone(),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 58,
                            child: _birth(),
                          ),
                          Flexible(
                            flex: 42,
                            child: _gender(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _xacNhan(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _name() {
    return CusTextFormField(
      prefixIcon: CusIcon(icon: MyIcons.user),
      textInputAction: TextInputAction.next,
      formItem: FormItem<String>(
        fieldName: FieldName.userName,
        isRequired: true,
        hintText: 'Họ và tên',
      ),
    );
  }

  Widget _email() {
    return CusEmailFormField(
      prefixIcon: CusIcon(icon: MyIcons.email),
      textInputAction: TextInputAction.next,
      formItem: FormItem<String>(
        fieldName: FieldName.email,
        isRequired: true,
        hintText: 'Email',
      ),
    );
  }

  Widget _phone() {
    return CusPhoneFormField(
      prefixIcon: CusIcon(icon: MyIcons.phone1),
      textInputAction: TextInputAction.done,
      formItem: FormItem<String>(
        fieldName: FieldName.phoneNumber,
        isRequired: true,
        hintText: 'Số điện thoại',
      ),
    );
  }

  Widget _birth() {
    return CusDateTimeFormField(
      prefixIcon: CusIcon(icon: MyIcons.calendar),
      formItem: FormItem<DateTime>(
        fieldName: FieldName.birth,
        isRequired: true,
        hintText: 'Ngày sinh',
      ),
    );
  }

  Widget _gender() {
    return CusRadioFormField(
      isRequired: true,
      list: const [
        {
          'ID': 1,
          'TITLE': 'Nam',
        },
        {
          'ID': 2,
          'TITLE': 'Nữ',
        }
      ],
    );
  }

  Widget _xacNhan() {
    return Center(
      child: CusFormSave(
        builder: (context, canSave) {
          return CusButton.elevated(
            isExpanded: true,
            // disable: !canSave,
            text: 'Xác nhận',
            onPressed: () {
              MyApp.to(context, screen: Screens.otp);
            },
          );
        },
      ),
    );
  }
}
