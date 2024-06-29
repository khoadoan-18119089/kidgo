import 'package:flutter/material.dart';
import 'package:kidgo/commom/icon.dart';
import 'package:kidgo/components/cus_drawer.dart';
import 'package:kidgo/components/my_appbar.dart';
import 'package:kidgo/main.dart';
import 'package:kidgo/my_app/route/screens.dart';
import 'package:kidgo/screens/book_the_car/components/book_the_card_card.dart';

class BookTheCarScreen extends StatelessWidget {
  const BookTheCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      endDrawer: const CusDrawer(
        screen: Screens.bookTheCar,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BookTheCardCard(
              icon: MyIcons.car,
              title: 'ĐẶT XE',
            ),
            const SizedBox(height: 16),
            BookTheCardCard(
              icon: MyIcons.wallet,
              title: 'XÁC NHẬN HOÁ ĐƠN',
            ),
            const SizedBox(height: 16),
            BookTheCardCard(
              icon: MyIcons.coinsHand,
              title: 'LỊCH SỬ GIAO DỊCH',
              onTap: () =>
                  MyApp.to(context, screen: Screens.transactionHistories),
            ),
          ],
        ),
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
