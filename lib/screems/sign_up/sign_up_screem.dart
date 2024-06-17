import 'package:flutter/material.dart';
import 'package:kidgo/commom/field_name.dart';
import 'package:kidgo/commom/icon.dart';
import 'package:kidgo/components/cus_icon.dart';
import 'package:kidgo/components/cus_text.dart';
import 'package:kidgo/components/form/cus_date_time_form_field.dart';
import 'package:kidgo/components/form/cus_email_form_field.dart';
import 'package:kidgo/components/form/cus_form.dart';
import 'package:kidgo/components/form/cus_phone_form_field.dart';
import 'package:kidgo/components/form/cus_radio_form_field.dart';
import 'package:kidgo/components/form/cus_text_form_field.dart';
import 'package:kidgo/components/form/form_item.dart/form_item_model.dart';

class SignUpScreem extends StatelessWidget {
  const SignUpScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CusForm(
          child: SingleChildScrollView(
            child: Column(
              children: [  
                const CusText.titleLarge('Tạo tài khoản'),
                const CusText.titleLarge('mới'),
                const CusText.bodyMedium(
                    'Vui lòng nhập thông tin vào ô trống để tạo tài khoản.'),
                CusTextFormField(
                  prefixIcon: CusIcon(icon: MyIcons.user),
                  formItem: FormItem<String>(
                    fieldName: FieldName.userName,
                    isRequired: true,
                    hintText: 'Họ và tên',
                  ),
                ),
                CusEmailFormField(
                  prefixIcon: CusIcon(icon: MyIcons.email),
                  formItem: FormItem<String>(
                    fieldName: FieldName.email,
                    isRequired: true,
                    hintText: 'Email',
                  ),
                ),
                CusPhoneFormField(
                  prefixIcon: CusIcon(icon: MyIcons.phone1),
                  formItem: FormItem<String>(
                    fieldName: FieldName.phoneNumber,
                    isRequired: true,
                    hintText: 'Số điện thoại',
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 58,
                      child: CusDateTimeFormField(
                        prefixIcon: CusIcon(icon: MyIcons.birth),
                        formItem: FormItem<DateTime>(
                          fieldName: FieldName.birth,
                          isRequired: true,
                          hintText: 'Ngày sinh',
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 42,
                      child: CusRadioFormField(
                        list: const [
                          {
                            'ID': 1,
                            'TITLE': 'Nam',
                          },
                          {
                            'ID':2,
                            'TITLE':'Nữ',
                          }
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
