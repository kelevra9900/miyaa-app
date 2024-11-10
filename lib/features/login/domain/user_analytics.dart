class UserAnalytics {
  num? documentPercentage;
  List<String>? missingDocuments;

  UserAnalytics({this.documentPercentage, this.missingDocuments});

  UserAnalytics.fromJson(Map<String, dynamic> json) {
    documentPercentage = json['documentPercentage'] != null
        ? json['documentPercentage'] as num
        : 0;

    missingDocuments = json['missingDocuments'] != null
        ? List<String>.from(json['missingDocuments'])
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['documentPercentage'] = documentPercentage;
    data['missingDocuments'] = missingDocuments;
    return data;
  }
}
