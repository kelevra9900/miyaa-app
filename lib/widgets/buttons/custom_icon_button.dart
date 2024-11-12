import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miyaa/common/custom_colors.dart';
import 'package:miyaa/common/user_preferences.dart';
import 'package:miyaa/tools/styles.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.onTap,
    required this.pathIcon,
    this.backdroungColor,
  });
  final void Function()? onTap;
  final String pathIcon;
  final Color? backdroungColor;

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
            SvgPicture.asset(
              pathIcon,
              colorFilter: styles.colorFilterIcon(),
            ),
          ],
        ),
      ),
    );
  }
}
