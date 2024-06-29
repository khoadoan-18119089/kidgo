import 'package:kidgo/commom/field_name.dart';
import 'package:kidgo/commom/methods.dart';

class ReceiptModel {
  final Map<String, Object?>? data;
  ReceiptModel(this.data);

  String get nameBank => Methods.getString(data, fieldName: FieldName.bank);

  String get codeReceipt =>
      Methods.getString(data, fieldName: FieldName.codeReceipt);
}
