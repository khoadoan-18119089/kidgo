import 'package:kidgo/commom/format.dart';
import 'package:kidgo/components/form/form_item.dart/form_item_model.dart';

extension DisplayEXT<T> on FormItem<T> {
  String displayEXT(T? value) {
    switch (type) {
      case FormItemType.text:
        return _text(value);
      case FormItemType.phone:
        return _phone(value);
      case FormItemType.email:
        return _text(value);
      case FormItemType.password:
        return _text(value);
      case FormItemType.dateTime:
        return _dateTime(value);
      case FormItemType.radio:
        return '';
      case FormItemType.otp:
        return _otp(value);
    }
  }

  String _text(T? value) {
    String? text;
    if (value is String) text = value;
    return text ?? '';
  }

  String _phone(T? value) {
    String? phone;
    if (value is String) phone = value;
    if (phone == null) return '';
    return phone.phoneNumber();
  }

  String _dateTime(T? value) {
    DateTime? date;
    if (value is DateTime) date = value;
    if (date == null) return '';
    return date.toDate();
  }

  String _otp(T? value) {
    int? otp;
    if (value is int) otp = value;
    if (otp == null) return '';
    return otp.toString();
  }
}
