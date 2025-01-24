import 'chat_list_model.dart';
import 'message_model.dart';

class ChatsResponse {
  List<Conversations>? conversations;
  Message? latestMessage;
  bool? isGroup;
  int? conversationId;

  ChatsResponse(
      {this.conversations,
      this.latestMessage,
      this.isGroup,
      this.conversationId});

  ChatsResponse.fromJson(Map<String, dynamic> json) {
    if (json['conversations'] != null) {
      conversations = <Conversations>[];
      json['conversations'].forEach((v) {
        conversations!.add(Conversations.fromJson(v));
      });
    }
    latestMessage = json['latestMessage'] != null
        ? Message.fromJson(json['latestMessage'])
        : null;

    isGroup = json['isGroup'];
    conversationId = json['conversationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (conversations != null) {
      data['conversations'] = conversations!.map((v) => v.toJson()).toList();

      data['isGroup'] = isGroup;
      data['conversationId'] = conversationId;
    }
    if (latestMessage != null) {
      data['latestMessage'] = latestMessage!.toJson();
    }
    return data;
  }
}
