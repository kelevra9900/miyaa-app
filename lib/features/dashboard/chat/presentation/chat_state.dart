import '../../../login/domain/user.dart';
import '../domain/chat_response.dart';
import '../domain/message_model.dart';

class ChatState {
  final bool isLoading;
  final bool isSending;
  final bool isConnected;
  final List<User> users;
  final User? userSelected;
  final int? chatRoomId;
  final List<ChatsResponse> chatsResponse;
  final List<Message> messages;

  final UserResponse? userData;

  const ChatState({
    this.isLoading = false,
    this.isSending = false,
    this.isConnected = false,
    this.users = const [],
    this.userSelected,
    this.chatRoomId,
    this.chatsResponse = const [],
    this.messages = const [],
    this.userData,
  });

  ChatState copyWith({
    bool? isLoading,
    bool? isSending,
    bool? isConnected,
    List<User>? users,
    User? userSelected,
    int? chatRoomId,
    List<ChatsResponse>? chatsResponse,
    List<Message>? messages,
    UserResponse? userData,
  }) {
    return ChatState(
      isLoading: isLoading ?? this.isLoading,
      isSending: isSending ?? this.isSending,
      isConnected: isConnected ?? this.isConnected,
      users: users ?? this.users,
      userSelected: userSelected ?? this.userSelected,
      chatRoomId: chatRoomId ?? this.chatRoomId,
      chatsResponse: chatsResponse ?? this.chatsResponse,
      messages: messages ?? this.messages,
      userData: userData ?? this.userData,
    );
  }
}
