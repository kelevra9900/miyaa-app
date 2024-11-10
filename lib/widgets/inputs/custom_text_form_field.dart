import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../common/custom_colors.dart';
import '../../common/user_preferences.dart';
import '../../tools/custom_text.dart';
import '../../tools/extensions/custom_text_formatters.dart';
import '../../tools/paths/paths_icons.dart';
import '../../tools/styles.dart';

import '../../tools/validators.dart';

class CustomTextFormField extends StatefulWidget {
  /// Titulo input.
  final String label;
  final double? labelFontSize;
  final FontWeight? fontWeight;

  final double? width;

  /// Text controller.
  final TextEditingController controller;

  /// Whether the form is able to receive user input.
  final bool? enabled;

  /// Tipo de dato que se ingresará en el formulario.
  final InputValueType? inputValueType;

  /// Si es repetición de valor se debe validar.
  final String? matchValue;

  /// HintText del textFormField.
  final String? hintText;

  /// Ubicación icono de suffix;
  final String? suffixIconPath;

  /// Ubicación icono de prefix;
  final String? prefixIconPath;
  //Funcion para detectar los cambios en los inputs
  final Function(String)? onChanged;

  final Color? backgroundColor;

  final bool? suffixIconEnabled;

  final double? preffixSpacingWidth;

