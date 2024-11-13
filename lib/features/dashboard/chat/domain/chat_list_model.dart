import '../../../login/domain/user.dart';

class ChatListModel {
  int? id;
  User? user;

  ChatListModel({this.id, this.user});

  ChatListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
