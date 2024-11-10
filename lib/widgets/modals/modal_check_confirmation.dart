import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/custom_colors.dart';
import '../../common/user_preferences.dart';
import '../../tools/custom_text.dart';
import '../../tools/paths/paths_images.dart';
import '../buttons/primary_button.dart';

class ModalCheckConfirmation extends StatelessWidget {
  const ModalCheckConfirmation({
    super.key,
    this.isSuccess = true,
    this.title,
    this.message,
    this.textButton,
    this.onPressed,
  });
  final bool? isSuccess;
  final String? title;
  final String? message;
  final String? textButton;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16.sp,
        left: 24.sp,
        right: 24.sp,
        bottom: 32.sp,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 6.sp,
            width: 56.sp,
            decoration: BoxDecoration(
                color: prefs.isDarkMode
                    ? darkColors.white01
                    : lightColors.enabledBorder,
                borderRadius: BorderRadius.circular(100)),
          ),
          SizedBox(height: 16.sp),
          SizedBox(
            height: 177.sp,
            width: 177.sp,
            child: Image.asset(
              isSuccess! ? images.checkSuccessful : images.checkNoSuccessful,
            ),
          ),
          SizedBox(height: 16.sp),
          CustomText(
            title,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
          SizedBox(height: 16.sp),
          CustomText(
            message,
            fontSize: 14,
            textColor:
                prefs.isDarkMode ? darkColors.leyendas : lightColors.grey01,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 60.sp),
          PrimaryButton(
            text: textButton ?? 'Aceptar',
            enabled: true,
            onPressed: onPressed ?? () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
