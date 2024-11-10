class AuthResponse {
  String? message;
  int? code;
  String? jwt;
  String? refreshToken;
  String? role;

  AuthResponse({this.message, this.code, this.jwt, this.role});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    jwt = json['jwt'];
    role = json['role'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message ?? '';
    data['code'] = code ?? 0;
    data['jwt'] = jwt ?? '';
    data['role'] = role ?? '';
    data['refreshToken'] = refreshToken ?? '';
    return data;
  }
}
