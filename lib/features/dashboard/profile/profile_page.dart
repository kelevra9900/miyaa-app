import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/custom_colors.dart';
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
    var state = ref.watch(profileController);
    return CustomScrollView(slivers: [
      SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 32.sp),
            child: Column(
              children: [
                const Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Row(
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
                  urlImage: state.userData?.user?.image,
                  name:
                      "${state.userData?.user?.firstName} ${state.userData?.user?.lastName}",
                ),
                SizedBox(height: 35.sp),
                // const ProfileMenuOptions(),
                Expanded(child: SizedBox(height: 60.sp)),
                SizedBox(height: 30.sp),
                PrimaryButton(
                  backgroundColor: lightColors.errorColor,
                  borderColor: lightColors.errorColor,
                  text: 'Cerrar sesión',
                  enabled: true,
                  onPressed: () => dialogs.showMessageYesNoDialog(
                    context,
                    data: ModalDinamicData(
                      title: 'Salir',
                      subtitle: 'Estas seguro de cerrar sesión?',
                      labelButtonNo: 'Cancelar',
                      labelButtonYes: 'Salir',
                      colorButtonYes: lightColors.errorColor,
                      widthButtonYes: context.width(.43),
                      onPressedYes: () async {},
                    ),
                  ),
                )
              ],
            ),
          ))
    ]);
  }
}
