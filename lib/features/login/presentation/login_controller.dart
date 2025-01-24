import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/network/custom_catch_error.dart';
import '../../../common/secure_storage.dart';
import '../../notifications/data/notifications_repository.dart';
import '../data/login_repository.dart';
import '../domain/user.dart';
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
        var response = await loginRepository.uploadBiometric(
            file: image.path, context: ctx);
        // GoRouter.of(ctx).go('/home');

        log('Response uploadBiometric: $response');
      } catch (e) {
        print('Error to upload image on controller ========: $e');
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
