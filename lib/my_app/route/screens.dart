enum Screens {
  unKnow,
  splash,
  review,
  login,
  signup,
  otp,
  home,
  calendar,
  bookTheCar,
  blog,
  contact,
  account,
  transactionHistories;

  String get path => '/$name';

  factory Screens.formPath(String? path) => Screens.values.firstWhere(
        (screen) => screen.path == path,
        orElse: () => Screens.unKnow,
      );
}
