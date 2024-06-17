import 'package:kidgo/commom/field_name.dart';
import 'package:kidgo/commom/methods.dart';

class ReviewModel {
  final Map<String, Object?> data;

  ReviewModel(this.data);

  String get image => Methods.getString(data, fieldName: FieldName.image);

  String get title => Methods.getString(data, fieldName: FieldName.title);

  String get content => Methods.getString(data, fieldName: FieldName.content);
}
