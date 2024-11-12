import 'dart:convert';

import '../../../common/secure_storage.dart';
import '../../login/domain/user.dart';
import 'data/profile_repository.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'profile_state.dart';

class ProfileController extends StateNotifier<ProfileState> {
  ProfileController({
    required this.profileRepository,
  }) : super(ProfileState());

  final ProfileRepository profileRepository;

  void updateUserData(UserResponse userData) {
    state = state.copyWith(userData: userData);
  }

  Future<void> initData() async {
    await getUserData();
  }

  Future<void> getUserData() async {
    String? currentUser = await secureStorage.userData;
    if (currentUser == null || currentUser == "") {
      UserResponse userData = await profileRepository.getProfileData();
      state = state.copyWith(userData: userData);
    } else {
      state = state.copyWith(
          userData: UserResponse.fromJson(json.decode(currentUser)));
    }
  }
}

final profileController =
    StateNotifierProvider<ProfileController, ProfileState>((ref) {
  return ProfileController(
    profileRepository: ref.watch(profileRepositoryProvider),
  );
});
