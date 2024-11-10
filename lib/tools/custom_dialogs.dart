import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/custom_colors.dart';
import '../common/user_preferences.dart';
import '../features/init/presentation/loading/widgets/loader.dart';
import 'models/modal_dynamic_data.dart';
import '../widgets/modals/modal_affirmation_message.dart';
import '../widgets/modals/modal_message.dart';

class CustomDialogs {
  showMessageDialog(
    BuildContext context, {
    required ModalDinamicData data,
    bool? enableDrag,
    bool? isDismissible,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: enableDrag ?? true,
      isDismissible: isDismissible ?? true,
      backgroundColor: prefs.isDarkMode
          ? darkColors.backgroundColor
          : const Color(0XFFFDFDFD),
      barrierColor: prefs.isDarkMode
          ? const Color(0XFF373737).withOpacity(.9)
          : const Color(0XFF373737).withOpacity(.8),
      builder: (BuildContext context) {
        return ModalMessage(data: data);
      },
    );
  }

  showMessageYesNoDialog(
    BuildContext context, {
    required ModalDinamicData data,
    bool? enableDrag,
    bool? isDismissible,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: enableDrag ?? true,
      isDismissible: isDismissible ?? true,
      backgroundColor: prefs.isDarkMode
          ? darkColors.backgroundColor
          : const Color(0XFFFDFDFD),
      barrierColor: prefs.isDarkMode
          ? const Color(0XFF373737).withOpacity(.9)
          : const Color(0XFF373737).withOpacity(.8),
      builder: (BuildContext context) {
        return ModalAffirmationMessage(data: data);
      },
    );
  }

  showModalBottomDynamic(BuildContext context,
      {required Widget child, bool? isDismissible, bool? enableDrag}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: enableDrag ?? true,
      isDismissible: isDismissible ?? true,
      backgroundColor: prefs.isDarkMode
          ? darkColors.backgroundColor
          : const Color(0XFFFDFDFD),
      barrierColor: prefs.isDarkMode
          ? const Color(0XFF373737).withOpacity(.9)
          : const Color(0XFF373737).withOpacity(.8),
      builder: (BuildContext context) {
        return child;
      },
    );
  }

  showLoadingDialog(BuildContext context, {bool popDialog = false}) {
    popDialog
        ? Navigator.pop(context)
        : showDialog(
            context: context,
            useSafeArea: false,
            barrierColor: Colors.black.withOpacity(.8),
            barrierDismissible: false,
            builder: (context) {
              return const Loader();
            });
  }

  void showCardOptions({
    required double? topHeight,
    required double? leftWidth,
    required BuildContext context,
    required Widget child,
  }) =>
      showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.transparent,
        anchorPoint: const Offset(0, 0),
        builder: (context) {
          double? top = topHeight! - 30.sp;
          double? left = leftWidth! - 90.sp;
          return Center(
            child: Material(
                type: MaterialType.transparency,
                child: Stack(
                  children: [
                    Positioned(
                      top: top,
                      left: left,
                      child: child,
                    ),
                  ],
                )),
          );
        },
      );
}

final CustomDialogs dialogs = CustomDialogs();
