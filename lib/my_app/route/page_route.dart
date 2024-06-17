import 'package:flutter/material.dart';
import 'package:kidgo/my_app/route/routes.dart';
import 'package:kidgo/screems/login/login_screem.dart';
import 'package:kidgo/screems/review/review_screem.dart';
import 'package:kidgo/screems/sign_up/sign_up_screem.dart';
import 'package:kidgo/screems/splash/splash_screem.dart';

extension PageRoute on Routes {
  Route<dynamic> unKnow(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) {
        return Scaffold(
          body: Center(
            child: Text(
                'Không có tuyến đường nào được xác định cho ${settings.name}'),
          ),
        );
      },
    );
  }

  Route<dynamic> splash(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const SplashScreem(),
    );
  }

  Route<dynamic> review(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => ReviewScreem(),
    );
  }

  Route<dynamic> login(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const LoginScreem(),
    );
  }

  Route<dynamic> signup(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const SignUpScreem(),
    );
  }
}
