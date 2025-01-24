import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:miyaa/common/network/custom_catch_error.dart';
import '../../../common/network/network_service.dart';
import '../../../common/secure_storage.dart';
import '../../../common/user_preferences.dart';
import '../../init/presentation/splash_screen/utils/init_utils.dart';
import '../domain/auth_response.dart';

class LoginRepository {
  LoginRepository({required this.client});

  final http.Client client;

  Future<dynamic> uploadBiometric({
    required String file,
    required BuildContext? context,
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

        if (data.message == 'User not found') {
          customError.catchError(
              e: 'No hemos encontrado coincidencias', context: context!);
        }

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

  Future getUserData() async {
    try {
      final response = await httpService.get(
        endpoint: '/users/me',
      );

      if (response.body != null) {
        var decoded = json.decode(response.body!);

        secureStorage.setUserData(response.body ?? "");
        String fcmToken = await initUtils.getFcmToken() ?? "";
        if (fcmToken != "") {
          await updateFCMToken(fcmToken);
        }
        log('Response getUserData: $decoded');
        return decoded;
      } else {
        log('Response body is null');
        throw Exception('Failed to get user data');
      }
    } catch (e) {
      log('Error to get user data on repository ========: $e');
      rethrow;
    }
  }

  Future<dynamic> updateFCMToken(String token) async {
    try {
      Map<String, dynamic> body = {
        'fcmToken': token,
      };

      var response = await httpService.patch(
        endpoint: '/users/fcm',
        client: client,
        body: body,
        needAuth: true,
      );

      log('Response updateFCMToken: ${response.body}');

      // if (response.success == true) {
      //   return response.body!;
      // } else {
      //   throw response;
      // }
      return 'Test';
    } catch (e) {
      rethrow;
    }
  }
}

final loginRepositoryProvider = Provider<LoginRepository>(
  (ref) => LoginRepository(client: http.Client()),
);
