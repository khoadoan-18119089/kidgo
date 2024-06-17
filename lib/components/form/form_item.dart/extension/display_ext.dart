import 'package:intl/intl.dart';
import 'package:kidgo/components/form/form_item.dart/extension/format_ext.dart';
import 'package:kidgo/components/form/form_item.dart/form_item_model.dart';

extension DisplayEXT<T> on FormItem<T> {
  String displayEXT(T? value) {
    switch (type) {
      case FormItemType.text:
        return _phone(value);
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
    return formatPhoneNumber(phone ?? '');
  }

  String _dateTime(T? value) {
    DateTime? date;
    if (value is DateTime) date = value;
    if (date == null) return '';
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
