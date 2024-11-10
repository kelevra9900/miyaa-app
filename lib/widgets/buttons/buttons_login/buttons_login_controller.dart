import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'buttons_login_state.dart';

class ButtonsLoginController extends StateNotifier<ButtonsLoginState> {
  ButtonsLoginController() : super(ButtonsLoginState());

  void toggleSelection(int id) {
    state = state.copyWith(id: id);
  }
}

final buttonsLoginController = StateNotifierProvider.autoDispose<
    ButtonsLoginController, ButtonsLoginState>((ref) {
  return ButtonsLoginController();
});
