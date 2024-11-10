import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/custom_colors.dart';
import '../../common/user_preferences.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    super.key,
    this.onTap,
    this.type = ArrowButtonType.left,
    this.backgroundColor,
    this.iconColor,
    this.height,
  });
  final void Function()? onTap;

  final ArrowButtonType? type;

  final Color? backgroundColor;
  final Color? iconColor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 44.sp,
        width: height ?? 44.sp,
        decoration: BoxDecoration(
          color: backgroundColor ??
              (prefs.isDarkMode
                  ? lightColors.backgroundColor
                  : darkColors.backgroundColor),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        child: Icon(
          type == ArrowButtonType.left
              ? Icons.arrow_back_ios_rounded
              : Icons.arrow_forward_ios_rounded,
          color: iconColor ??
              (prefs.isDarkMode
                  ? darkColors.backgroundColor
                  : lightColors.backgroundColor),
          size: 24.sp,
        ),
      ),
    );
  }
}

enum ArrowButtonType { left, right }
