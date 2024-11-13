import 'dart:io';

import '../../../login/domain/user.dart';
import '../domain/chat_response.dart';

class ChatState {
  final dynamic messages;
  final String? message;
  final File? fileSelected;
  final bool isLoaded;
  final List<User> users;
  final bool isConnected;
  final String? chatRoomId;
  final int page;
  final int limit;
  final bool isLoading;
  final List<ChatsResponse> chatList;

  ChatState({
    this.messages = const [],
    this.users = const [],
    this.isLoaded = false,
    this.isConnected = false,
    this.isLoading = false,
    this.fileSelected,
    this.message,
    this.page = 1,
    this.limit = 50,
    this.chatRoomId,
    this.chatList = const [],
  });

  ChatState copyWith({
    bool? isLoading,
    dynamic messages,
    bool? isLoaded,
    bool? isConnected,
    File? fileSelected,
    String? message,
    int? page,
    int? limit,
    String? chatRoomId,
    List<User>? users,
    List<ChatsResponse>? chatList,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      users: users ?? this.users,
      isLoaded: isLoaded ?? this.isLoaded,
      isConnected: isConnected ?? this.isConnected,
      fileSelected: fileSelected ?? this.fileSelected,
      message: message ?? this.message,
      page: page ?? this.page,
      limit: limit ?? this.limit,
      chatRoomId: chatRoomId ?? this.chatRoomId,
      isLoading: isLoading ?? this.isLoading,
      chatList: chatList ?? this.chatList,
    );
  }
}
