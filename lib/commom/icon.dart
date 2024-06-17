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

  /// assets/icon/birth.png
  static String birth = MyIconsBase.icons('birth.png');
}

class MyIconsBase {
  static const String _base = 'assets';
  static String logoIcons(String name) => '$_base/logo/$name';
  static String icons(String icon) => '$_base/icon/$icon';
}
