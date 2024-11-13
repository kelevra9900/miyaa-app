import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatRepository {}

final chatRepositoryProvider = Provider.autoDispose<ChatRepository>(
  (ref) => ChatRepository(),
);
