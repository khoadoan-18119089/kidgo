import 'package:kidgo/commom/field_name.dart';
import 'package:kidgo/commom/format.dart';
import 'package:kidgo/commom/methods.dart';

class CalendarModel {
  final Map<String, Object?>? data;

  CalendarModel(this.data);

  DateTime? get dateTime =>
      Methods.getDateTime(data, fieldName: FieldName.dateTime);

  String get weekday => dateTime.toWeekDay().replaceFirst(' ', '\n');

  String get date => dateTime.tofullDate();

  String get begin =>
      Methods.getDuration(data, fieldName: FieldName.begin).toAMPM();

  String get end =>
      Methods.getDuration(data, fieldName: FieldName.end).toAMPM();
}
