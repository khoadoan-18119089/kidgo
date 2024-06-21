import 'package:intl/intl.dart';

extension StringEXT on String {

  ///(037) 968 3482
  String phoneNumber() {
    RegExpMatch? match;
    RegExp exp;
    String phone = replaceAll(RegExp(r'[^\d]'), '');
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

extension DurationEXT on Duration {
  String _toTwoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }

  /// 05:24:30
  String toHHMMSS() {
    String hours = _toTwoDigits(inHours.remainder(24));
    String minutes = _toTwoDigits(inMinutes.remainder(60));
    String seconds = _toTwoDigits(inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  /// 05:24
  String toHHMM() {
    String hours = _toTwoDigits(inHours.remainder(24));
    String minutes = _toTwoDigits(inMinutes.remainder(60));
    return '$hours:$minutes';
  }

  /// 24:30
  String toMMSS() {
    String minutes = _toTwoDigits(inMinutes.remainder(60));
    String seconds = _toTwoDigits(inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}

extension DateTimeEXT on DateTime {
  ///12/04/2024
  String toDate() {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}
