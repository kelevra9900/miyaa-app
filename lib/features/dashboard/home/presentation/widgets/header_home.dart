import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miyaa/features/dashboard/home/presentation/home_controller.dart';
import 'package:miyaa/features/dashboard/home/presentation/home_state.dart';

import '../../../../../common/custom_colors.dart';
import '../../../../../common/user_preferences.dart';
import '../../../../../tools/extensions/dimens_extension.dart';
import '../../../../../tools/custom_text.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    super.key,
    required this.controller,
    required this.state,
  });

  final HomeController controller;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 32.sp),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              lightColors.primaryColor,
              prefs.isDarkMode
                  ? darkColors.backgroundColor
                  : lightColors.backgroundColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0, .8]),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: context.width(.55),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                'Hola Roger Uusario HC',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                textColor: prefs.isDarkMode
                                    ? darkColors.textColor
                                    : lightColors.textColor,
                                height: 1.3,
                              ),
                              CustomText(
                                'Let\'s take care of your well-being together',
                                fontSize: 16,
                                textColor: prefs.isDarkMode
                                    ? darkColors.textColor
                                    : lightColors.textColor,
                                height: 1.1,
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: context.height(.105)),
              ],
            ),
          ),
          SizedBox(
            width: context.width(),
            // child: Categories(controller: controller, state: state),
          ),
        ],
      ),
    );
  }
}
