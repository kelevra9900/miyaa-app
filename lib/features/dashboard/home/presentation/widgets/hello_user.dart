import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../home_controller.dart';
import '../home_state.dart';
import '../../../../../tools/extensions/dimens_extension.dart';

import '../../../../../common/custom_colors.dart';
import '../../../../../common/user_preferences.dart';
import '../../../../../tools/custom_text.dart';

class HelloUser extends StatelessWidget {
  const HelloUser({
    super.key,
    required this.controller,
    required this.state,
  });

  final HomeController controller;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                      SizedBox(height: 24.sp),
                      SizedBox(
                        width: context.width(.55),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              state.userData?.user?.firstName != null
                                  ? "Hola, ${state.userData?.user?.firstName ?? ""}"
                                  : 'Hola',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              textColor: prefs.isDarkMode
                                  ? darkColors.textColor
                                  : lightColors.textColor,
                              height: 1.3,
                            ),
                            CustomText(
                              'Mantén la seguridad y el control de tu equipo en todo momento',
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
        // SizedBox(
        //   width: context.width(),
        //   child: Categories(controller: controller, state: state),
        // ),
      ],
    );
  }
}
