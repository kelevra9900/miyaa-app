import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miyaa/common/network/custom_catch_error.dart';
import 'package:miyaa/features/login/data/login_repository.dart';
import 'package:miyaa/features/login/domain/user.dart';
import 'package:miyaa/tools/routes.dart';

import '../../../common/secure_storage.dart';
import '../../notifications/data/notifications_repository.dart';
import 'login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController({
    required this.loginRepository,
    required this.notificationsRepository,
  }) : super(LoginState());
  final LoginRepository loginRepository;
  final NotificationsRepository notificationsRepository;

  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  Future<void> getUserData() async {
    String? currentUser = await secureStorage.userData;
    if (currentUser == null || currentUser.isEmpty) {
      UserResponse userData = await loginRepository.getUserData();
      state = state.copyWith(userData: userData);
    } else {
      state = state.copyWith(
          userData: UserResponse.fromJson(json.decode(currentUser)));
    }
  }

  void openCamera(BuildContext ctx) async {
    setIsLoading(true);
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null && image.path.isNotEmpty) {
      try {
        var response = await loginRepository.uploadBiometric(file: image.path);
        // GoRouter.of(ctx).go('/home');

        log('Response uploadBiometric: $response');
      } catch (e) {
        customError.catchError(e: 'Intenta de nuevo por favor', context: ctx);
      } finally {
        setIsLoading(false);
      }
    }
  }
}

final loginController =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(
    loginRepository: ref.watch(loginRepositoryProvider),
    notificationsRepository: ref.watch(notificationsRepositoryProvider),
  );
});
