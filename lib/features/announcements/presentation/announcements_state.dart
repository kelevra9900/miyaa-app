import '../domain/announcement.dart';

class AnnouncementsState {
  final List<Announcement> announcements;
  final bool isLoading = false;

  AnnouncementsState({
    this.announcements = const [],
  });

  AnnouncementsState copyWith({
    List<Announcement>? announcements,
  }) {
    return AnnouncementsState(
      announcements: announcements ?? this.announcements,
    );
  }
}
