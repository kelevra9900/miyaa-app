import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/custom_colors.dart';
import '../../common/user_preferences.dart';
import '../../tools/custom_text.dart';
import '../../tools/paths/paths_gifs.dart';

enum ButtonType { primary, secondary }

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final ButtonType? buttonType;
  final Widget? icon;
  final bool? enabled;
  final bool? shadow;
  final double? height;
  final double? width;
  final bool? isLoading;
  final double? fontSizeText;
  final EdgeInsetsGeometry? buttonPadding;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.buttonType = ButtonType.primary,
    this.icon,
    this.enabled = true,
    this.height,
    this.width,
    this.isLoading = false,
    this.fontSizeText,
    this.buttonPadding,
    this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    return TextButtonTheme(
      data: TextButtonThemeData(
        style: ButtonStyle(
          elevation: shadow != null
              ? WidgetStateProperty.all(0)
              : WidgetStateProperty.all(5),
          shadowColor: WidgetStateProperty.all(_getShadowColor(buttonType)),
          backgroundColor: WidgetStateProperty.all(
            _getBackgroundColor(buttonType),
          ),
          maximumSize:
              width != null ? WidgetStatePropertyAll(Size(width!, 100)) : null,
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(
                color: borderColor ?? _getBorderColor(buttonType),
              ),
              borderRadius: BorderRadius.circular(10.sp),
            ),
          ),
          minimumSize: WidgetStateProperty.all(
            Size(width ?? 160, height ?? 48.sp),
          ),
          foregroundColor:
              WidgetStateProperty.all(_getBackgroundColor(buttonType)),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      child: TextButton(
          onPressed: enabled! && isLoading == false ? () => onPressed() : null,
          child: Padding(
            padding:
                buttonPadding ?? const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: icon != null
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (isLoading!) ...[
                  SizedBox(
                    height: 30.sp,
                    width: 30.sp,
                    child: Image.asset(gifs.loading),
                  )
                ] else ...[
                  CustomText(
                    text,
                    textColor: textColor ?? _getTextColor(buttonType),
                    fontWeight: FontWeight.w600,
                    fontSize: fontSizeText ?? 16.sp,
                  ),
                ]
              ],
            ),
          )),
    );
  }

  _getBackgroundColor(ButtonType? buttonType) {
    switch (buttonType) {
      case ButtonType.primary:
        return backgroundColor ??
            (enabled!
                ? lightColors.primaryButtonColor
                : lightColors.primaryButtonDisabledColor);

      case ButtonType.secondary:
        return backgroundColor ??
            (enabled! ? Colors.transparent : lightColors.grey01);

      default:
        return backgroundColor ??
            (enabled!
                ? lightColors.primaryButtonColor
                : lightColors.primaryButtonDisabledColor);
    }
  }

  _getShadowColor(ButtonType? buttonType) {
    switch (buttonType) {
      case ButtonType.primary:
        return const Color.fromRGBO(75, 115, 247, 0.20);

      case ButtonType.secondary:
        return Colors.transparent;

      default:
        return Colors.transparent;
    }
  }

  _getBorderColor(ButtonType? buttonType) {
    switch (buttonType) {
      case ButtonType.primary:
        return borderColor ??
            (enabled!
                ? lightColors.primaryColor
                : lightColors.primaryButtonDisabledColor);

      case ButtonType.secondary:
        return borderColor ??
            (enabled!
                ? prefs.isDarkMode
                    ? lightColors.backgroundColor
                    : darkColors.backgroundColor
                : lightColors.primaryButtonDisabledColor);

      default:
        return backgroundColor ??
            (enabled!
                ? lightColors.primaryButtonColor
                : lightColors.primaryButtonDisabledColor);
    }
  }

  _getTextColor(ButtonType? buttonType) {
    switch (buttonType) {
      case ButtonType.primary:
        return textColor ?? Colors.white;

      case ButtonType.secondary:
        return textColor ??
            (prefs.isDarkMode
                ? lightColors.backgroundColor
                : darkColors.backgroundColor);

      default:
        return backgroundColor ??
            (enabled!
                ? lightColors.primaryButtonColor
                : lightColors.primaryButtonDisabledColor);
    }
  }
}
