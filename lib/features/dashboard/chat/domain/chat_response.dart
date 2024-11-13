import 'chat_list_model.dart';
import 'message_model.dart';

class ChatsResponse {
  List<ChatListModel>? conversations;
  Message? latestMessage;

  ChatsResponse({this.conversations, this.latestMessage});

  ChatsResponse.fromJson(Map<String, dynamic> json) {
    if (json['conversations'] != null) {
      conversations = <ChatListModel>[];
      json['conversations'].forEach((v) {
        conversations!.add(ChatListModel.fromJson(v));
      });
    }
    latestMessage = json['latestMessage'] != null
        ? Message.fromJson(json['latestMessage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (conversations != null) {
      data['conversations'] = conversations!.map((v) => v.toJson()).toList();
    }
    if (latestMessage != null) {
      data['latestMessage'] = latestMessage!.toJson();
    }
    return data;
  }
}
