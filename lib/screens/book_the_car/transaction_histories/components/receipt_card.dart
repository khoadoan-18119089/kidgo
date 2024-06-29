import 'package:flutter/material.dart';
import 'package:kidgo/components/cus_text.dart';
import 'package:kidgo/components/horizontal_card.dart';
import 'package:kidgo/models/receipt_model.dart';

class ReceiptCard extends HorizontalCard {
  ReceiptCard(ReceiptModel model, {super.key}) : _model = model;

  final ReceiptModel _model;

  @override
  double get height => 116;

  @override
  Color? get color => const Color(0XFFC4EBF8);

  @override
  BorderSide get side => const BorderSide(
        width: 2,
        color: Color(0XFF1E5568),
      );

  @override
  Widget get headCard => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CusText.titleSmall('Chuyển tiền đến'),
            CusText.bodyMedium(_model.nameBank),
            const CusText.bodyMedium(
              'Mã đơn hàng',
              fontWeight: FontWeight.w700,
            ),
            CusText.labelMedium(_model.codeReceipt),
          ],
        ),
      );

  @override
  CrossAxisAlignment get crossAxisAlignment => CrossAxisAlignment.end;

  @override
  List<Widget> get contentChildren => [
        const CusText.titleSmall(
          '- 100.000 VND',
          color: Colors.red,
        ),
        const CusText.bodyMedium('04/05/2024'),
        const CusText.bodyMedium('07:34 AM'),
      ];
}
