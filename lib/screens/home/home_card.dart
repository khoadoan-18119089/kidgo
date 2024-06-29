import 'package:flutter/material.dart';
import 'package:kidgo/components/cus_text.dart';
import 'package:kidgo/components/horizontal_card.dart';

class HomeCard extends HorizontalCard {
  HomeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    super.onTap,
  });

  final String icon;

  final String title;

  final String subtitle;

  @override
  Color? get color => const Color(0XFFC4EBF8);

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
        CusText.bodyMedium(subtitle),
      ];
}
