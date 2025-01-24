import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:miyaa/features/login/domain/user.dart';
import '../../../../../common/custom_colors.dart';
import '../../../../../common/user_preferences.dart';
import '../chat_controller.dart';
import '../../../profile/widgets/profile_name_photo.dart';
import '../../../../../tools/custom_text.dart';
import '../../../../../tools/extensions/dimens_extension.dart';
import '../../../../../widgets/buttons/arrow_button.dart';

class CustomHeaderChat extends StatelessWidget {
  const CustomHeaderChat({
    super.key,
    required this.controller,
    required this.user,
  });

  final ChatController controller;
  final User user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: context.width(),
        color: prefs.isDarkMode
            ? darkColors.backgroundColor
            : lightColors.backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ArrowButton(
                  height: 40.sp,
                  backgroundColor:
                      prefs.isDarkMode ? darkColors.containerColor : null,
                  iconColor: Colors.white,
                  onTap: () {
                    context.pop();
                    controller.goBackToChats();
                  },
                ),
                SizedBox(width: 16.sp),
                UserPhoto(
                  radius: 20.sp,
                  urlImage: null,
                ),
                SizedBox(width: 16.sp),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: context.width(.38),
                      child: CustomText(
                        "${user.firstName} ${user.lastName}",
                        fontWeight: FontWeight.w600,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 4.sp),
                    SizedBox(
                      width: context.width(.38),
                      child: CustomText(
                        "Usuario",
                        fontSize: 12,
                        textColor: prefs.isDarkMode
                            ? lightColors.grey0
                            : lightColors.grey01,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
