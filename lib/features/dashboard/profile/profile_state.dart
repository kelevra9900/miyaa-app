import '../../login/domain/user.dart';

class ProfileState {
  final UserResponse? userData;

  ProfileState({this.userData});

  ProfileState copyWith({
    UserResponse? userData,
  }) {
    return ProfileState(
      userData: userData ?? this.userData,
    );
  }
}
