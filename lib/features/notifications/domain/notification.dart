class NotificationResponse {
  List<NotificationData> notifications;

  NotificationResponse({
    required this.notifications,
  });

  factory NotificationResponse.fromJson(List<dynamic> json) {
    return NotificationResponse(
      notifications: List<NotificationData>.from(
        json.map((x) => NotificationData.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'notifications': List<dynamic>.from(
        notifications.map((x) => x.toJson()),
      ),
    };
  }
}

class NotificationData {
  int id;
  int userId;
  String title;
  String body;
  bool read;
  String createdAt;
  String updatedAt;

  NotificationData({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    required this.read,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      body: json['body'],
      read: json['read'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'body': body,
      'read': read,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
