import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kidgo/commom/field_name.dart';
import 'package:kidgo/commom/methods.dart';
import 'package:kidgo/main.dart';
import 'package:kidgo/my_app/route/screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferencesHelper._();
  factory SharedPreferencesHelper() => intanse;
  static final SharedPreferencesHelper intanse = SharedPreferencesHelper._();

  late final SharedPreferences _prefs;

  Future<void> onInit() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String? get phomeNumber => _prefs.getString(FieldName.phoneNumber);

  set phoneNumber(String phone) {
    _prefs.setString(FieldName.phoneNumber, phone);
  }

  DateTime? get loginDate =>
      Methods.toDateTime(_prefs.getString(FieldName.loginDate));

  set loginDate(DateTime? date) {
    _prefs.setString(FieldName.loginDate, date.toString());
  }

  void saveUser({
    required String phone,
    required DateTime? date,
  }) {
    phoneNumber = phone;
    loginDate = date;
  }

  void removeUser() {
    _prefs.remove(FieldName.phoneNumber);
    _prefs.remove(FieldName.loginDate);
  }

  void autoLogin(BuildContext context) {
    Screens screen = Screens.review;
    if (phomeNumber != null && phomeNumber!.isNotEmpty) {
      if (loginDate != null) {
        int daysBetween = DateTime.now().difference(loginDate!).inDays;
        if (daysBetween > 30) {
          screen = Screens.login;
        } else {
          screen = Screens.home;
        }
      } else {
        screen = Screens.login;
      }
    }
    MyApp.to(context, screen: screen);
  }

  void loggedInState(BuildContext context) {
    Timer(const Duration(seconds: 3), () => autoLogin(context));
  }
}
