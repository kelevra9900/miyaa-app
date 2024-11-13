import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miyaa/tools/extensions/dimens_extension.dart';

import '../../../../../common/custom_colors.dart';
import '../../../../../tools/custom_text.dart';
import '../../../dashboard/dashboard_controller.dart';

class SoonHome extends StatelessWidget {
  final DashboardController controller;
  const SoonHome({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                'Anuncios',
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              GestureDetector(
                  onTap: () => controller.setCurrentScreen(1),
                  child: CustomText(
                    'Ver más',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    textColor: lightColors.primaryColor,
                  ))
            ],
          ),
          SizedBox(height: 10.sp),
          // SizedBox(
          //   height: 180.sp,
          //   width: context.width(),
          //   child: const CustomStackedCards(),
          // ),
          SizedBox(height: 30.sp),
        ],
      ),
    );
  }
}
