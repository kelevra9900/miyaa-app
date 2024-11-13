import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../common/custom_colors.dart';
import '../../../../../common/user_preferences.dart';
import '../../../../../tools/custom_text.dart';

class ButtonOptionChat extends StatelessWidget {
  const ButtonOptionChat({
    super.key,
    required this.label,
    required this.pathIcon,
    this.onTap,
    this.description,
    this.height,
    this.width,
    this.isSelected = false,
  });

  final String label;
  final String pathIcon;
  final void Function()? onTap;
  final String? description;
  final double? height;
  final double? width;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 84.sp,
        height: 75.sp,
        padding: description == null
            ? null
            : EdgeInsets.symmetric(horizontal: 12.sp, vertical: 24.sp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: prefs.isDarkMode
              ? darkColors.backgroundColor
              : lightColors.backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.fromBorderSide(
            BorderSide(
              color:
                  isSelected! ? lightColors.primaryColor : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 44.sp,
              width: 44.sp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: prefs.isDarkMode
                    ? darkColors.containerColor
                    : darkColors.backgroundColor,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 24.sp,
                    width: 24.sp,
                    child: SvgPicture.asset(
                      pathIcon,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.sp,
            ),
            CustomText(
              label,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
