import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/custom_colors.dart';
import '../dashboard_controller.dart';
import '../dashboard_state.dart';

class NavigatorBarButton extends StatelessWidget {
  const NavigatorBarButton({
    super.key,
    required this.controller,
    required this.idScreen,
    required this.pathIcon,
    required this.state,
  });

  final DashboardController controller;
  final DashboardState state;
  final int idScreen;
  final String pathIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.setCurrentScreen(idScreen),
      child: Container(
        height: 42.sp,
        width: 42.sp,
        decoration: BoxDecoration(
            color: state.currentScreen == idScreen
                ? Colors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
                height: 24.sp,
                width: 24.sp,
                child: SvgPicture.asset(
                  pathIcon,
                  colorFilter: ColorFilter.mode(
                      state.currentScreen == idScreen
                          ? darkColors.backgroundColor
                          : darkColors.white01,
                      BlendMode.srcIn),
                )),
          ],
        ),
      ),
    );
  }
}
