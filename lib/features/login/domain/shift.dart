class Shift {
  int? id;
  String? name;
  String? start;
  String? end;
  String? createdAt;
  String? updatedAt;

  Shift(
      {this.id,
      this.name,
      this.start,
      this.end,
      this.createdAt,
      this.updatedAt});

  Shift.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    start = json['start'];
    end = json['end'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['start'] = start;
    data['end'] = end;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
