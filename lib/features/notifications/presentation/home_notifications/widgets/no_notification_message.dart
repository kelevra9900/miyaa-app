import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/custom_colors.dart';
import '../../../../../common/user_preferences.dart';
import '../../../../../tools/custom_text.dart';
import '../../../../../tools/extensions/dimens_extension.dart';
import '../../../../../tools/paths/paths_images.dart';

class NoNotificationMessage extends StatelessWidget {
  const NoNotificationMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 70.sp),
          SizedBox(
            height: 177.sp,
            width: 177.sp,
            child: Image.asset(images.noNotification),
          ),
          SizedBox(height: 24.sp),
          const CustomText(
            "Sin notificaciones",
            fontSize: 18,
            fontWeight: FontWeight.w800,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.sp),
          CustomText(
            "Ya viste o eliminaste todas las notificaciones. Cuando tengas nuevas las verás aquí.",
            fontSize: 14,
            textColor:
                prefs.isDarkMode ? lightColors.grey0 : lightColors.grey01,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
