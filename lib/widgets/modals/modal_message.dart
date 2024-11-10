import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/custom_colors.dart';
import '../../common/user_preferences.dart';
import '../../tools/custom_text.dart';
import '../../tools/models/modal_dynamic_data.dart';
import '../../tools/paths/paths_images.dart';
import '../buttons/primary_button.dart';

class ModalMessage extends StatelessWidget {
  const ModalMessage({
    super.key,
    required this.data,
  });

  final ModalDinamicData data;

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
            child: Image.asset(data.pathImage ??
                (data.isSuccess!
                    ? images.checkSuccessful
                    : images.checkNoSuccessful)),
          ),
          SizedBox(height: 16.sp),
          CustomText(
            data.title,
            fontSize: 20,
            fontWeight: FontWeight.w800,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.sp),
          CustomText(
            data.subtitle,
            fontSize: 14,
            textColor:
                prefs.isDarkMode ? darkColors.leyendas : lightColors.grey01,
            textAlign: TextAlign.center,
            height: 1.2,
          ),
          SizedBox(height: 60.sp),
          PrimaryButton(
            text: data.labelButton ?? 'Aceptar',
            enabled: true,
            backgroundColor: data.colorButton,
            borderColor: data.colorButton,
            onPressed: data.onPressed ?? () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
