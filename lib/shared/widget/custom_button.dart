import 'package:flutter/material.dart';
import 'package:shequal/shared/theme.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color color;
  final Color? textColor;
  final double? width;
  final EdgeInsets? margin;

  const CustomButton({
    required this.onPressed,
    required this.color,
    required this.text,
    required this.textColor,
    required this.width,
    this.margin = EdgeInsets.zero,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: width,
        margin: margin,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Center(
          child: Text(
            text,
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
