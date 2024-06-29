import 'package:flutter/material.dart';
import 'package:kidgo/commom/icon.dart';
import 'package:kidgo/components/my_appbar.dart';
import 'package:kidgo/main.dart';
import 'package:kidgo/my_app/route/screens.dart';
import 'package:kidgo/screens/home/home_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
    );
  }

  AppBar _appBar() {
    return MyAppbar(
      avatar: null,
      isHome: true,
    );
  }

  Widget _body(BuildContext context) {
    List<Widget> list = _list(context);
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: list.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (_, index) {
        return list[index];
      },
    );
  }

  List<Widget> _list(BuildContext context) => [
        HomeCard(
          icon: MyIcons.calendar,
          title: 'LỊCH',
          subtitle: 'Xem lịch trình của xe tại đây',
          onTap: () {
            MyApp.to(context, screen: Screens.calendar);
          },
        ),
        HomeCard(
          icon: MyIcons.car,
          title: 'XE',
          subtitle: 'Đặt xe, xác nhận hoá đơn và xem lịch sử giao dịch tại dây',
          onTap: () {
            MyApp.to(context, screen: Screens.bookTheCar);
          },
        ),
        HomeCard(
          icon: MyIcons.book,
          title: 'BLOG',
          subtitle: 'Xem thông tin mới nhất tại đây',
          onTap: () {
            MyApp.to(context, screen: Screens.blog);
          },
        ),
        HomeCard(
          icon: MyIcons.phoneCall,
          title: 'LIÊN LẠC',
          subtitle: 'Xem thông tin liên lạc tại đây',
          onTap: () {
            MyApp.to(context, screen: Screens.contact);
          },
        ),
        HomeCard(
          icon: MyIcons.user,
          title: 'TÀI KHOẢN',
          subtitle: 'Xem thông tin tài khoản tại đây',
          onTap: () {
            MyApp.to(context, screen: Screens.account);
          },
        ),
      ];
}
