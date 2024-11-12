import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

import '../../../../../tools/custom_text.dart';
import '../../../../../tools/paths/paths_gifs.dart';

class RippleButton extends StatelessWidget {
  const RippleButton({
    super.key,
    required this.route,
    this.isSOS = false,
    this.title = 'SOS',
    this.fontSize = 18,
    this.isLoading = false,
    this.onTap,
  });

  final String route;
  final bool isSOS;
  final String title;
  final double fontSize;
  final bool isLoading;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return RippleAnimation(
      color: Colors.deepOrange,
      delay: const Duration(milliseconds: 300),
      repeat: true,
      minRadius: 75,
      ripplesCount: 6,
      duration: const Duration(milliseconds: 6 * 900),
      child: GestureDetector(
        onTap: () {
          if (isSOS) {
            // context.push(Routes.emergency);
            onTap!();
            return;
          }
          context.pop();
        },
        child: CircleAvatar(
          minRadius: 90,
          maxRadius: 90,
          backgroundColor: Colors.red,
          child: isLoading
              ? circleLoading()
              : CustomText(
                  title,
                  textColor: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
        ),
      ),
    );
  }

  Widget circleLoading() {
    return SizedBox(
      height: 30.sp,
      width: 30.sp,
      child: Image.asset(gifs.loading),
    );
  }
}
