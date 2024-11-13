import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/chat_list.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatState();
}

class _ChatState extends ConsumerState<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return const ChatList();
  }
}
