import 'dart:developer';

import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miyaa/features/dashboard/chat/presentation/chat_controller.dart';
import 'package:miyaa/features/dashboard/chat/presentation/widgets/custom_header_chat.dart';
import 'package:miyaa/features/login/domain/user.dart';
import '../../../../tools/extensions/dimens_extension.dart';

import '../../../../common/custom_colors.dart';
import '../../../../common/user_preferences.dart';
import '../../profile/profile_controller.dart';
import '../presentation/widgets/input_message_chat.dart';

class ChatMessages extends ConsumerStatefulWidget {
  const ChatMessages({
    super.key,
    required this.chatId,
    required this.user,
  });
  final String chatId;
  final User user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends ConsumerState<ChatMessages> {
  TextEditingController tecMessage = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initialize();
    });
  }

  void initialize() {
    log("conversationId: ${widget.chatId}");
    log('user id: ${widget.user.id}');
    var controller = ref.read(profileController.notifier);
    var chatController = ref.read(chatControllerProvider.notifier);
    // Set loading to true
    chatController.setIsLoading(true);
    controller.initData();
    Future.delayed(const Duration(seconds: 1), () {
      ref
          .read(chatControllerProvider.notifier)
          .getMessages(widget.user.id, widget.chatId);

      // Set loading to false
      chatController.setIsLoading(false);
    });
  }

  @override
  void dispose() {
    tecMessage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(chatControllerProvider.notifier);
    var state = ref.watch(chatControllerProvider);
    var profileState = ref.watch(profileController);

    return Scaffold(
      backgroundColor:
          prefs.isDarkMode ? darkColors.containerColor : Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.height(.12)),
        child: CustomHeaderChat(controller: controller, user: widget.user),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      reverse: true,
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        return BubbleNormal(
                          text: state.messages[index].content ?? '',
                          isSender: profileState.userData?.user?.id ==
                              state.messages[index].userId,
                          color: profileState.userData?.user?.id ==
                                  state.messages[index].userId
                              ? lightColors.primaryColor
                              : lightColors.grey01,
                          tail: true,
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
            ),
            Container(
              padding: const EdgeInsets.all(0),
              child: InputMessageBar(
                controller: tecMessage,
                onSend: (message) {
                  int currentUserId = profileState.userData?.user?.id ?? 0;
                  ref.read(chatControllerProvider.notifier).sendMessage(
                      message, widget.user.id!, currentUserId, widget.chatId);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
