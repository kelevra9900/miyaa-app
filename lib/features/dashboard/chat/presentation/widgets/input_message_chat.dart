import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/custom_colors.dart';
import '../../../../../common/user_preferences.dart';
import 'modal_button_chat.dart';
import '../../../../../tools/paths/paths_icons.dart';
import '../../../../../tools/styles.dart';

class InputMessageBar extends StatefulWidget {
  final List<Widget>? actions;
  final TextEditingController controller;
  final bool fileSelected;
  final void Function(String)? onTextChanged;
  final void Function(String)? onSend;
  final void Function(dynamic)? onFileSelected;

  const InputMessageBar({
    super.key,
    this.actions,
    required this.controller,
    this.onTextChanged,
    this.onSend,
    this.onFileSelected,
    this.fileSelected = true,
  });

  @override
  State<InputMessageBar> createState() => _InputMessageBarState();
}

class _InputMessageBarState extends State<InputMessageBar> {
  bool enabledOptions = false;
  File? selectedFile;

  void _clearSelectedFile() {
    setState(() {
      selectedFile = null;
    });

    if (widget.onFileSelected != null) {
      widget.onFileSelected!(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanUpdate: (details) {
          setState(() {
            enabledOptions = false;
          });
        },
        onTap: () {
          setState(() {
            enabledOptions = false;
          });
        },
        child: Column(
          mainAxisSize: enabledOptions ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (enabledOptions) ...[
              ContainerButtonsChat(
                context: context,
                onFileSelected: (file) {
                  setState(() {
                    selectedFile = file;
                  });
                  widget.onFileSelected!(file);
                },
              ),
              SizedBox(height: 5.sp),
            ],
            Container(
              color: prefs.isDarkMode
                  ? darkColors.backgroundColor
                  : lightColors.backgroundColor,
              padding: EdgeInsets.symmetric(
                vertical: 20.sp,
                horizontal: 16.sp,
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 0, right: 12.sp),
                    child: InkWell(
                        child: Icon(
                          Icons.attach_file,
                          color: prefs.isDarkMode
                              ? lightColors.grey0
                              : lightColors.grey01,
                          size: 24,
                        ),
                        onTap: () {
                          setState(() {
                            enabledOptions = !enabledOptions;
                          });
                        }),
                  ),
                  Expanded(
                    child: TextField(
                      controller: widget.controller,
                      keyboardType: TextInputType.multiline,
                      textCapitalization: TextCapitalization.sentences,
                      minLines: 1,
                      maxLines: 3,
                      onChanged: widget.onTextChanged,
                      cursorHeight: 24,
                      cursorWidth: 1,
                      cursorColor: Colors.black,
                      style: styles.textStyle(),
                      decoration: InputDecoration(
                        hintText: "Escribe tu mensaje",
                        hintMaxLines: 1,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        hintStyle: styles.textStyle(
                            textColor: prefs.isDarkMode
                                ? lightColors.grey0
                                : lightColors.grey01),
                        fillColor: prefs.isDarkMode
                            ? darkColors.containerColor
                            : Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 0.2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.black26,
                            width: 0.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: InkWell(
                      child: Container(
                        height: 44.sp,
                        width: 44.sp,
                        decoration: BoxDecoration(
                          color: prefs.isDarkMode
                              ? lightColors.primaryColor
                              : darkColors.backgroundColor,
                          shape: BoxShape.circle,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(icons.send),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          enabledOptions = false;
                        });
                        final trimmedText = widget.controller.text.trim();
                        if (trimmedText.isNotEmpty) {
                          widget.onSend?.call(trimmedText);
                          widget.controller.clear();
                        }

                        if (selectedFile != null) {
                          widget.onFileSelected?.call(selectedFile);
                          _clearSelectedFile();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
