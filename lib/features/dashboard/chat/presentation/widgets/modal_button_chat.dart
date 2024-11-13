import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common/custom_colors.dart';
import '../../../../../common/user_preferences.dart';
import 'button_chat.dart';
import '../../../../../tools/extensions/dimens_extension.dart';
import '../../../../../tools/paths/paths_icons.dart';

class ContainerButtonsChat extends StatelessWidget {
  const ContainerButtonsChat({
    super.key,
    required this.context,
    required this.onFileSelected,
  });

  final BuildContext context;
  final Function(File) onFileSelected;

  Future<void> _pickFile() async {
    // FilePickerResult? result =
    //     await FilePicker.platform.pickFiles(type: FileType.any);
    // if (result != null) {
    //   File file = File(result.files.single.path!);
    //   onFileSelected(file);
    // }
  }

  Future<void> _pickImage(dynamic source) async {
    // final ImagePicker picker = ImagePicker();
    // final XFile? image = await picker.pickImage(source: source);
    // if (image != null) {
    //   File file = File(image.path);
    //   onFileSelected(file);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.width(.9),
        decoration: BoxDecoration(
          color: prefs.isDarkMode
              ? darkColors.backgroundColor
              : lightColors.backgroundColor,
          borderRadius: BorderRadius.circular(12.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(16.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonOptionChat(
              label: "Cámara",
              pathIcon: icons.camera,
              onTap: () => {},
            ),
            ButtonOptionChat(
              label: "Galería",
              pathIcon: icons.gallery,
              onTap: () => {},
            ),
            ButtonOptionChat(
              label: "Documento",
              pathIcon: icons.document,
              onTap: _pickFile,
            ),
          ],
        ));
  }
}
