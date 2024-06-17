import 'package:kidgo/components/form/form_item.dart/form_item_model.dart';

extension MessegeEXT<T> on FormItem<T> {
  String get invalid => 'Vui lòng nhập thông tin';

  String get customInvalid {
    switch (type) {
      case FormItemType.text:
        return invalid;
      case FormItemType.email:
        return 'Vui lòng nhập email hợp lệ';
      case FormItemType.password:
        return 'Mật khẩu phải có ít nhất 6 ký tự';
      case FormItemType.phone:
        return 'Vui lòng nhập số điện thoại hợp lệ';
      case FormItemType.dateTime:
        return 'Vui lòng nhập ngày sinh hợp lệ';
      case FormItemType.radio:
        return 'Vui lòng chọn thông tin';
    }
  }
}
