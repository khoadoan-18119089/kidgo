import 'package:flutter/material.dart';
import 'package:kidgo/components/cus_drawer.dart';
import 'package:kidgo/components/my_appbar.dart';
import 'package:kidgo/my_app/route/screens.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      endDrawer: const CusDrawer(
        screen: Screens.account,
      ),
    );
  }

  AppBar _appBar() {
    return MyAppbar(
      avatar: null,
      onMenu: (context) => Scaffold.of(context).openEndDrawer(),
    );
  }
}
