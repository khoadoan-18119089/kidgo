import 'package:flutter/material.dart';
import 'package:kidgo/my_app/route/page_route.dart';
import 'package:kidgo/my_app/route/screems.dart';

class Routes {
  Routes._();
  factory Routes() => intanse;
  static final Routes intanse = Routes._();

  String get initialRoute => Screems.review.path;

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (Screems.formPath(settings.name)) {
      case Screems.unKnow:
        return unKnow(settings);
      case Screems.splash:
        return splash(settings);
      case Screems.review:
        return review(settings);
      case Screems.login:
        return login(settings);
      case Screems.signup:
        return signup(settings);
      case Screems.otp:
        return otp(settings);
    }
  }
}
