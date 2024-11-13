import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miyaa/features/dashboard/home/presentation/home_controller.dart';
import 'package:miyaa/features/dashboard/home/presentation/home_state.dart';

import '../../../../../common/custom_colors.dart';
import '../../../../../tools/custom_dialogs.dart';
import '../../../../../tools/models/modal_dynamic_data.dart';
import '../../../../../tools/paths/paths_icons.dart';
import '../../../../../tools/paths/paths_lottie.dart';
import '../../../../../tools/routes.dart';
import '../../../../../widgets/buttons/custom_icon_button.dart';

class HeaderHome extends StatelessWidget implements PreferredSizeWidget {
  const HeaderHome({
    super.key,
    required this.controller,
    required this.state,
  });

  final HomeController controller;
  final HomeState state;

  void _showTrackingDialog(BuildContext context, bool isActive) {
    final title =
        isActive ? 'Geolocalización activada' : 'Geolocalización desactivada';
    final subtitle = isActive
        ? 'Recuerda que al desactivar la geolocalización, no podrás ser rastreado por el sistema. ¿Deseas continuar?'
        : 'Recuerda que al activar la geolocalización, podrás ser rastreado por el sistema. ¿Deseas continuar?';
    final labelButtonYes = isActive ? 'Desactivar' : 'Activar';
    final action = isActive
        ? controller.stopBackgroundLocationService
        : controller.startBackgroundLocationService;

    dialogs.showMessageYesNoDialog(
      context,
      data: ModalDinamicData(
        title: title,
        colorButtonYes:
            isActive ? lightColors.errorColor : lightColors.primaryButtonColor,
        subtitle: subtitle,
        onPressedNo: () => Navigator.pop(context),
        onPressedYes: () async {
          await action();
          if (context.mounted) {
            Navigator.pop(context);
          }
        },
        labelButtonNo: 'Cancelar',
        labelButtonYes: labelButtonYes,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 56),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AppBar(
            backgroundColor: Colors.white.withOpacity(0.2),
            leading: const SizedBox.shrink(),
            leadingWidth: 0,
            elevation: 0,
            centerTitle: false,
            actions: [
              CustomIconButton(
                pathIcon: state.activeTracking
                    ? lottiePaths.pinmaplocation
                    : icons.location,
                isAnimated: state.activeTracking,
                onTap: () => _showTrackingDialog(context, state.activeTracking),
              ),
              const SizedBox(width: 10),
              CustomIconButton(
                pathIcon: icons.bell,
                onTap: () => context.go(Routes.notifications),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
