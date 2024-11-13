import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'navigator_bar_button.dart';
import '../../../../tools/paths/paths_icons.dart';
import '../../../../common/custom_colors.dart';
import '../../../../common/user_preferences.dart';
import '../dashboard_controller.dart';
import '../dashboard_state.dart';
import '../../../../tools/extensions/dimens_extension.dart';

class CustomPrincipalMenu extends StatelessWidget {
  const CustomPrincipalMenu({
    super.key,
    required this.controller,
    required this.state,
  });

  final DashboardController controller;
  final DashboardState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(.915),
      height: 70.sp,
      padding: EdgeInsets.symmetric(horizontal: 32.sp),
      decoration: BoxDecoration(
        color: prefs.isDarkMode
            ? darkColors.containerColor
            : darkColors.backgroundColor,
        borderRadius: BorderRadius.circular(22),
        border: Border.fromBorderSide(
          BorderSide(
            width: 2,
            color: darkColors.backgroundColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavigatorBarButton(
            controller: controller,
            state: state,
            idScreen: 0,
            pathIcon: icons.home,
          ),
          NavigatorBarButton(
            controller: controller,
            state: state,
            idScreen: 1,
            pathIcon: icons.chat,
          ),
          NavigatorBarButton(
            controller: controller,
            state: state,
            idScreen: 2,
            pathIcon: icons.noteList,
          ),
          NavigatorBarButton(
            controller: controller,
            state: state,
            idScreen: 3,
            pathIcon: icons.profile,
          ),
        ],
      ),
    );
  }
}
