import 'package:flutter/material.dart';
import 'package:kidgo/commom/icon.dart';
import 'package:kidgo/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyApp.prefs.loggedInState(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(MyIcons.logo),
          ],
        ),
      ),
    );
  }
}
