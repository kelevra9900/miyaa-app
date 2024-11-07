import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/custom_colors.dart';
import '../common/user_preferences.dart';

class CustomStyles {
  TextStyle textStyle({
    FontWeight? fontWeight,
    double? fontSize = 16,
    Color? textColor,
    TextDecoration? textDecoration,
    double? height,
    double? decorationThickness,
  }) =>
      TextStyle(
        fontFamily: 'PlusJakartaSans',
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize!.sp,
        color: textColor ??
            (prefs.isDarkMode ? DarkColors().textColor : lightColors.textColor),
        decoration: textDecoration ?? TextDecoration.none,
        decorationColor: textColor ??
            (prefs.isDarkMode ? darkColors.textColor : lightColors.textColor),
        height: height,
        decorationThickness: decorationThickness,
      );

  ColorFilter colorFilterIcon() => ColorFilter.mode(
        prefs.isDarkMode ? darkColors.textColor : lightColors.textColor,
        BlendMode.srcIn,
      );

  BoxDecoration containerDecoration() => BoxDecoration(
      color: prefs.isDarkMode ? darkColors.containerColor : Colors.white,
      borderRadius: BorderRadius.circular(12));
}

final CustomStyles styles = CustomStyles();