  final double? runSpacing;
  final Function()? onTap;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final bool? errorBack;
  final String? errorBackMessage;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.suffixIconPath,
    required this.controller,
    this.enabled = true,
    this.inputValueType = InputValueType.text,
    this.matchValue,
    this.hintText,
    this.onChanged,
    this.prefixIconPath,
    this.labelFontSize,
    this.fontWeight,
    this.backgroundColor,
    this.suffixIconEnabled = false,
    this.runSpacing,
    this.preffixSpacingWidth,
    this.onTap,
    this.width,
    this.height,
    this.padding,
    this.alignment,
    this.errorBack = false,
    this.errorBackMessage,
  });

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  FocusNode focusNode = FocusNode();
  bool obscureText = false;
  bool? showError = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      setState(() {});
    });

    Future.delayed(
      Duration.zero,
      () => {
        _defineObscureTextValue(),
        _addTextControllerListener(),
      },
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != "") ...[
          Row(
            children: [
              CustomText(
                widget.label,
                fontWeight: widget.fontWeight ?? FontWeight.w600,
                fontSize: widget.labelFontSize ?? 14,
                textColor: prefs.isDarkMode
                    ? darkColors.textColor
                    : lightColors.textColor,
              ),
            ],
          ),
          SizedBox(
            width: widget.width,
            child: Column(
              children: [
                /// Mensaje error
                if (showError! && errorMessage != "" || widget.errorBack!) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        widget.errorBack!
                            ? widget.errorBackMessage
                            : errorMessage ?? "Esto es un error",
                        textColor: lightColors.errorColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                      ),
                    ],
                  ),
                  SizedBox(height: 4.sp),
                ] else ...[
                  SizedBox(height: 10.sp),
                ]
              ],
            ),
          )
        ],
        InkWell(
          onTap: widget.onTap != null ? widget.onTap!() : null,
          child: Container(
            height: widget.height ?? 56.sp,
            width: widget.width,
            padding:
                widget.padding ?? const EdgeInsets.only(left: 16, right: 18),
            alignment: widget.alignment ?? Alignment.center,
            decoration: BoxDecoration(
              color: widget.enabled!
                  ? (focusNode.hasFocus
                      ? prefs.isDarkMode
                          ? Colors.transparent
                          : Colors.white
                      : prefs.isDarkMode
                          ? (widget.controller.text.isEmpty
                              ? darkColors.containerColor
                              : Colors.transparent)
                          : (widget.controller.text.isEmpty
                              ? lightColors.containerColor
                              : Colors.white))
                  : prefs.isDarkMode
                      ? darkColors.containerColor
                      : lightColors.grey0,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: widget.enabled!
                  ? Border.fromBorderSide(BorderSide(color: _accentColor()))
                  : null,
            ),
            child: TextFormField(
              focusNode: focusNode,
              controller: widget.controller,
              maxLines:
                  widget.inputValueType == InputValueType.paragraph ? null : 1,
              validator: (x) => _validateInput(x ?? ''),
              onChanged: widget.onChanged,
              enabled: widget.enabled,
              autofocus: false,
              style: TextStyle(
                fontFamily: "PlusJakartaSans",
                color: prefs.isDarkMode
                    ? darkColors.textColor
                    : lightColors.textColor,
                fontSize: 14.sp,
                decoration: TextDecoration.none,
                decorationThickness: 0,
              ),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isCollapsed: true,
                errorStyle: const TextStyle(
                  fontSize: 0,
                  color: Colors.red,
                ),
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontFamily: "PlusJakartaSans",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: widget.suffixIconEnabled! ? currentIcon() : null,
                prefixIcon: widget.prefixIconPath != null
                    ? Padding(
                        padding: EdgeInsets.only(
                            right: widget.preffixSpacingWidth ?? 10.sp),
                        child: SvgPicture.asset(
                          widget.prefixIconPath!,
                          fit: BoxFit.contain,
                          colorFilter: ColorFilter.mode(
                              focusNode.hasFocus
                                  ? (prefs.isDarkMode
                                      ? darkColors.enabledIconColor
                                      : lightColors.enabledIconColor)
                                  : (prefs.isDarkMode
                                      ? darkColors.disabledIconColor
                                      : (widget.controller.text.isEmpty
                                          ? lightColors.disabledIconColor
                                          : lightColors.enabledIconColor)),
                              BlendMode.srcIn),
                        ),
                      )
                    : null,
                prefixIconConstraints:
                    BoxConstraints(maxHeight: 40.sp, maxWidth: 40.sp),
              ),
              keyboardType: _keyboardType(),
              inputFormatters: [
                if (widget.inputValueType == InputValueType.password ||
                    widget.inputValueType == InputValueType.changePasword ||
                    widget.inputValueType == InputValueType.email) ...[
                  FilteringTextInputFormatter.deny(
                      RegExp(r'\s')), // Rechazar espacios en blanco
                ],
                if (widget.inputValueType == InputValueType.document) ...[
                  FilteringTextInputFormatter.digitsOnly
                ],
                if (widget.inputValueType == InputValueType.document) ...[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  LengthLimitingTextInputFormatter(13),
                ],
                if (widget.inputValueType == InputValueType.name) ...[
                  SingleSpaceInputFormatter(),
                  FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
                ],
                if (widget.inputValueType == InputValueType.surname ||
                    widget.inputValueType == InputValueType.secondSurname) ...[
                  FilteringTextInputFormatter.deny(
                      RegExp(r'\s')), // Rechazar espacios en blanco
                  FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
                ],
                if (widget.inputValueType == InputValueType.cvv) ...[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
                if (widget.inputValueType == InputValueType.zipCode) ...[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                if (widget.inputValueType == InputValueType.cvv4) ...[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                if (widget.inputValueType == InputValueType.dateExpiration) ...[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9\-/]')),
                  CustomInputFormatter(
                    mask: 'xx/xx',
                    separator: '/',
                  )
                ],
              ],
              obscureText: obscureText,
              obscuringCharacter: "*",
              cursorHeight: 24,
              cursorWidth: 1,
              cursorColor: prefs.isDarkMode
                  ? darkColors.textColor
                  : lightColors.textColor,
            ),
          ),
        ),
      ],
    );
  }

  void onTapSuffixIcon() {
    obscureText = !obscureText;
    setState(() {});
  }

  Color _accentColor() {
    if (showError!) {
      return lightColors.errorColor;
    }
    return focusNode.hasFocus
        ? (prefs.isDarkMode
            ? darkColors.enabledBorder
            : lightColors.enabledBorder)
        : (widget.controller.text.isEmpty
            ? Colors.transparent
            : (prefs.isDarkMode
                ? darkColors.enabledBorder
                : lightColors.enabledBorder));
  }

  _defineObscureTextValue() {
    setState(() {
      obscureText = (widget.inputValueType == InputValueType.password ||
          widget.inputValueType == InputValueType.changePasword ||
          widget.inputValueType == InputValueType.cardNumber ||
          widget.inputValueType == InputValueType.cvv ||
          widget.inputValueType == InputValueType.cvv4);
    });
  }

  _validate(String text) {
    switch (widget.inputValueType) {
      case InputValueType.email:
        errorMessage = validateEmail(text);
        break;
      case InputValueType.password:
        errorMessage = validatePassword(text, matchValue: widget.matchValue);
        break;
      case InputValueType.changePasword:
        errorMessage =
            validateChangePassword(text, matchValue: widget.matchValue);
        break;
      case InputValueType.phone:
        errorMessage = validatePhone(text, matchValue: widget.matchValue);
        break;
      case InputValueType.document:
        errorMessage = validateDocument(text);
        break;
      case InputValueType.dateExpiration:
        errorMessage = validateExpiryDate(text);
        break;
      case InputValueType.name:
        errorMessage = validateName(text);
        break;
      case InputValueType.surname:
        errorMessage = validateName(text);
        break;
      case InputValueType.secondSurname:
        errorMessage = validateSecondSurname(text);
        break;
      case InputValueType.currency:
      case InputValueType.text:
      case InputValueType.paragraph:
      default:
        errorMessage = validateText(text, matchValue: widget.matchValue);
        break;
    }
    showError = errorMessage != null;
    return errorMessage;
  }

  _addTextControllerListener() {
    widget.controller.addListener(() {});
  }

  currentIcon() {
    switch (widget.inputValueType) {
      case InputValueType.password:
      case InputValueType.changePasword:
      case InputValueType.cardNumber:
      case InputValueType.cvv:
      case InputValueType.cvv4:
        return InkWell(
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          onTap: () => onTapSuffixIcon(),
          child: Container(
            height: 24.sp,
            width: 24.sp,
            alignment: Alignment.center,
            child: Stack(
              children: [
                SvgPicture.asset(
                  obscureText ? icons.closedEyePassword : icons.openEyePassword,
                  colorFilter: styles.colorFilterIcon(),
                ),
              ],
            ),
          ),
        );

      default:
        return widget.suffixIconEnabled != null
            ? Container(
                width: 1.sp,
                alignment: Alignment.centerRight,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      widget.suffixIconPath!,
                      colorFilter: styles.colorFilterIcon(),
                    ),
                  ],
                ),
              )
            : null;
    }
  }

  String? _validateInput(String x) {
    _validate(x);
    setState(() {});
    return errorMessage;
  }

  _keyboardType() {
    switch (widget.inputValueType) {
      case InputValueType.email:
        return TextInputType.emailAddress;

      ///
      case InputValueType.password:
      case InputValueType.changePasword:
        return TextInputType.visiblePassword;

      ///
      case InputValueType.phone:
      case InputValueType.document:
      case InputValueType.cardNumber:
      case InputValueType.cvv:
      case InputValueType.cvv4:
      case InputValueType.dateExpiration:
      case InputValueType.zipCode:
        return TextInputType.number;

      ///
      case InputValueType.paragraph:
        return TextInputType.multiline;

      ///
      case InputValueType.text:
      case InputValueType.name:
      case InputValueType.surname:
      case InputValueType.secondSurname:
      case InputValueType.cardName:
      default:
        return TextInputType.text;
    }
  }
}

enum InputValueType {
  text,
  phone,
  email,
  password,
  changePasword,
  document,
  currency,
  name,
  surname,
  secondSurname,
  cardName,
  cardNumber,
  cvv,
  cvv4,
  dateExpiration,
  paragraph,
  zipCode
}
