import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miyaa/features/login/data/login_repository.dart';

import 'login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController({
    required this.loginRepository,
  }) : super(LoginState());
  final LoginRepository loginRepository;

  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }
}

final loginController =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(
    loginRepository: ref.watch(loginRepositoryProvider),
  );
});
