enum Screems {
  unKnow,
  splash,
  review,
  login,
  signup
  ;

  String get path => '/$name';

  factory Screems.formPath(String? path) => Screems.values.firstWhere(
        (screem) => screem.path == path,
        orElse: () => Screems.unKnow,
      );
}
