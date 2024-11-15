import 'category.dart';

class CategoryResponse {
  List<Category>? data;
  int? total;
  int? totalPages;
  int? currentPage;
  int? perPage;

  CategoryResponse(
      {this.data, this.total, this.totalPages, this.currentPage, this.perPage});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Category>[];
      json['data'].forEach((v) {
        data!.add(Category.fromJson(v));
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
