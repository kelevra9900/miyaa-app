import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../../common/network/network_service.dart';
import '../domain/announcement.dart';

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
}

final homeRepositoryProvider = Provider<HomeRepository>(
  (ref) => HomeRepository(client: http.Client()),
);
