import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/custom_colors.dart';
import '../common/user_preferences.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;

  const CustomText(
    this.text, {
    super.key,
    this.textColor,
    this.fontWeight,
    this.textDecoration,
    this.maxLines,
    this.textAlign,
    this.fontSize = 16,
    this.overflow,
    this.height = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: textAlign,
      maxLines: maxLines ?? 100,
      overflow: overflow,
      style: textStyle(
        fontWeight: fontWeight,
        fontSize: fontSize!.sp,
        textColor: textColor,
        textDecoration: textDecoration,
        height: height,
      ),
    );
  }
}

textStyle({
  FontWeight? fontWeight,
  double? fontSize,
  Color? textColor,
  TextDecoration? textDecoration,
  double? height,
}) =>
    TextStyle(
        fontFamily: 'PlusJakartaSans',
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize,
        color: textColor ??
            (prefs.isDarkMode ? darkColors.textColor : LightColors().textColor),
        decoration: textDecoration ?? TextDecoration.none,
        decorationColor: textColor ??
            (prefs.isDarkMode ? darkColors.textColor : lightColors.textColor),
        height: height);
