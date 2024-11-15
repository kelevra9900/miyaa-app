import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/custom_colors.dart';
import '../../../../../tools/custom_text.dart';
import '../../../../../tools/routes.dart';
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
                  onTap: () => context.push(Routes.announcements),
                  child: CustomText(
                    'Ver más',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    textColor: lightColors.primaryColor,
                  ))
            ],
          ),
          SizedBox(height: 30.sp),
        ],
      ),
    );
  }
}
