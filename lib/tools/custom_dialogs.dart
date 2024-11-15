import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/custom_colors.dart';
import '../common/user_preferences.dart';
import '../features/init/presentation/loading/widgets/loader.dart';
import 'models/modal_dynamic_data.dart';
import '../widgets/modals/modal_affirmation_message.dart';
import '../widgets/modals/modal_message.dart';

class CustomDialogs {
  void showImageSourceDialog(
    BuildContext context,
    Function() onCamera,
    Function() onGallery,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      backgroundColor: const Color(0XFFFDFDFD),
      barrierColor: const Color(0XFF373737).withOpacity(.8),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Tomar foto'),
              onTap: () {
                log('Tomar foto');
                Navigator.pop(context);
                onCamera();
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Seleccionar de la galería'),
              onTap: () {
                log('Seleccionar de la galería');
                Navigator.pop(context);
                onGallery();
              },
            ),
          ],
        );
      },
    );
  }

  void showMessageDialog(
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

  void showMessageYesNoDialog(
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

  void showModalBottomDynamic(BuildContext context,
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

  void showLoadingDialog(BuildContext context, {bool popDialog = false}) {
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

  showSuccessDialog(BuildContext context, {required String message}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      backgroundColor: const Color(0XFFFDFDFD),
      barrierColor: const Color(0XFF373737).withOpacity(.8),
      builder: (BuildContext context) {
        return ModalMessage(
          data: ModalDinamicData(
            title: '¡Éxito!',
            isSuccess: true,
            subtitle: message,
            labelButton: 'Aceptar',
            colorButton: const Color(0XFF00A7DC),
            onPressed: () => Navigator.pop(context),
          ),
        );
      },
    );
  }

  void showSnackBar({
    required BuildContext context,
    required String message,
    bool? isError,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            message,
            style: TextStyle(
              color: isError! ? Colors.white : Colors.black,
              fontSize: 15.sp,
            ),
          ),
        ),
        backgroundColor: isError ? Colors.red : Colors.black,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

final CustomDialogs dialogs = CustomDialogs();
