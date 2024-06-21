import 'package:flutter/material.dart';
import 'package:kidgo/components/cus_text.dart';

enum ButtonType {
  text,
  elevated,
  ;
}

class CusButton extends StatelessWidget {
  const CusButton.text({
    super.key,
    required String text,
    double? height,
    double? width,
    bool disable = false,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? color,
    required void Function()? onPressed,
  })  : _type = ButtonType.text,
        _text = text,
        _height = height,
        _width = width,
        _disable = disable,
        _padding = padding,
        _margin = margin,
        _color = color,
        _onPressed = onPressed,
        _isExpanded = false;

  const CusButton.elevated({
    super.key,
    required String text,
    double? height = 44,
    double? width,
    bool disable = false,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    bool isExpanded = false,
    Color? color,
    required void Function()? onPressed,
  })  : _type = ButtonType.elevated,
        _text = text,
        _height = height,
        _width = width,
        _disable = disable,
        _padding = padding,
        _margin = margin,
        _color = color,
        _onPressed = onPressed,
        _isExpanded = isExpanded;

  final ButtonType _type;

  final bool _disable;

  final void Function()? _onPressed;

  final String _text;

  final double? _width;

  final double? _height;

  final EdgeInsetsGeometry? _padding;

  final EdgeInsetsGeometry? _margin;

  final bool _isExpanded;

  final Color? _color;

  Widget _elevatedBtn(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
          padding: WidgetStatePropertyAll<EdgeInsetsGeometry?>(_padding),
          minimumSize: WidgetStatePropertyAll<Size?>(
            _isExpanded
                ? const Size(double.infinity, double.infinity)
                : const Size(0, 0),
          ),
          backgroundColor: WidgetStatePropertyAll<Color?>(_color)),
      onPressed: _disable ? null : _onPressed,
      child: CusText.button(_text),
    );
  }

  Widget _textBtn(BuildContext context) {
    return TextButton(
      onPressed: _disable ? null : _onPressed,
      style: Theme.of(context).textButtonTheme.style?.copyWith(
            padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(_padding),
          ),
      child: CusText.titleSmall(_text),
    );
  }

  Widget _btn(BuildContext context) {
    switch (_type) {
      case ButtonType.text:
        return _textBtn(context);
      case ButtonType.elevated:
        return _elevatedBtn(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: _width,
      margin: _margin,
      child: Opacity(
        opacity: _disable ? 0.5 : 1,
        child: _btn(context),
      ),
    );
  }
}
