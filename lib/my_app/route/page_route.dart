import 'package:flutter/material.dart';
import 'package:kidgo/my_app/route/cus_page_route.dart';
import 'package:kidgo/my_app/route/routes.dart';
import 'package:kidgo/screens/account/account_screen.dart';
import 'package:kidgo/screens/blog/blog_screen.dart';
import 'package:kidgo/screens/book_the_car/book_the_car_screen.dart';
import 'package:kidgo/screens/book_the_car/transaction_histories/transaction_histories_screen.dart';
import 'package:kidgo/screens/calendar/calendar_screen.dart';
import 'package:kidgo/screens/contact/contact_screen.dart';
import 'package:kidgo/screens/home/home_screen.dart';
import 'package:kidgo/screens/login/login_screen.dart';
import 'package:kidgo/screens/otp/otp_screen.dart';
import 'package:kidgo/screens/review/review_screen.dart';
import 'package:kidgo/screens/sign_up/sign_up_screen.dart';
import 'package:kidgo/screens/splash/splash_screen.dart';

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
      builder: (_) => const SplashScreen(),
    );
  }

  Route<dynamic> review(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => ReviewScreen(),
    );
  }

  Route<dynamic> login(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const LoginScreen(),
    );
  }

  Route<dynamic> signup(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const SignUpScreen(),
    );
  }

  Route<dynamic> otp(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const OtpScreen(),
    );
  }

  Route<dynamic> home(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const HomeScreen(),
    );
  }

  Route<dynamic> calendar(RouteSettings settings) {
    return CusPageRoute(
      settings: settings,
      axisDirection: AxisDirection.left,
      builder: (_) => const CalendarScreen(),
    );
  }

  Route<dynamic> bookTheCar(RouteSettings settings) {
    return CusPageRoute(
      settings: settings,
      axisDirection: AxisDirection.left,
      builder: (_) => const BookTheCarScreen(),
    );
  }

  Route<dynamic> blog(RouteSettings settings) {
    return CusPageRoute(
      settings: settings,
      axisDirection: AxisDirection.left,
      builder: (_) => const BlogScreen(),
    );
  }

  Route<dynamic> contact(RouteSettings settings) {
    return CusPageRoute(
      settings: settings,
      axisDirection: AxisDirection.left,
      builder: (_) => const ContactScreen(),
    );
  }

  Route<dynamic> account(RouteSettings settings) {
    return CusPageRoute(
      settings: settings,
      axisDirection: AxisDirection.left,
      builder: (_) => const AccountScreen(),
    );
  }

  Route<dynamic> transactionHistories(RouteSettings settings) {
    return CusPageRoute(
      settings: settings,
      axisDirection: AxisDirection.left,
      builder: (_) => const TransactionHistoriesScreen(),
    );
  }
}
