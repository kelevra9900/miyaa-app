import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/custom_colors.dart';
import '../../common/user_preferences.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.enabled = true,
  });

  final bool value;
  final bool? enabled;
  final ValueChanged<bool> onChanged;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200), // Duración más corta
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.enabled!
          ? () {
              if (_animationController.isCompleted) {
                _animationController.reverse();
              } else {
                _animationController.forward();
              }
              widget.onChanged(!widget.value);
            }
          : null,
      child: Container(
        width: 43.sp,
        height: 26.sp,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            color: widget.value
                ? lightColors.primaryColor
                : prefs.isDarkMode
                    ? darkColors.leyendas
                    : const Color(0XFF787880).withOpacity(.16)),
        child: Padding(
          padding: const EdgeInsets.all(2.0), // Simplificar el padding
          child: Align(
            alignment: widget.value
                ? (Directionality.of(context) == TextDirection.rtl
                    ? Alignment.centerLeft
                    : Alignment.centerRight)
                : (Directionality.of(context) == TextDirection.rtl
                    ? Alignment.centerRight
                    : Alignment.centerLeft),
            child: Container(
              width: 22.sp,
              height: 22.sp,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
