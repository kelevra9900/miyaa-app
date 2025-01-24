import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:miyaa/features/announcements/domain/announcement.dart';

import '../../../../common/network/network_service.dart';

class HomeRepository {
  HomeRepository({required this.client});
  final http.Client client;

  Future<AnnouncementResponse> getAnnouncements() async {
    try {
      var response = await httpService.get(
        endpoint: '/announcement',
        client: client,
      );

      if (response.success == true) {
        return AnnouncementResponse.fromJson(json.decode(response.body ?? ''));
      } else {
        throw response;
      }
    } catch (e) {
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

final homeRepositoryProvider = Provider<HomeRepository>(
  (ref) => HomeRepository(client: http.Client()),
);
