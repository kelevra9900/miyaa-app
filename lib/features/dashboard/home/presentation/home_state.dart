import '../../../login/domain/user.dart';
import '../domain/announcement.dart';

class HomeState {
  final bool initLoading;
  final bool isLoading;
  final bool activeTracking;
  final bool refreshData;
  final UserResponse? userData;
  final int idScreenHome;
  final List<Announcement>? announcements;

  HomeState({
    this.initLoading = true,
    this.refreshData = true,
    this.userData,
    this.idScreenHome = 0,
    this.isLoading = false,
    this.activeTracking = false,
    this.announcements = const [],
  });

  HomeState copyWith({
    bool? initLoading,
    bool? refreshData,
    UserResponse? userData,
    int? idScreenHome,
    bool? isLoading,
    bool? activeTracking,
    List<Announcement>? announcements,
  }) {
    return HomeState(
      initLoading: initLoading ?? this.initLoading,
      refreshData: refreshData ?? this.refreshData,
      userData: userData ?? this.userData,
      idScreenHome: idScreenHome ?? this.idScreenHome,
      isLoading: isLoading ?? this.isLoading,
      activeTracking: activeTracking ?? this.activeTracking,
      announcements: announcements ?? this.announcements,
    );
  }
}
