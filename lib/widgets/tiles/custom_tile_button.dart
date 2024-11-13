import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miyaa/tools/extensions/dimens_extension.dart';

import '../../common/custom_colors.dart';
import '../../common/user_preferences.dart';
import '../../tools/custom_text.dart';
import '../../tools/styles.dart';

class CustomTileButton extends StatelessWidget {
  const CustomTileButton(
      {super.key,
      required this.title,
      required this.leadingIcon,
      required this.voidCallback,
      required this.size,
      this.trailingIcon = Icons.arrow_forward_ios_rounded,
      this.hasDivider = true,
      this.isFlexible = false});

  final String title;
  final double size;
  final String leadingIcon;
  final IconData trailingIcon;
  final bool hasDivider;
  final bool isFlexible;
  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 18.sp),
              child: Row(
                children: [
                  SizedBox(
                    height: 18.sp,
                    width: 17.sp,
                    child: SvgPicture.asset(
                      leadingIcon,
                      colorFilter: styles.colorFilterIcon(),
                    ),
                  ),
                  SizedBox(width: 10.sp),
                  Expanded(
                    flex: 50,
                    child: SizedBox(
                        width: context.width(.5),
                        child: CustomText(title, fontSize: 16, maxLines: 2)),
                  ),
                  const Spacer(),
                  Icon(
                    trailingIcon,
                    size: 16.sp,
                    color: prefs.isDarkMode
                        ? darkColors.textColor
                        : lightColors.textColor,
                  ),
                ],
              ),
            ),
            if (hasDivider)
              Divider(
                color: lightColors.dividerColor,
                endIndent: 18.sp,
                indent: 18.sp,
              )
          ],
        ),
      ),
    );
  }
}
