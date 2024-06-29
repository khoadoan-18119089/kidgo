import 'package:flutter/material.dart';
import 'package:kidgo/components/cus_text.dart';
import 'package:kidgo/components/horizontal_card.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeletonReceiptCard extends HorizontalCard {
  SkeletonReceiptCard({super.key});

  @override
  double get height => 116;

  @override
  Color? get color => Colors.grey.shade200;

  @override
  BorderSide get side => BorderSide(
        width: 2,
        color: Colors.grey.shade500,
      );

  @override
  Widget get headCard => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CusText.titleSmall(
              'Chuyển tiền',
              color: Colors.grey.shade700,
            ),
            SkeletonAnimation(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 18,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            CusText.bodyMedium(
              'Mã đơn hàng',
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w300,
            ),
            SkeletonAnimation(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 16,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ],
        ),
      );

  @override
  CrossAxisAlignment get crossAxisAlignment => CrossAxisAlignment.end;

  @override
  List<Widget> get contentChildren => [
        SkeletonAnimation(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 22,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey.shade400,
            ),
          ),
        ),
        SkeletonAnimation(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 20,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey.shade400,
            ),
          ),
        ),
        SkeletonAnimation(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 18,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey.shade400,
            ),
          ),
        ),
      ];
}
