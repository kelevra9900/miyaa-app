import 'package:flutter/material.dart';

import '../../../../common/custom_colors.dart';
import '../../../../common/user_preferences.dart';
import '../../../../tools/paths/paths_icons.dart';
import '../../../../widgets/tiles/custom_tile_button.dart';

class ProfileMenuOptions extends StatelessWidget {
  const ProfileMenuOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: prefs.isDarkMode
                ? darkColors.containerColor
                : lightColors.white01,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            CustomTileButton(
                title: 'Beneficios',
                leadingIcon: icons.starBorder,
                voidCallback: () => {},
                size: 14),
            CustomTileButton(
                title: 'Actualizar perfil',
                leadingIcon: icons.profile2,
                voidCallback: () => {},
                size: 14),
            // CustomTileButton(
            //     title: 'Servicios de terceros',
            //     leadingIcon: icons.category,
            //     voidCallback: () => context.go(Routes.thirdServices),
            //     size: 14),
            CustomTileButton(
                title: 'Configuración',
                leadingIcon: icons.setting,
                voidCallback: () => {},
                size: 14,
                hasDivider: false),
          ],
        ));
  }
}
