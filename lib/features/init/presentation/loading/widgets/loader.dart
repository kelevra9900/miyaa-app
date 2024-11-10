import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miyaa/common/custom_colors.dart';
import 'package:miyaa/common/user_preferences.dart';
import 'package:miyaa/tools/custom_text.dart';
import 'package:miyaa/tools/extensions/dimens_extension.dart';
import 'package:miyaa/tools/paths/paths_icons.dart';

class Loader extends StatefulWidget {
  const Loader({
    super.key,
    this.textInformation,
  });

  /// texto de información
  final String? textInformation;

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController _animatedController;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _animatedController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _animation = ColorTween(
      begin: lightColors.primaryColor,
      end: prefs.isDarkMode
          ? darkColors.backgroundColor
          : lightColors.backgroundColor,
    ).animate(_animatedController);
  }

  @override
  void dispose() {
    _animatedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (x) async => false,
      child: Scaffold(
        body: SizedBox(
          height: context.height(),
          width: context.width(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (BuildContext context, Widget? child) {
                  return ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: [lightColors.primaryColor, _animation.value!],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcATop,
                    child: SvgPicture.asset(
                      icons.logo,
                      height: 92.sp,
                      width: 92.sp,
                    ),
                  );
                },
              ),
              SizedBox(height: 25.sp),
              CustomText(
                widget.textInformation ?? 'Cargando...',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
        ),
      ),
    );
  }
}
