import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/custom_colors.dart';
import '../../../../common/network/custom_catch_error.dart';
import '../../../../common/user_preferences.dart';
import '../../../../tools/custom_text.dart';
import '../../../../tools/paths/paths_icons.dart';
import '../../../../tools/styles.dart';
import '../../../../widgets/buttons/custom_icon_button.dart';
import '../../../../widgets/buttons/primary_button.dart';
import '../../../../widgets/tiles/custom_tile_switch.dart';
import 'settings_notification_controller.dart';

class SettingsNotificationPage extends ConsumerStatefulWidget {
  const SettingsNotificationPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SettingsNotificationState();
}

class _SettingsNotificationState
    extends ConsumerState<SettingsNotificationPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      ref.watch(settingsNotificationController.notifier).initData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(settingsNotificationController.notifier);
    var state = ref.watch(settingsNotificationController);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 32.sp),
            child: CustomScrollView(slivers: [
              SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          CustomIconButton(
                            backdroungColor: prefs.isDarkMode
                                ? darkColors.containerColor
                                : Colors.white,
                            pathIcon: icons.arrowLeft,
                            onTap: () => {},
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                "Notificaciones",
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 38.sp),
                      const CustomText("Tratamientos",
                          fontWeight: FontWeight.w600),
                      SizedBox(height: 12.sp),
                      Container(
                        decoration: styles.containerDecoration(),
                        child: Column(
                          children: [
                            CustomTileSwitch(
                              title: "Tratamientos en curso",
                              leadingIcon: icons.bell,
                              initValue: state.ongoingTreatments,
                              resetInitValue: state.resetValues,
                              onChange: (bool? value) => {},
                            ),
                            CustomTileSwitch(
                              title: "Dosis diarias",
                              leadingIcon: icons.bell,
                              initValue: state.dailyDoses,
                              resetInitValue: state.resetValues,
                              hasDivider: false,
                              onChange: (bool? value) => {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 35.sp),
                      const CustomText("Consultas",
                          fontWeight: FontWeight.w600),
                      SizedBox(height: 12.sp),
                      Container(
                        decoration: styles.containerDecoration(),
                        child: Column(
                          children: [
                            CustomTileSwitch(
                              title: "Próximas consultas",
                              leadingIcon: icons.bell,
                              initValue: state.upcomingAppointments,
                              resetInitValue: state.resetValues,
                              onChange: (bool? value) => {},
                            ),
                            CustomTileSwitch(
                              title: "Consultas canceladas",
                              leadingIcon: icons.bell,
                              initValue: state.cancelledAppointments,
                              resetInitValue: state.resetValues,
                              onChange: (bool? value) => {},
                            ),
                            CustomTileSwitch(
                              title: "Consultas reprogramadas",
                              leadingIcon: icons.bell,
                              hasDivider: false,
                              initValue: state.rescheduledAppointments,
                              resetInitValue: state.resetValues,
                              onChange: (bool? value) => {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 38.sp),
                      const CustomText("Mensajes", fontWeight: FontWeight.w600),
                      SizedBox(height: 12.sp),
                      Container(
                        decoration: styles.containerDecoration(),
                        child: Column(
                          children: [
                            CustomTileSwitch(
                              title: "Chat en vivo",
                              leadingIcon: icons.bell,
                              initValue: state.liveChat,
                              resetInitValue: state.resetValues,
                              onChange: (bool? value) => {},
                            ),
                            CustomTileSwitch(
                              title: "Mensajes",
                              leadingIcon: icons.bell,
                              initValue: state.messages,
                              resetInitValue: state.resetValues,
                              hasDivider: false,
                              onChange: (bool? value) => {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 38.sp),
                      const CustomText("Promociones",
                          fontWeight: FontWeight.w600),
                      SizedBox(height: 12.sp),
                      Container(
                        decoration: styles.containerDecoration(),
                        child: Column(
                          children: [
                            CustomTileSwitch(
                              title: "Descuentos y promociones",
                              leadingIcon: icons.bell,
                              initValue: state.promotions,
                              resetInitValue: state.resetValues,
                              hasDivider: false,
                              onChange: (bool? value) => {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 38.sp),
                      if (state.viewButtons!) ...[
                        PrimaryButton(
                          text: "Guardar cambios",
                          isLoading: state.isLoading,
                          onPressed: () async =>
                              await saveChanges(controller, context),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              overlayColor: WidgetStateColor.transparent,
                              onTap: () {
                                try {
                                  controller.resetSettings();
                                } catch (e) {
                                  customError.catchError(
                                      e: e, context: context);
                                }
                              },
                              child: const CustomText(
                                "Reestablecer ajustes",
                                textColor: Colors.red,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                      ]
                    ],
                  ))
            ])),
      ),
    );
  }

  Future<void> saveChanges(
      SettingsNotificationController controller, BuildContext context) async {
    try {
      controller.setIsLoading(true);

      await controller.updateNotificationSettings();
      controller.setIsLoading(false);
    } catch (e) {
      controller.setIsLoading(false);
      if (!context.mounted) return;
      customError.catchError(e: e, context: context);
    }
  }
}
