import 'package:flutter/material.dart';
import 'package:kidgo/commom/icon.dart';
import 'package:kidgo/components/cus_image.dart';

class CusCircleAvatar extends StatelessWidget {
  const CusCircleAvatar(
    this.avatar, {
    super.key,
    this.size = 80,
    this.circleBorderColor = Colors.blue,
    this.backGroundColor = Colors.grey,
    this.circleBorderWidth = 2.0,
    this.spacingCircleAvatar = 4.0,
  });

  final String? avatar;

  final double size;

  final Color circleBorderColor;

  final Color backGroundColor;

  final double circleBorderWidth;

  final double spacingCircleAvatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      clipBehavior: Clip.antiAlias,
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: circleBorderColor,
          width: circleBorderWidth,
        ),
        shape: BoxShape.circle,
        color: backGroundColor,
      ),
      padding: EdgeInsets.all(spacingCircleAvatar),
      child: CusImage.border(
        avatar ?? MyIcons.user,
        height: size - spacingCircleAvatar,
        width: size - spacingCircleAvatar,
        borderRadius: BorderRadius.circular((size - spacingCircleAvatar) / 2),
      ),
    );
  }
}
