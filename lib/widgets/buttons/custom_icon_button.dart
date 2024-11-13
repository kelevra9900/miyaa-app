import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:miyaa/common/custom_colors.dart';
import 'package:miyaa/common/user_preferences.dart';
import 'package:miyaa/tools/styles.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.onTap,
    required this.pathIcon,
    this.backdroungColor,
    this.isAnimated = false,
  });
  final void Function()? onTap;
  final String pathIcon;
  final Color? backdroungColor;
  final bool? isAnimated;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 44.sp,
        width: 44.sp,
        decoration: BoxDecoration(
            color: backdroungColor ??
                (prefs.isDarkMode ? darkColors.backgroundColor : Colors.white),
            borderRadius: BorderRadius.circular(8)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(height: 24.sp, width: 24.sp),
            isAnimated == true
                ? Lottie.asset(
                    pathIcon,
                    width: 24.sp,
                    height: 24.sp,
                    fit: BoxFit.cover,
                  )
                : SvgPicture.asset(
                    pathIcon,
                    colorFilter: styles.colorFilterIcon(),
                  ),
          ],
        ),
      ),
    );
  }
}
