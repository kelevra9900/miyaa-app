class DocumentType {
  int? id;
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;

  DocumentType({this.id, this.name, this.slug, this.createdAt, this.updatedAt});

  DocumentType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class JobPosition {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  List<DocumentType>?
      requireDocuments; // Debe ser una lista de DocumentType o el tipo correcto

  JobPosition(
      {this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.requireDocuments});

  // Deserialización del JSON
  JobPosition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];

    if (json['requireDocuments'] != null) {
      requireDocuments = <DocumentType>[]; // Inicializar como una lista vacía
      json['requireDocuments'].forEach((v) {
        requireDocuments!.add(DocumentType.fromJson(v));
      });
    }
  }

  // Serialización a JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;

    if (requireDocuments != null) {
      data['requireDocuments'] =
          requireDocuments!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
