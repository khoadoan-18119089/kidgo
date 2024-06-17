import 'package:flutter/material.dart';
import 'package:kidgo/components/cus_button.dart';
import 'package:kidgo/components/cus_text.dart';

class CusBottomSheet extends StatelessWidget {
  const CusBottomSheet(
      {super.key,
      required String titleText,
      required Widget Function(BuildContext context) contentBuilder,
      String? textButton,
      Function()? onPressedButton})
      : _titleText = titleText,
        _contentBuilder = contentBuilder,
        _textButton = textButton,
        _onPressedButton = onPressedButton;

  final String _titleText;

  final Widget Function(BuildContext context) _contentBuilder;

  final String? _textButton;

  final Function()? _onPressedButton;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _title(),
            const SizedBox(height: 16),
            _contentBuilder(context),
            if (_textButton != null) ...[button()]
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return CusText.titleLarge(_titleText);
  }

  Widget button() {
    return CusButton.elevated(
      text: _textButton ?? '',
      isExpanded: true,
      onPressed: _onPressedButton,
    );
  }
}
