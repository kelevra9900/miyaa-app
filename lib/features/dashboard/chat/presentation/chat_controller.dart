import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:miyaa/features/dashboard/chat/domain/chat_response.dart';

import '../../../../common/network/socket_manager.dart';
import '../../../../common/secure_storage.dart';
import '../../../login/domain/user.dart';
import '../../dashboard/dashboard_controller.dart';
import '../../profile/data/profile_repository.dart';
import '../domain/message_model.dart';
import 'chat_state.dart';

class ChatController extends StateNotifier<ChatState> {
  ChatController({
    required this.profileRepository,
    required this.ref,
  }) : super(const ChatState()) {
    _registerNewMessageListener();
  }

  final ProfileRepository profileRepository;
  final Ref ref;

  void disconnect() {
    SocketManager().emit('user-disconnected');
    SocketManager().disconnect();
    setIsConnected(false);
  }

  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  void setIsSending(bool value) {
    state = state.copyWith(isSending: value);
  }

  void setIsConnected(bool value) {
    state = state.copyWith(isConnected: value);
  }

  void addMessage(Message message) {
    state = state.copyWith(
      messages: [message, ...state.messages],
    );
  }

  void goBackToChats() {
    ref.read(dashboardController.notifier).setCurrentScreen(1);
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

  void sendMessage(
    String messageContent,
    int participantId,
    int currentId,
    String conversationId,
  ) async {
    SocketManager().emit('sendMessage', {
      'message': messageContent,
      'type': 'TEXT',
      'userId': participantId,
      'conversationId': conversationId
    });
    getChatMessages();
  }

  void getChatMessages() {
    setIsLoading(true);
    SocketManager().emit('chat');
    SocketManager().on('chat', (data) {
      log('Refetching chat history: $data}');
      var chats =
          data.map<ChatsResponse>((e) => ChatsResponse.fromJson(e)).toList();
      setChatsResponse(chats);
    });
    setIsLoading(false);
  }

  setChatsResponse(List<ChatsResponse> data) {
    state = state.copyWith(chatsResponse: data);
  }

  void getUsers() {
    setIsLoading(true);
    SocketManager().emit('users');

    SocketManager().on('users', (data) {
      var users = data.map<User>((e) => User.fromJson(e)).toList();
      setUserList(users);
    });
    setIsLoading(false);
  }

  setUserList(List<User> data) {
    state = state.copyWith(users: data);
  }

  joinChat(User user, BuildContext context) {
    setIsLoading(true);
    log('Joining chat with user: ${user.id}');

    SocketManager().emit('selectRoom', {
      'participant': user.id,
    });

    SocketManager().on('conversation/${state.chatRoomId}', (data) {
      var messages = data.map<Message>((e) => Message.fromJson(e)).toList();
      setMessages(messages);
    });

    Future.delayed(const Duration(seconds: 1), () {
      context.pushNamed(
        'chatRoom',
        extra: user,
        pathParameters: {
          'id': state.chatRoomId.toString(),
        },
      );
    });

    setIsLoading(false);

    getChatMessages();
  }

  setMessages(List<Message> data) {
    state = state.copyWith(messages: data);
  }

  cleanMessages() {
    state = state.copyWith(messages: []);
  }

  createChatRoom() {
    // Código comentado
  }

  void joinConversation(int conversationId) {
    SocketManager().emit('joinConversation', {
      'conversationId': conversationId.toString(),
    });
  }

  void getMessages(int? participantId, conversationId) {
    log('Getting messages for user: $participantId');

    if (participantId != null) {
      log('Getting messages for user isnt null: $participantId');

      SocketManager().emit('chatHistory',
          {'id': participantId, 'conversationId': conversationId});
      SocketManager().on('chatHistory', (data) {
        var messages = data.map<Message>((e) => Message.fromJson(e)).toList();
        setMessages(messages);
      });
    } else {
      log('No conversation id');
    }
  }

  setChatRoomId(int id) {
    state = state.copyWith(chatRoomId: id);
  }

  void _registerNewMessageListener() {
    SocketManager().off('newMessage');
    SocketManager().on('newMessage', (data) {
      log('New message received: $data');
      var message = Message.fromJson(data);
      var roomId = data['conversationId'];

      if (roomId == state.chatRoomId) {
        log(' $roomId - ${state.chatRoomId.toString()}');
        addMessage(message);
      } else {
        log('Message is from a different room, ignoring...');
      }
    });
  }
}

final chatControllerProvider =
    StateNotifierProvider<ChatController, ChatState>((ref) {
  return ChatController(
    profileRepository: ref.watch(
      profileRepositoryProvider,
    ),
    ref: ref,
  );
});
