import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:miyaa/features/dashboard/home/presentation/home_controller.dart';
import 'package:miyaa/features/dashboard/profile/widgets/profile_menu_options.dart';

import '../../../common/custom_colors.dart';
import '../../../common/secure_storage.dart';
import '../../../tools/routes.dart';
import '../../../widgets/buttons/arrow_button.dart';
import '../dashboard/dashboard_controller.dart';
import 'profile_controller.dart';
import 'widgets/profile_name_photo.dart';
import '../../../tools/custom_dialogs.dart';
import '../../../tools/custom_text.dart';
import '../../../tools/extensions/dimens_extension.dart';
import '../../../tools/models/modal_dynamic_data.dart';
import '../../../widgets/buttons/primary_button.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await ref.watch(profileController.notifier).initData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controllerDashboard = ref.watch(dashboardController.notifier);
    var profileState = ref.watch(profileController);
    var controllerHome = ref.watch(homeController.notifier);

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 32.sp),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    ArrowButton(
                        onTap: () => controllerDashboard.setCurrentScreen(0)),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          'Perfil',
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.sp),
                ProfileNamePhoto(
                  urlImage: profileState.userData?.user?.image,
                  name:
                      "${profileState.userData?.user?.firstName ?? ''} ${profileState.userData?.user?.lastName ?? ''}",
                ),
                SizedBox(height: 35.sp),
                const ProfileMenuOptions(),
                Expanded(child: SizedBox(height: 60.sp)),
                PrimaryButton(
                  backgroundColor: lightColors.errorColor,
                  borderColor: lightColors.errorColor,
                  text: 'Salir',
                  enabled: true,
                  onPressed: () => dialogs.showMessageYesNoDialog(
                    context,
                    data: ModalDinamicData(
                      title: 'Salir',
                      subtitle: '¿Estás seguro de cerrar sesión?',
                      labelButtonNo: 'Cancelar',
                      labelButtonYes: 'Salir',
                      colorButtonYes: lightColors.errorColor,
                      widthButtonYes: context.width(.43),
                      onPressedYes: () async {
                        controllerDashboard.setInitLoading(true);
                        controllerHome.setInitLoadiing(true);
                        controllerHome.setRefreshData(true);
                        await secureStorage.setIsLoggedIn(false);
                        await secureStorage.setJwt("");
                        await secureStorage.setUserData("");

                        if (!context.mounted) return;
                        context.go(Routes.splash);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
