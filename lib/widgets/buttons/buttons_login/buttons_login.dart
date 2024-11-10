import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/custom_colors.dart';
import '../../../common/user_preferences.dart';
import '../../../tools/custom_text.dart';
import 'buttons_login_controller.dart';

typedef Callback = void Function(int? response);

class ButtonsLogin extends ConsumerStatefulWidget {
  final Callback callback;
  final int id;
  final String label;

  const ButtonsLogin({
    super.key,
    required this.callback,
    required this.id,
    required this.label,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ButtonsLoginState();
}

class _ButtonsLoginState extends ConsumerState<ButtonsLogin> {
  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(buttonsLoginController.notifier);
    var state = ref.watch(buttonsLoginController);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => {
            controller.toggleSelection(widget.id),
            widget.callback(widget.id)
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              border: BorderDirectional(
                bottom: BorderSide(
                  color: widget.id == state.id
                      ? (prefs.isDarkMode
                          ? Colors.white
                          : lightColors.primaryColor)
                      : Colors.transparent,
                ),
              ),
            ),
            child: CustomText(
              widget.label,
              fontSize: 16,
              fontWeight: FontWeight.w800,
              textColor: widget.id == state.id
                  ? lightColors.primaryColor
                  : lightColors.grey01,
            ),
          ),
        ),
      ],
    );
  }
}
