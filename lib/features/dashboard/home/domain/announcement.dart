class AnnouncementResponse {
  List<Announcement>? data;
  int? total;
  int? totalPages;
  int? currentPage;
  int? perPage;

  AnnouncementResponse(
      {this.data, this.total, this.totalPages, this.currentPage, this.perPage});

  AnnouncementResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Announcement>[];
      json['data'].forEach((v) {
        data!.add(Announcement.fromJson(v));
      });
    }
    total = json['total'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
    perPage = json['perPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['totalPages'] = totalPages;
    data['currentPage'] = currentPage;
    data['perPage'] = perPage;
    return data;
  }
}

class Announcement {
  int? id;
  String? title;
  String? content;
  String? image;
  String? createdAt;
  String? updatedAt;
  bool? isApproved;
  int? createdBy;

  Announcement(
      {this.id,
      this.title,
      this.content,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.isApproved,
      this.createdBy});

  Announcement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isApproved = json['is_approved'];
    createdBy = json['createdBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['image'] = image;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['is_approved'] = isApproved;
    data['createdBy'] = createdBy;
    return data;
  }
}
