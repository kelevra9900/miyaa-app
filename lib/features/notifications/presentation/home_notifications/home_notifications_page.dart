import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/custom_colors.dart';
import '../../../../common/user_preferences.dart';
import '../../../../tools/custom_text.dart';
import '../../../../tools/paths/paths_icons.dart';
import '../../../../tools/routes.dart';
import '../../../../widgets/buttons/custom_icon_button.dart';
import 'home_notifications_controller.dart';
import 'widgets/no_notification_message.dart';
import 'widgets/notification_list.dart';

class HomeNotificationsPage extends ConsumerStatefulWidget {
  const HomeNotificationsPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeNotificationsState();
}

class _HomeNotificationsState extends ConsumerState<HomeNotificationsPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await ref.watch(homeNotificationsController.notifier).getNoifications();
      // ref.watch(homeNotificationsController.notifier).setIdNotification([
      //   Notifications(
      //     title: "¡Preparate!",
      //     description:
      //         "En 5 minutos tu Chat en vivo con el Dr. Luis Castillo dará inicio.",
      //     image:
      //         "https://w7.pngwing.com/pngs/467/838/png-transparent-logo-message-text-messaging-sms-web-design-angle-web-design-text.png",
      //     time: "5m",
      //   ),
      //   Notifications(
      //     title: "Video consulta cancelada",
      //     description:
      //         "La consulta programada para el 25 de junio ha sido cancelada por la Dra. Ana Medina, intenta agendar otra video consulta con los doctores disponibles ahora.",
      //     image:
      //         "https://static.vecteezy.com/system/resources/previews/000/439/576/non_2x/vector-video-camera-icon.jpg",
      //     time: "10m",
      //   ),
      //   Notifications(
      //     title: "¡30% de descuento!",
      //     description:
      //         "Desde el 03 de julio, hasta el 07 de julio, disfruta de hasta el 30% OFF en exámenes...",
      //     image: "https://cdn-icons-png.flaticon.com/512/1828/1828884.png",
      //     time: "20m",
      //   ),
      //   Notifications(
      //     title: "¡Es hora de tomar tu tratamiento!",
      //     description:
      //         "Tratamiento antibiótico: Amoxicilina, segunda dosis del día, pulsa aquí para com...",
      //     image: "",
      //     time: "120m",
      //   ),
      // ]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(homeNotificationsController.notifier);
    var state = ref.watch(homeNotificationsController);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 32.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                    backdroungColor: prefs.isDarkMode
                        ? darkColors.containerColor
                        : Colors.white,
                    pathIcon: icons.arrowLeft,
                    onTap: () => context.go(Routes.dashboard),
                  ),
                  const CustomText(
                    "Notificaciones",
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                  CustomIconButton(
                    backdroungColor: prefs.isDarkMode
                        ? darkColors.containerColor
                        : Colors.white,
                    pathIcon: icons.setting,
                    onTap: () => {},
                  ),
                ],
              ),
              SizedBox(height: 40.sp),
              state.notificationList?.isNotEmpty ?? false
                  ? NotificationList(
                      controller: controller,
                      state: state,
                    )
                  : const NoNotificationMessage(),
            ],
          ),
        ),
      ),
    );
  }
}
