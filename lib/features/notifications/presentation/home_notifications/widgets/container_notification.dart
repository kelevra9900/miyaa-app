import 'package:flutter/material.dart';
import 'package:miyaa/common/custom_colors.dart';
import 'package:miyaa/features/notifications/presentation/home_notifications/home_notifications_state.dart';
import 'package:miyaa/tools/extensions/dimens_extension.dart';

import '../../../../../common/user_preferences.dart';
import '../../../../../tools/custom_text.dart';
import '../../../../../tools/extensions/custom_text_formatters.dart';
import '../home_notifications_controller.dart';

class ContainerNotification extends StatelessWidget {
  const ContainerNotification({
    super.key,
    required this.state,
    required this.index,
    this.seeInformation = false,
    required this.controller,
  });

  final HomeNotificationsController controller;
  final HomeNotificationsState state;
  final int index;
  final bool? seeInformation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStateColor.transparent,
      onTap: () {
        // if (!state.notificationList![index].read) {
        //   controller.notificationsRepository
        //       .updateNotificationRead(state.notificationList![index].id);
        // }
        // controller.selectedNotification(index);
        // context.go(Routes.notification);
      },
      child: Container(
        width: context.width(.9),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: prefs.isDarkMode ? darkColors.containerColor : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SizedBox(
              width: context.width(.83),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10), // Espacio para el punto rojo
                              child: CustomText(
                                state.notificationList![index].notifications[0]
                                    .title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                height: 7,
                                width: 7,
                                decoration: BoxDecoration(
                                  color: seeInformation!
                                      ? Colors.transparent
                                      : Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomText(
                        TimeAgoFormatter().format(
                          DateTime.parse(
                            state.notificationList![index].notifications[0]
                                .createdAt,
                          ),
                        ),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        textColor: lightColors.grey01,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  CustomText(
                    state.notificationList![index].notifications[0].body,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    textColor: prefs.isDarkMode
                        ? lightColors.grey0
                        : lightColors.grey01,
                    height: 1.3,
                    maxLines: seeInformation! ? null : 2,
                    overflow: seeInformation! ? null : TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
