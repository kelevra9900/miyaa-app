import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miyaa/features/dashboard/chat/presentation/chat_controller.dart';
import 'package:miyaa/features/dashboard/chat/presentation/widgets/custom_header_chat.dart';
import 'package:miyaa/features/login/domain/user.dart';
import '../../../../tools/extensions/dimens_extension.dart';

import '../../../../common/custom_colors.dart';
import '../../../../common/user_preferences.dart';
import '../../../../tools/paths/paths_icons.dart';
import '../../../../tools/styles.dart';
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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref.read(profileController.notifier).initData();
      ref.read(chatControllerProvider.notifier).initialize(widget.chatId);
      ref.read(chatControllerProvider.notifier).initialize(widget.chatId);
    });
  }

  @override
  void sendMessageWithFile(String message, File? file) async {
    // ref.read(chatController.notifier).sendMessageWithFile(message, file);
  }

  void initialize() {
    log('user id: ${widget.user.id}');
    log('Conversation ID: ${widget.chatId.toString()}');
    var profileState = ref.watch(profileController);
    var idUserString = profileState.userData?.user?.id.toString();

    if (idUserString != null) {
      ref.read(chatControllerProvider.notifier).getMessages(
            widget.chatId.toString(),
          );
    }
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
        child: CustomHeaderChat(controller: controller),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: double.infinity,
        child: Column(
          children: [
            // Chip de fecha de inicio

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
              padding: const EdgeInsets.all(10),
              child: InputMessageBar(
                controller: tecMessage,
                onSend: (message) {
                  log('Sending message: $message');
                  log('Current user id: ${jsonEncode(profileState.userData?.user?.id)}');
                  ref.read(chatControllerProvider.notifier).sendMessage(
                        message,
                        int.parse(widget.chatId),
                        profileState.userData!.user!.id!,
                      );
                },
                // textController: _messageController,
                // onSend: (message) {
                //   int currentUserId = profileState.userData?.user.id ?? 0;
                //   ref.read(chatControllerProvider.notifier).sendMessage(
                //         message,
                //         int.parse(widget.id),
                //         currentUserId,
                //       );
                // },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderMessage(dynamic message) {
    switch (message.type) {
      case 'text':
        return _textMessage(message);
      case 'image':
        return _imageMessage(message);
      case 'file':
        return _fileMessage(message);
      default:
        return Container();
    }
  }

  Widget _textMessage(dynamic message) {
    bool isSender = message.isSender ?? false;
    if (isSender) {
      return BubbleNormal(
        text: message.text ?? '',
        isSender: isSender,
        color: isSender
            ? lightColors.primaryColor
            : prefs.isDarkMode
                ? darkColors.backgroundColor
                : lightColors.backgroundColor,
        textStyle: styles.textStyle(
          textColor: isSender
              ? Colors.white
              : (prefs.isDarkMode
                  ? darkColors.textColor
                  : lightColors.textColor),
        ),
        tail: true,
      );
    }
    {
      return BubbleSpecialOne(
        text: message.text ?? '',
        isSender: isSender,
        color: isSender
            ? lightColors.primaryColor
            : prefs.isDarkMode
                ? darkColors.backgroundColor
                : lightColors.backgroundColor,
        textStyle: styles.textStyle(
          textColor: isSender
              ? Colors.white
              : (prefs.isDarkMode
                  ? darkColors.textColor
                  : lightColors.textColor),
        ),
        tail: true,
      );
    }
  }

  Widget _imageMessage(dynamic message) {
    bool isSender = message.isSender ?? false;
    return BubbleNormalImage(
      color: isSender ? lightColors.primaryColor : darkColors.backgroundColor,
      id: message.sId ?? '',
      image: Image.network(
        message.fileUrl ?? '',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _fileMessage(dynamic message) {
    bool isSender = message.isSender ?? false;
    return BubbleNormalImage(
      color: isSender ? lightColors.primaryColor : darkColors.backgroundColor,
      id: message.sId ?? '',
      isSender: isSender,
      onTap: () {
        if (message.fileUrl != null) {
          // launchUrl(Uri.parse(message.fileUrl!));
        }
      },
      image: SvgPicture.asset(
        icons.document,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        width: 40.sp,
        height: 40.sp,
      ),
    );
  }
}
