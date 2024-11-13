import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:miyaa/features/dashboard/chat/domain/chat_response.dart';

import '../../../../common/network/socket_manager.dart';
import '../../../login/domain/user.dart';
import '../domain/message_model.dart';
import 'chat_state.dart';

class ChatController extends StateNotifier<ChatState> {
  ChatController() : super(ChatState()) {
    _registerNewMessageListener();
  }
  init() {
    state = state.copyWith(isLoaded: true);
    connect();
  }

  void initialize(String chatId) {
    getMessages(
      chatId,
    );
  }

  void disconnect() {
    SocketManager().emit('user-disconnected');
    SocketManager().disconnect();
    setIsConnected(false);
  }

  void setIsConnected(bool value) {
    state = state.copyWith(isConnected: value);
  }

  setMessages(dynamic messages) {
    state = state.copyWith(messages: messages);
  }

  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  addMessage(dynamic message) {
    state = state.copyWith(messages: [...state.messages, message]);
  }

  setFileSelected(File? file) {
    state = state.copyWith(fileSelected: file);
  }

  clearFileSelected() {
    state = state.copyWith(fileSelected: null);
  }

  void connect() {
    // chatService.connect();

    // if (chatService.isFirstConnection) {
    //   chatService.connectionEstablished.then((value) {
    //     initialEmit();
    //     listenMessages();
    //   });
    // } else {
    //   listenMessages();
    // }
  }

  void sendMessage(
    String messageContent,
    int chatRoomId,
    int currentId,
  ) async {
    SocketManager().emit('sendMessage', {
      'conversationId': chatRoomId,
      'userId': currentId,
      'message': messageContent,
      'type': 'TEXT',
    });

    log('Sending message: $messageContent');
    log('Current user id: $currentId');
    log('Chat room id: $chatRoomId');
    getChatMessages();
  }

  void sendMessageWithFile(String message, File? file) async {}

  initialEmit() {}

  listenMessages() {}

  void _registerNewMessageListener() {
    SocketManager().off('newMessage');
    SocketManager().on('newMessage', (data) {
      log('New message: $data');
      var message = Message.fromJson(data);
      addMessage(message);
    });
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

  setChatsResponse(List<ChatsResponse> data) {
    state = state.copyWith(chatList: data);
  }

  setChatRoomId(String chatRoomId) {
    state = state.copyWith(chatRoomId: chatRoomId);
  }

  createConversation(User user, BuildContext context) {
    setIsLoading(true);
    log('Joining chat with user: ${user.id}');

    SocketManager().emit('selectRoom', {
      'participant': user.id,
    });

    SocketManager().off('joinedRoom');

    SocketManager().on('joinedRoom', (data) {
      log('Received joinedRoom data: $data');
      setChatRoomId(data['conversationId'].toString());
      if (data['conversationId'] != null) {
        context.pushNamed(
          'chatRoom',
          extra: user,
          pathParameters: {
            'id': data['conversationId'].toString(),
          },
        );
      }

      setIsLoading(false);
    });
  }

  void getMessages(String chatId) {
    SocketManager().emit('chatHistory', {
      'id': chatId,
    });
    SocketManager().on('chatHistory', (data) {
      log('Received chat history: $data');
      var messages = data.map<Message>((e) => Message.fromJson(e)).toList();
      setMessages(messages);
    });
  }

  cleanMessages() {
    state = state.copyWith(messages: []);
  }

  // joinChat(User user, String chatRoomId, BuildContext context) {
  //   setIsLoading(true);
  //   log('Joining chat with user: ${user.id}');

  //   SocketManager().emit('selectRoom', {
  //     'participant': user.id,
  //   });

  //   SocketManager().on('conversation/$chatRoomId', (data) {
  //     var messages = data.map<Message>((e) => Message.fromJson(e)).toList();
  //     setMessages(messages);
  //   });

  //   Future.delayed(const Duration(seconds: 1), () {
  //     context.pushNamed(
  //       'chatRoom',
  //       extra: user,
  //       pathParameters: {
  //         'id': chatRoomId,
  //       },
  //     );
  //   });

  //   setIsLoading(false);

  //   getChatMessages();
  // }
}

final chatControllerProvider =
    StateNotifierProvider<ChatController, ChatState>((ref) {
  return ChatController();
});
