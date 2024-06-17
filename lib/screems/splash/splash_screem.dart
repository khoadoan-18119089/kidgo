import 'package:flutter/material.dart';
import 'package:kidgo/commom/icon.dart';

class SplashScreem extends StatelessWidget {
  const SplashScreem({super.key});

  @override
  Widget build(BuildContext context) {
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
