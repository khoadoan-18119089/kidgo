import 'package:flutter/material.dart';
import 'package:kidgo/my_app/route/page_route.dart';
import 'package:kidgo/my_app/route/screens.dart';

class Routes {
  Routes._();
  factory Routes() => intanse;
  static final Routes intanse = Routes._();

  String get initialRoute => Screens.splash.path;

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (Screens.formPath(settings.name)) {
      case Screens.unKnow:
        return unKnow(settings);
      case Screens.splash:
        return splash(settings);
      case Screens.review:
        return review(settings);
      case Screens.login:
        return login(settings);
      case Screens.signup:
        return signup(settings);
      case Screens.otp:
        return otp(settings);
      case Screens.home:
        return home(settings);
      case Screens.calendar:
        return calendar(settings);
      case Screens.bookTheCar:
        return bookTheCar(settings);
      case Screens.blog:
        return blog(settings);
      case Screens.contact:
        return contact(settings);
      case Screens.account:
        return account(settings);
      case Screens.transactionHistories:
        return transactionHistories(settings);
    }
  }
}
