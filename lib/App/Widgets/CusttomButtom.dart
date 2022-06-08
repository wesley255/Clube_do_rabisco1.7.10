import 'package:flutter/material.dart';

class CusttonButton extends StatelessWidget {
  final double? width;
  final Widget? icon;
  final String labal;
  final VoidCallback ontap;
  final double? fontSize;
  final Color? borderColor;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  const CusttonButton(
      {this.borderColor,
      this.fontSize,
      required this.labal,
      required this.ontap,
      this.padding,
      this.textStyle,
      this.icon,
      this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width,
        padding: padding ?? EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: borderColor ?? Color(0xff4AA4D4)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: icon ??
              Text(
                labal,
                style: textStyle ??
                    TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
              ),
        ),
      ),
    );
  }
}
