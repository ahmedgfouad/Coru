import 'package:flutter/material.dart';


class DefaultButton extends StatelessWidget {
  final Function() onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final String text;
  final double borderRadius ;
  final double? fontSize;
  final double? opacity;
  final FontWeight? fontWeight;
  final Color? textColor;
  const DefaultButton({super.key, 
    required this.onPressed,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.text,
    this.borderRadius=10,
    this.fontSize,
    this.opacity,
    this.fontWeight,
    this.textColor,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(1),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
