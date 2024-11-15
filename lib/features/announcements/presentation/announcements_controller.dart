import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/announcements_repository.dart';
import 'announcements_state.dart';

class AnnouncementsController extends StateNotifier<AnnouncementsState> {
  AnnouncementsController({
    required this.announcementsRepository,
  }) : super(AnnouncementsState());

  final AnnouncementsRepository announcementsRepository;

  Future<void> initData() async {
    await getAnnouncements();
  }

  Future<void> getAnnouncements() async {
    try {
      final response = await announcementsRepository.getAnnouncements();
      if (response.data != null) {
        state = state.copyWith(announcements: response.data);
      }
    } catch (e) {
      rethrow;
    }
  }
}

final announcementsControllerProvider =
    StateNotifierProvider<AnnouncementsController, AnnouncementsState>(
  (ref) => AnnouncementsController(
    announcementsRepository: ref.watch(announcementsRepository),
  ),
);
