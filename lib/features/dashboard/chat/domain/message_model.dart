class Message {
  int? id;
  String? content;
  int? conversationId;
  String? createdAt;
  String? type;
  bool? seen;
  int? userId;

  Message(
      {this.id,
      this.content,
      this.conversationId,
      this.createdAt,
      this.type,
      this.seen,
      this.userId});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    conversationId = json['conversationId'];
    createdAt = json['createdAt'];
    type = json['type'];
    seen = json['seen'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    data['conversationId'] = conversationId;
    data['createdAt'] = createdAt;
    data['type'] = type;
    data['seen'] = seen;
    data['userId'] = userId;
    return data;
  }
}
