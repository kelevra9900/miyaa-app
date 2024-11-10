import 'job_position.dart';
import 'sector.dart';
import 'shift.dart';
import 'user_analytics.dart';

class UserResponse {
  User? user;
  UserAnalytics? analytics;

  UserResponse({this.user, this.analytics});

  UserResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    analytics = json['analytics'] != null
        ? UserAnalytics.fromJson(json['analytics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (analytics != null) {
      data['analytics'] = analytics!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? email;
  String? passwordHash;
  String? firstName;
  String? lastName;
  String? middleName;
  String? image;
  bool? emailVerified;
  String? birthDate;
  String? registrationDate;
  String? role;
  bool? banned;
  String? fcm;
  int? environmentId;
  String? lastSeen;
  bool? online;
  int? jobPositionId;
  JobPosition? jobPosition;
  int? shiftId;
  int? sectorId;
  String? icon;
  Shift? shift;
  Sector? sector;
  List<dynamic>? documents;

  User(
      {this.id,
      this.username,
      this.email,
      this.passwordHash,
      this.firstName,
      this.lastName,
      this.middleName,
      this.image,
      this.emailVerified,
      this.birthDate,
      this.registrationDate,
      this.role,
      this.banned,
      this.fcm,
      this.environmentId,
      this.lastSeen,
      this.online,
      this.jobPositionId,
      this.jobPosition,
      this.shiftId,
      this.sectorId,
      this.icon,
      this.shift,
      this.sector,
      this.documents});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    passwordHash = json['passwordHash'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    middleName = json['middleName'];
    image = json['image'];
    emailVerified = json['emailVerified'];
    birthDate = json['birthDate'];
    registrationDate = json['registrationDate'];
    role = json['role'];
    banned = json['banned'];
    fcm = json['fcm'];
    environmentId = json['environmentId'];
    lastSeen = json['lastSeen'];
    online = json['online'];
    jobPositionId = json['jobPositionId'];

    // Relación con JobPosition
    jobPosition = json['jobPosition'] != null
        ? JobPosition.fromJson(json['jobPosition'])
        : null;

    shiftId = json['shiftId'];
    sectorId = json['sectorId'];
    icon = json['icon'];
    shift = json['shift'] != null ? Shift.fromJson(json['shift']) : null;
    sector = json['sector'] != null ? Sector.fromJson(json['sector']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['passwordHash'] = passwordHash;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['middleName'] = middleName;
    data['image'] = image;
    data['emailVerified'] = emailVerified;
    data['birthDate'] = birthDate;
    data['registrationDate'] = registrationDate;
    data['role'] = role;
    data['banned'] = banned;
    data['fcm'] = fcm;
    data['environmentId'] = environmentId;
    data['lastSeen'] = lastSeen;
    data['online'] = online;
    data['jobPositionId'] = jobPositionId;

    if (jobPosition != null) {
      data['jobPosition'] = jobPosition!.toJson();
    }

    data['shiftId'] = shiftId;
    data['sectorId'] = sectorId;
    data['icon'] = icon;
    if (shift != null) {
      data['shift'] = shift!.toJson();
    }
    if (sector != null) {
      data['sector'] = sector!.toJson();
    }

    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
