import 'package:kidgo/components/form/form_item.dart/form_item_model.dart';

extension FormatEXT<T> on FormItem<T> {
  T? tryCast(String? value) {
    if (value == null) return null;
    if (T == String ||
        FormItemType.values
            .where((item) => item.type == String)
            .contains(type)) {
      if (value.isEmpty) {
        return null;
      }
      return value as T;
    }
    return null;
  }


  String formatPhoneNumber(String number) {
    RegExpMatch? match;
    RegExp exp;
    String phone = number.replaceAll(RegExp(r'[^\d]'), '');
    String output = phone;
    if (phone.length > 3 && phone.length < 7) {
      exp = RegExp(r'^(\d{3})(\d{1,3})');
      match = exp.firstMatch(phone);
      if (match != null && match.group(1) != null && match.group(2) != null) {
        output = '(${match.group(1)}) ${match.group(2)}';
      }
    } else if (phone.length <= 10) {
      exp = RegExp(r'^(\d{3})(\d{3})(\d{1,4})');
      match = exp.firstMatch(phone);
      if (match != null &&
          match.group(1) != null &&
          match.group(2) != null &&
          match.group(3) != null) {
        output = '(${match.group(1)}) ${match.group(2)} ${match.group(3)}';
      }
    }
    return output;
  }
}
