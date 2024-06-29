class MyIcons {
  /// assets/logo/logo.png
  static String logo = MyIconsBase.logoIcons('logo.png');

  /// assets/icon/bus.png
  static String bus = MyIconsBase.icons('bus.png');

  /// assets/icon/pig.png
  static String pig = MyIconsBase.icons('pig.png');

  /// assets/icon/phone.png
  static String phone = MyIconsBase.icons('phone.png');

  /// assets/icon/user.png
  static String user = MyIconsBase.icons('user.png');

  /// assets/icon/email.png
  static String email = MyIconsBase.icons('email.png');

  /// assets/icon/phone-1.png
  static String phone1 = MyIconsBase.icons('phone-1.png');

  /// assets/icon/home.png
  static String home = MyIconsBase.icons('home.png');

  /// assets/icon/pass.png
  static String pass = MyIconsBase.icons('pass.png');

  /// assets/icon/calendar.png
  static String calendar = MyIconsBase.icons('calendar.png');

  /// assets/icon/alert_right.png
  static String alertRight = MyIconsBase.icons('alert_right.png');

  /// assets/icon/alert_wrong.png
  static String alertWrong = MyIconsBase.icons('alert_wrong.png');

  /// assets/icon/car.png
  static String car = MyIconsBase.icons('car.png');

  /// assets/icon/book.png
  static String book = MyIconsBase.icons('book.png');

  /// assets/icon/phone_call.png
  static String phoneCall = MyIconsBase.icons('phone_call.png');

  /// assets/icon/menu.png
  static String menu = MyIconsBase.icons('menu.png');

  /// assets/icon/arrow_right.png
  static String arrowRight = MyIconsBase.icons('arrow_right.png');

  /// assets/icon/wallet.png
  static String wallet = MyIconsBase.icons('wallet.png');

  /// assets/icon/coins_hand.png
  static String coinsHand = MyIconsBase.icons('coins_hand.png');
}

class MyIconsBase {
  static const String _base = 'assets';
  static String logoIcons(String name) => '$_base/logo/$name';
  static String icons(String icon) => '$_base/icon/$icon';
}
