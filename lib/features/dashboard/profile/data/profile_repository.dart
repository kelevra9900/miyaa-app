import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:miyaa/common/network/network_service.dart';
import 'package:miyaa/features/login/domain/user.dart';

class ProfileRepository {
  final http.Client client;

  ProfileRepository({required this.client});

  Future<UserResponse> getProfileData() async {
    var response = await httpService.get(
      endpoint: '/users/me',
      client: client,
    );

    if (response.success == true) {
      var jsonData = json.decode(response.body ?? "");
      return UserResponse.fromJson(jsonData);
    } else {
      throw Exception(response.message);
    }
  }
}

final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) => ProfileRepository(client: http.Client()),
);
