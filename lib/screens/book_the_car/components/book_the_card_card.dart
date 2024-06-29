import 'package:flutter/material.dart';
import 'package:kidgo/components/cus_text.dart';
import 'package:kidgo/components/horizontal_card.dart';

class BookTheCardCard extends HorizontalCard {
  BookTheCardCard({
    super.key,
    required this.icon,
    required this.title,
    super.onTap,
  });

  final String icon;

  final String title;

  @override
  Color? get color => const Color(0XFFC4EBF8);

  @override
  double get height => 100;

  @override
  Widget get headCard => Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0XFFF2C740),
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.asset(
            icon,
            fit: BoxFit.contain,
          ),
        ),
      );

  @override
  List<Widget> get contentChildren => [
        CusText.titleSmall(title),
      ];
}
