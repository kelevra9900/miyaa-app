import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../../../common/network/network_service.dart';
import '../../../common/secure_storage.dart';
import '../../../common/user_preferences.dart';
import '../domain/auth_response.dart';

class LoginRepository {
  LoginRepository({required this.client});

  final http.Client client;

  Future<dynamic> uploadBiometric({
    required String file,
  }) async {
    try {
      var response = await httpService.postMultipart(
        endpoint: '/auth/biometrics',
        body: {
          'image': await http.MultipartFile.fromPath('file', file),
          'latitude': prefs.latitude,
          'longitude': prefs.longitude,
        },
      );

      log('Response uploadBiometric: ${response.body}');

      if (response.body != null) {
        var decoded = json.decode(response.body!);
        var data = AuthResponse.fromJson(decoded);
        log('Response login: $decoded');

        if (data.jwt != null) await secureStorage.setJwt(data.jwt!);

        await secureStorage.setIsLoggedIn(true);
        return data;
      } else {
        log('Response body is null');
        throw Exception('Failed to upload biometric data');
      }
    } catch (e) {
      log('Error to upload image on repository ========: $e');
      rethrow;
    }
  }

  Future loginWithCredentials({
    required String email,
    required String password,
  }) async {
    try {
      final response = await httpService.post(
        endpoint: '/auth/login',
        body: {
          'identifier': email,
          'password': password,
        },
      );
      if (response.body != null) {
        var decoded = json.decode(response.body!);
        var data = AuthResponse.fromJson(decoded);
        log('Response login: ${response.body}');

        if (data.jwt != null && data.refreshToken != null) {
          await secureStorage.setRefreshToken(data.refreshToken!);
          await secureStorage.setJwt(data.jwt!);
        }

        await secureStorage.setIsLoggedIn(true);
        return data;
      } else {
        log('Response body is null');
        throw Exception('Failed to login');
      }
    } catch (e) {
      rethrow;
    }
  }
}

final loginRepositoryProvider = Provider<LoginRepository>(
  (ref) => LoginRepository(client: http.Client()),
);
