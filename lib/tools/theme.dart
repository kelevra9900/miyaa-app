import 'package:flutter/material.dart';

import '../common/custom_colors.dart';

class CustomTheme {
  ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      primaryColor: darkColors.primaryColor,
      scaffoldBackgroundColor: darkColors.backgroundColor,
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Colors.transparent));

  ThemeData ligthTheme = ThemeData(
    useMaterial3: true,
    primaryColor: lightColors.primaryColor,
    scaffoldBackgroundColor: lightColors.backgroundColor,
  );
}
